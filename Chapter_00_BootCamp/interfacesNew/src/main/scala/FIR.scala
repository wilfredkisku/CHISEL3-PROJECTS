import chisel3._
import chisel3.util._
import chisel3.tester._
import chisel3.tester.RawTester.test

class FIR(b0: Int, b1: Int, b2: Int, b3: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(8.W))
    val out = Output(UInt(8.W))
  })


  val inp = Wire(UInt(8.W))
  inp := io.in
  val x_n1 = RegNext(inp, 0.U)
  val x_n2 = RegNext(x_n1, 0.U)
  val x_n3 = RegNext(x_n2, 0.U)
  io.out := io.in * b0.U(8.W) +
    x_n1 * b1.U(8.W) +
    x_n2 * b2.U(8.W) +
    x_n3 * b3.U(8.W)

}

object FIRMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new FIR(1,1,1,1))
}