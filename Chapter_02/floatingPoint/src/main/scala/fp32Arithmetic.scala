import chisel3._
import chisel3.util._

class fp32Arithmetic extends Module{
val io = IO(new Bundle{
    val fpNumber = Input(UInt(32.W))
    val sign = Output(Bool())
    val exp = Output(UInt(8.W))
    val mantissa = Output(UInt((32 - 9).W))
})

  io.sign := io.fpNumber(31)
  io.exp := io.fpNumber(30,23)
  io.mantissa := io.fpNumber(22,0)

}

object fp32ArithmeticMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new fp32Arithmetic())
}