import chisel3._

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

  when (zeroFlagA && zeroFlagB){
    //check for both numbers to be zero --> result to be zero
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
  }.otherwise{
  //final condition for addition
    when(subFlagA && subFlagB){
    //both the numbers are subnormal
      io.output := 0.U
    }.elsewhen(!subFlagA && !subFlagB){
    //both the numbers are normal
      io.output := 0.U
    }.otherwise{
    //any one of the numbers can be subnormal
      io.output := 0.U
    }
    //io.output := 0.U
  }

}

object FP8_ADD_MAIN extends App{
  println((new chisel3.stage.ChiselStage).emitVerilog(new FP8_ADD))
}