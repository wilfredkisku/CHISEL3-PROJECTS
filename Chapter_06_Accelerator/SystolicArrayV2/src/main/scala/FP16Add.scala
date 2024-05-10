import chisel3._
import chisel3.util._

class FP16Add extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(16.W))
    val b = Input(UInt(16.W))
    val result = Output(UInt(16.W))
  })

  // Extract sign, exponent, and significand
  def extractFP(fp: UInt) = {
    val sign = fp(15)
    val exponent = fp(14, 10)
    val significand = fp(9, 0)
    (sign, exponent, significand)
  }

  //Normalize the bigger number relative to the smaller number
//  def Normalize(expa : UInt, expb : UInt) = {
//    val diff = UInt(5.W)
//    val shft = UInt(5.W)
//    val (numa, numb) = (expa, expb)
//    when (expa > expb){
//      diff := expa - expb
//      shft := diff << sigA
//    }
//      .otherwise{
//        diff := expb - expa
//        shft := diff << sigB
//      }
//    shft
//  }

  val (signA, expA, sigA) = extractFP(io.a)
  val (signB, expB, sigB) = extractFP(io.b)

  val zeroFlagA = expA === 0.U && sigA === 0.U
  val zeroFlagB = expB === 0.U && sigB === 0.U

  //val subnormalA = expA === 0.U && sigA =/= 0.U
  //val subnormalB = expB === 0.U && sigB =/= 0.U

  val infFlagA = expA === "b11111".U && sigA === 0.U
  val infFlagB = expB === "b11111".U && sigB === 0.U

  val subNormA = expA === 0.U && sigA =/= 0.U
  val subNormB = expB === 0.U && sigB =/= 0.U

  val diff = Wire(UInt(5.W))
  val overflow = Wire(UInt(12.W))
  overflow := 0.U
  diff := 0.U
  //norm := 0.U
  when(zeroFlagA && zeroFlagB) {
    // HANDLE BOTH ZEROS
      io.result := 0.U
    }
    .elsewhen (!zeroFlagA && zeroFlagB){
      //HANDLE B === 0.U
      io.result := io.a
    }.elsewhen (zeroFlagA && !zeroFlagB){
      //HANDLE A === 0.U
      io.result := io.b
    }.elsewhen (infFlagA || infFlagB){
      //HANDLE EITHER NUMBER INF
      when(infFlagA && infFlagB && (signA =/= signB)){
        // Inf - Inf = NaN
        io.result := "b0111111111111111".U // NaN representation (sign does not matter)
      }.otherwise {
        // One or both are infinity, result is infinity with the sign of A or B
        // If signs are different in subtraction, this would need more logic
        io.result := Mux(infFlagA, io.a, io.b)
      }
    }.elsewhen (((sigA === "b11111".U) && (expA === "b1111111111".U)) || ((sigB === "b11111".U) && (expB === "b1111111111".U))){
      io.result := "b0111111111111111".U // NaN representation (sign does not matter)
    }.otherwise{
    // ACTUAL ADDITION OF FP16 NUMBERS
    // LOGIC FOR NORMAL AND SUBNORMAL NUMBERS
    when (!subNormA && !subNormB){


        when(expA === expB) {
          // The numbers are not subnormal and the exponents are the same
          // no need to normalize
          when(signA === 0.U && signB === 0.U){
            //overflow := (Cat(1.U, sigA) +& Cat(1.U, sigB))
            //need to clamp to b11111.U of exponent overflow
            io.result := Mux((Cat(1.U, sigA) +& Cat(1.U, sigB))(11) === 1.U, Cat(signA, expA + 1.U, (Cat(1.U, sigA) +& Cat(1.U, sigB))(10, 1)), Cat(signA, expA, (Cat(1.U, sigA) +& Cat(1.U, sigB))(9,0)))
          }.elsewhen(signA === 1.U && signB === 0.U){
            //overflow := Mux(sigB >= sigA, Cat(1.U, sigB) - Cat(1.U, sigA), Cat(1.U, sigA) - Cat(1.U, sigB))
            io.result := Mux(sigB >= sigA, Cat(0.U, expB, (Cat(1.U, sigB) - Cat(1.U, sigA))(9,0)), Cat(1.U, expA, (Cat(1.U, sigA) - Cat(1.U, sigB))(9,0)))
          }.elsewhen(signA === 0.U && signB === 1.U){
            io.result := Mux(sigB >= sigA, Cat(1.U, expB, (Cat(1.U, sigB) - Cat(1.U, sigA))(9,0)), Cat(0.U, expA, (Cat(1.U, sigA) - Cat(1.U, sigB))(9,0)))
          }.otherwise{
            io.result := Mux((Cat(1.U, sigA) +& Cat(1.U, sigB))(11) === 1.U, Cat(signA, expA + 1.U, (Cat(1.U, sigA) +& Cat(1.U, sigB))(10, 1)), Cat(signA, expA, (Cat(1.U, sigA) +& Cat(1.U, sigB))(9,0)))
          }
        }.elsewhen(expA > expB) {
          //logic for exponentA is gt than exponentB
          // step-1 normalize expB -> right shift (diff := expA - expB)
          // step-2 operate as numA gt numB
          //diff := expA - expB
          // step-3 numbers can become NaN, Zero, +Inf, -Inf

              when(signA === 0.U){
                    io.result := Mux(signB === 0.U, Cat(0.U, expA, Cat(1.U, sigA) + Cat(0.U, sigB >> (expA-expB))), Cat(0.U, expA, Cat(1.U, sigA) - Cat(1.U, sigB >> (expA-expB))))
              }.otherwise{
                io.result := Mux(signB === 0.U, Cat(1.U, expA, Cat(1.U, sigA) - Cat(0.U, sigB >> (expA-expB))), Cat(1.U, expA, Cat(1.U, sigA) + Cat(1.U, sigB >> (expA-expB))))
              }

        }.otherwise{

          when(signB === 0.U){
            io.result := Mux(signA === 0.U, Cat(0.U, expB, Cat(1.U, sigB) + Cat(0.U, sigA >> (expB-expA))), Cat(0.U, expB, Cat(1.U, sigB) - Cat(1.U, sigA >> (expB-expA))))
          }.otherwise{
            io.result := Mux(signA === 0.U, Cat(1.U, expB, Cat(1.U, sigB) - Cat(0.U, sigA >> (expB-expA))), Cat(1.U, expB, Cat(1.U, sigB) + Cat(1.U, sigA >> (expB-expA))))
          }

        }
    }
      .elsewhen(subNormA && subNormB){
        io.result := 0.U
      }.otherwise{
        io.result := 0.U
      }
    // Overflow is not being handled
    //MAIN FP ADD LOGIC
    //CHECK FOR SUBNORMAL NUMBERS
//      when(expA > expB){
//        // LOGIC WHEN EXPA > EXPB
//        norm := ((Cat(1.U, sigB)) >> (expA - expB))(9,0)
//        io.result := Mux(signA === 0.U, Mux(signB === 0.U, Cat(0.U,expA,sigA + norm), Cat(0.U, expA, sigA - norm)), Mux(signB === 0.U, Cat(1.U,expA,sigA - norm), Cat(1.U, expA, sigA + norm)))
//      }.elsewhen(expA === expB){
//        //INCLUDE SUBNORMAL NUMBER COMPUTATION
//        // (-/+1) * (1.<SIG> * 2<EXP-15>)
//        // (-/+1) * (0.<SIG> * 2<EXP-15>)
//        //when exponents are equal but not zer (not subnormal)
//        when(!subNormA && !subNormB){
//          //val sum1 := Cat(1, sigA) + Cat(1
//          when(sigA > sigB){
//          io.result := Mux(signA === 0.U, Mux(signB === 0.U, Cat(0.U,expA,sigA + sigB), Cat(0.U, expA, sigA - sigB)), Mux(signB === 0.U, Cat(1.U,expA,sigA - sigB), Cat(1.U, expA, sigA + sigB)))
//          }
//          .elsewhen (sigB > sigA){
//            io.result := Mux(signB === 0.U, Mux(signA === 0.U, Cat(0.U,expB,sigB + sigA), Cat(0.U, expB, sigB - sigA)), Mux(signA === 0.U, Cat(1.U,expB,sigB - sigA), Cat(1.U, expB, sigB + sigA)))
//          }
//            .otherwise{
//              when(signA =/= signB){
//              io.result := 0.U
//              }.otherwise{
//              io.result := Cat(signA, expA, signA + sigB)
//              }
//          }
//          }.elsewhen(!subNormA && subNormB){
//
//          }.elsewhen(subNormA && !subNormB){
//
//          }.otherwise{
//
//          }
//      }.otherwise{
//        // LOGIC WHEN EXPB > EXPA
//        norm := ((Cat(1.U, sigA)) >> (expB - expA))(9,0)
//        io.result := Mux(signB === 0.U, Mux(signA === 0.U, Cat(0.U,expB,sigB + norm), Cat(0.U, expB, sigB - norm)), Mux(signA === 0.U, Cat(1.U,expB,sigB - norm), Cat(1.U, expB, sigB + norm)))
//      }
    }
}

object FP16AddMain extends App{
  println((new chisel3.stage.ChiselStage).emitVerilog(new FP16Add))
}