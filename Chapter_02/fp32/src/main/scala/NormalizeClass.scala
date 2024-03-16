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
  number := (23.U - 1.U) - PriorityEncoder(Reverse(io.mantissa))

  io.shift := number
  io.normMantissa := io.mantissa << number + 1.U

}

object NormalizeClassMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new NormalizeClass())
}