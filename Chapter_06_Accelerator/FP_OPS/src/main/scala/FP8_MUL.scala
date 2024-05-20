import chisel3._
import chisel3.util._

class FP8_MUL extends Module{
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

    //val ovrChk_8 = Wire(UInt(8.W))
    val ovrChk_6 = Wire(UInt(6.W))
    val sigMul_6 = Wire(UInt(6.W))
    ovrChk_6 := "b000000".U
    sigMul_6 := "b000000".U

  when (zeroFlagA && zeroFlagB){
    //check for both numbers to be zero --> result to be zero
    io.output := "b00000000".U
  }.elsewhen(zeroFlagA || zeroFlagB){
    io.output := "b00000000".U
  }.elsewhen(infFlagA || infFlagB){
    //check for any number to be infinite
    when (infFlagA && infFlagB && (signA =/= signB)){
      io.output := "b01111111".U
    }.otherwise{
      io.output := Mux(infFlagA, io.inputA, io.inputB)
    }
  }.elsewhen(nanFlagA || nanFlagB){
    io.output := "b01111111".U
  }.otherwise {
    //evaluate the exponent
    ovrChk_6 := expA +& expB
    sigMul_6 := Cat(!subFlagA,sigA) * Cat(!subFlagB,sigB)
    when(ovrChk_6 > 45.U){
      io.output := Cat(signA ^ signB, "b1111100".U)
    }.elsewhen(ovrChk_6 < 15.U){
      io.output := "b00000000".U
    }.otherwise{
      //Multiplication logic
      io.output := Cat(signA ^ signB, ovrChk_6(4,0) + 1.U + sigMul_6(5), (sigMul_6 >> sigMul_6(5))(3,2))
    }
  }
}

object FP8_MUL_MAIN extends App{
  println((new chisel3.stage.ChiselStage).emitVerilog(new FP8_MUL))
}
