import chisel3._
import chisel3.util._

class NormalizeClass extends Module {
  val io = IO(new Bundle{
    val mantissa = Input(UInt(23.W))
    val normMantissa = Output(UInt(23.W))
    val shift = Output(UInt(log2Ceil(23).W))
  })

  //val normalized = Wire(UInt(23.W))
  val number = Wire(UInt(log2Ceil(23).W))
  number := PriorityEncoder(Reverse(io.mantissa)) + 1.U

  io.shift := number
  io.normMantissa := io.mantissa << number

}

object NormalizeClassMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new NormalizeClass())
}