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

  val infFlagA = expA === "b11111".U && sigA === 0.U
  val infFlagB = expB === "b11111".U && sigB === 0.U

  val shift = UInt(11.W)

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
    }.otherwise{
    //MAIN FP ADD LOGIC
    // CHECK FOR SUBNORMAL NUMBERS
      when(expA > expB){
        // LOGIC WHEN EXPA > EXPB
        //shift := (Cat(1.U, sigB) >> (expA - expB))(10,1)
      }.elsewhen(expA === expB){
          //
          when(sigA > sigB){
          io.result := Mux(signA === 0.U, Mux(signB === 0.U, Cat(0.U,expA,sigA + sigB), Cat(0.U, expA, sigA - sigB)), Mux(signB === 0.U, Cat(1.U,expA,sigA - sigB), Cat(1.U, expA, sigA + sigB)))
          }
          .elsewhen (sigB > sigA){
            io.result := Mux(signB === 0.U, Mux(signA === 0.U, Cat(0.U,expB,sigB + sigA), Cat(0.U, expB, sigB - sigA)), Mux(signA === 0.U, Cat(1.U,expB,sigB - sigA), Cat(1.U, expB, sigB + sigA)))
          }.otherwise{
           io.result := 0.U
          }
      }.otherwise{
        // LOGIC WHEN EXPB > EXPA
      }
    }
}

object FP16AddMain extends App{
  println((new chisel3.stage.ChiselStage).emitVerilog(new FP16Add))
}