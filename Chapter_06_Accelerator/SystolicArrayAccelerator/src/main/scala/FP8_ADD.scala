import chisel3._
import chisel3.util._

class FP8_ADD extends Module{
val io = IO(new Bundle{
  val inputA = Input(UInt(8.W))
  val inputB = Input(UInt(8.W))
  val output = Output(UInt(8.W))
})

  // Extract sign, exponent, and significand
  def extractFP(fp: UInt) = {
    val sign = fp(7)
    val exponent = fp(6, 2)
    val significand = fp(1, 0)
    (sign, exponent, significand)
  }

  // extract different bit fields
  val (signA, expA, sigA) = extractFP(io.inputA)
  val (signB, expB, sigB) = extractFP(io.inputB)

  //check for infinity
  val infFlagA = expA === "b11111".U && sigA === "b00".U
  val infFlagB = expB === "b11111".U && sigB === "b00".U

  //check for zero
  val zeroFlagA = expA === "b00000".U && sigA === "b00".U
  val zeroFlagB = expB === "b00000".U && sigB === "b00".U

  //check for NaN
  val nanFlagA = expA === "b11111".U && sigA =/= "b00".U
  val nanFlagB = expB === "b11111".U && sigB =/= "b00".U

  //check for subnormal
  val subFlagA = expA === "b00000".U && sigA =/= "b00".U
  val subFlagB = expB === "b00000".U && sigB =/= "b00".U

  //check conditions
  val ovrChk_a = Wire(UInt(4.W))
  val ovrChk_s = Wire(UInt(4.W))
  //val difChk = Wire(UInt(5.W))
  ovrChk_a := "b0000".U
  ovrChk_s := "b0000".U
  //difChk := "b00000".U

  val ovrChk_a_n = Wire(UInt(3.W))
  val ovrChk_s_n = Wire(UInt(3.W))
  ovrChk_a_n := "b000".U
  ovrChk_s_n := "b000".U

  when (zeroFlagA && zeroFlagB){
    //check for both numbers to be zero --> result to be zero
    io.output := "b00000000".U
  }.elsewhen(zeroFlagA || zeroFlagB){
    io.output := Mux(zeroFlagA, io.inputB, io.inputA)
  }.elsewhen(infFlagA || infFlagB){
    //check for any number to be infinite
    when (infFlagA && infFlagB && (signA =/= signB)){
      io.output := "b01111111".U
    }.otherwise{
      io.output := Mux(infFlagA, io.inputA, io.inputB)
    }
  }.elsewhen(nanFlagA || nanFlagB){
    io.output := "b01111111".U
  }.otherwise{
  //final condition for addition
    when(subFlagA && subFlagB){

      //both the numbers are subnormal
      when(sigA > sigB){
        ovrChk_a_n := Cat(0.U, sigA) +& Cat(0.U, sigB)
        ovrChk_s_n := Cat(0.U, sigA) - Cat(0.U, sigB)
        io.output := Mux(signA === 0.U, Cat(signA, Mux(signB === 0.U, Cat(expA + ovrChk_a_n(2), ovrChk_a_n(1,0)), Cat(expA + ovrChk_s_n(2), ovrChk_s_n(1,0)))), Cat(signA, Mux(signB === 0.U, Cat(expA + ovrChk_s_n(2), ovrChk_s_n(1,0)), Cat(expA + ovrChk_a_n(2), ovrChk_a_n(1,0)))))
      }.elsewhen(sigB > sigA){
        ovrChk_a_n := Cat(0.U, sigB) +& Cat(0.U, sigA)
        ovrChk_s_n := Cat(0.U, sigB) - Cat(0.U, sigA)
        io.output := Mux(signB === 0.U, Cat(signB, Mux(signA === 0.U, Cat(expB + ovrChk_a_n(2), ovrChk_a_n(1,0)), Cat(expB + ovrChk_s_n(2), ovrChk_s_n(1,0)))), Cat(signB, Mux(signA === 0.U, Cat(expB + ovrChk_s_n(2), ovrChk_s_n(1,0)), Cat(expB + ovrChk_a_n(2), ovrChk_a_n(1,0)))))
      }.otherwise{
        ovrChk_a_n := Cat(0.U, sigB) +& Cat(0.U, sigA)
        //ovrChk_s_n := Cat(0.U, sigB) - Cat(0.U, sigA)
        io.output := Mux(signB =/= signA, 0.U, Cat(signA, expA + ovrChk_a_n(2), ovrChk_a_n(1,0)))
      }
      //io.output := 0.U

    }.elsewhen(!subFlagA && !subFlagB){

      //independent of the future calculations
      //ovrChk(3) --> if overflow then set else unset
      //ovrChk(2) --> set as normal number
      //ovrChk(1,0) --> field for significand of the result
      //ovrChk := Cat(1.U,sigA) +& Cat(1.U, sigB)
      //both the numbers are normal
      when(expA > expB){
        //difChk := expA - expB
        ovrChk_a := Cat(1.U, sigA) +& (Cat(1.U, sigB) >> (expA - expB)).asUInt
        ovrChk_s := Cat(1.U, sigA) - (Cat(1.U, sigB) >> (expA - expB)).asUInt
        io.output := Mux(signA === 0.U, Cat(signA, Mux(signB === 0.U, Cat(expA + ovrChk_a(3), (ovrChk_a >> ovrChk_a(3))(1,0)), Cat(expA + ovrChk_s(3), (ovrChk_s >> ovrChk_s(3))(1,0)))), Cat(signA, Mux(signB === 0.U, Cat(expA + ovrChk_s(3), (ovrChk_s >> ovrChk_s(3))(1,0)), Cat(expA + ovrChk_a(3), (ovrChk_a >> ovrChk_a(3))(1,0)))))
        //io.output := Mux(signA === 0.U, Cat(signA, expA + ovrChk_a(3), Mux(signB === 0.U, (ovrChk_a >> ovrChk_a(3))(1,0), (ovrChk_s >> ovrChk_s(3))(1,0))), Cat(signA, expA + ovrChk_a(3), Mux(signB === 0.U, (ovrChk_s >> ovrChk_s(3))(1,0), (ovrChk_a >> ovrChk_a(3))(1,0))))
      }.elsewhen(expB > expA){
        //difChk := expA - expB
        ovrChk_a := Cat(1.U, sigB) +& (Cat(1.U, sigA) >> (expB - expA)).asUInt
        ovrChk_s := Cat(1.U, sigB) - (Cat(1.U, sigA) >> (expB - expA)).asUInt
        io.output := Mux(signB === 0.U, Cat(signB, Mux(signA === 0.U, Cat(expB + ovrChk_a(3), (ovrChk_a >> ovrChk_a(3))(1,0)), Cat(expB + ovrChk_s(3), (ovrChk_s >> ovrChk_s(3))(1,0)))), Cat(signB, Mux(signA === 0.U, Cat(expB + ovrChk_s(3), (ovrChk_s >> ovrChk_s(3))(1,0)), Cat(expB + ovrChk_a(3), (ovrChk_a >> ovrChk_a(3))(1,0)))))
        //io.output := Mux(signB === 0.U, Cat(signB, expB + ovrChk_a(3), Mux(signA === 0.U, (ovrChk_s >> ovrChk_s(3))(1,0), (ovrChk_a >> ovrChk_a(3))(1,0))), Cat(signB, expB + ovrChk_a(3), Mux(signA === 0.U, (ovrChk_a >> ovrChk_a(3))(1,0), (ovrChk_s >> ovrChk_s(3))(1,0))))
      }.otherwise{
        ovrChk_a := Cat(1.U, sigB) +& (Cat(1.U, sigA) >> (expB - expA)).asUInt
        ovrChk_s := Cat(1.U, sigB) - (Cat(1.U, sigA) >> (expB - expA)).asUInt
        //io.output := Mux(signB === 0.U, Cat(signB, expB, Mux(signA === 0.U, ovrChk_s(1,0), ovrChk_a(1,0))), Cat(signB, expB, Mux(signA === 0.U, ovrChk_a(1,0), ovrChk_s(1,0))))
        when(sigA > sigB){
          io.output := Mux(signA === 0.U, Cat(signA, Mux(signB === 0.U, Cat(expA + ovrChk_a(3), (ovrChk_a >> ovrChk_a(3))(1,0)), Cat(expA + ovrChk_s(3), (ovrChk_s >> ovrChk_s(3))(1,0)))), Cat(signA, Mux(signB === 0.U, Cat(expA + ovrChk_s(3), (ovrChk_s >> ovrChk_s(3))(1,0)), Cat(expA + ovrChk_a(3), (ovrChk_a >> ovrChk_a(3))(1,0)))))
          //io.output := Mux(signA === 0.U, Cat(signA, expA + ovrChk_a(3), Mux(signB === 0.U, (ovrChk_a >> ovrChk_a(3))(1,0), (ovrChk_s >> ovrChk_s(3))(1,0))), Cat(signA, expA + ovrChk_a(3), Mux(signB === 0.U, (ovrChk_s >> ovrChk_s(3))(1,0), (ovrChk_a >> ovrChk_a(3))(1,0))))
        }.elsewhen(sigB > sigA){
          io.output := Mux(signB === 0.U, Cat(signB, Mux(signA === 0.U, Cat(expB + ovrChk_a(3), (ovrChk_a >> ovrChk_a(3))(1,0)), Cat(expB + ovrChk_s(3), (ovrChk_s >> ovrChk_s(3))(1,0)))), Cat(signB, Mux(signA === 0.U, Cat(expB + ovrChk_s(3), (ovrChk_s >> ovrChk_s(3))(1,0)), Cat(expB + ovrChk_a(3), (ovrChk_a >> ovrChk_a(3))(1,0)))))
          //io.output := Mux(signB === 0.U, Cat(signB, expB + ovrChk_a(3), Mux(signA === 0.U, (ovrChk_s >> ovrChk_s(3))(1,0), (ovrChk_a >> ovrChk_a(3))(1,0))), Cat(signB, expB + ovrChk_a(3), Mux(signA === 0.U, (ovrChk_a >> ovrChk_a(3))(1,0), (ovrChk_s >> ovrChk_s(3))(1,0))))
        }.otherwise{
          io.output := Mux(signA =/= signB, 0.U, Cat(signA, expA + ovrChk_a(3), (ovrChk_a >> ovrChk_a(3))(1,0)))
          //io.output := Mux(signA =/= signB, 0.U, Cat(signA, expA + ovrChk_a(3), (ovrChk_a >> ovrChk_a(3))(1,0)))
        }
      }
      //io.output := 0.U

    }.otherwise{

      //any one of the numbers can be subnormal
      when(subFlagB){
        ovrChk_a := Cat(1.U, sigA) +& (Cat(0.U, sigB) >> (expA - expB)).asUInt
        ovrChk_s := Cat(1.U, sigA) - (Cat(0.U, sigB) >> (expA - expB)).asUInt
        io.output := Mux(signA === 0.U, Cat(signA, Mux(signB === 0.U,Cat(expA + ovrChk_a(3), (ovrChk_a >> ovrChk_a(3))(1,0)),Cat(expA + ovrChk_s(3), (ovrChk_s >> ovrChk_s(3))(1,0)))), Cat(signA, Mux(signB === 0.U,Cat(expA + ovrChk_s(3), (ovrChk_s >> ovrChk_s(3))(1,0)),Cat(expA + ovrChk_a(3), (ovrChk_a >> ovrChk_a(3))(1,0)))))
      }.otherwise{
        ovrChk_a := Cat(1.U, sigB) +& (Cat(0.U, sigA) >> (expB - expA)).asUInt
        ovrChk_s := Cat(1.U, sigB) - (Cat(0.U, sigA) >> (expB - expA)).asUInt
        io.output := Mux(signB === 0.U, Cat(signB, Mux(signA === 0.U,Cat(expB + ovrChk_a(3), (ovrChk_a >> ovrChk_a(3))(1,0)),Cat(expB + ovrChk_s(3), (ovrChk_s >> ovrChk_s(3))(1,0)))), Cat(signB, Mux(signA === 0.U,Cat(expB + ovrChk_s(3), (ovrChk_s >> ovrChk_s(3))(1,0)),Cat(expB + ovrChk_a(3), (ovrChk_a >> ovrChk_a(3))(1,0)))))
      }
      //io.output := 0.U


    }
    //io.output := 0.U
  }

}

object FP8_ADD_MAIN extends App{
  println((new chisel3.stage.ChiselStage).emitVerilog(new FP8_ADD))
}