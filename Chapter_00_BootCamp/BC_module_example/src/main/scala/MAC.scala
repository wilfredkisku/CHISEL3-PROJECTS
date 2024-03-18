import chisel3._
import chisel3.util._

class MAC extends Module {
  val io = IO(new Bundle {
    val in_a = Input(UInt(4.W))
    val in_b = Input(UInt(4.W))
    val in_c = Input(UInt(4.W))
    val out  = Output(UInt(8.W))
  })
  io.out := (io.in_a * io.in_b) + io.in_c
}


object MACMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new MAC())
}