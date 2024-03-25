import chisel3._
import chisel3.util._
import chiseltest._
import chiseltest.RawTester.test


class MyMux extends Module {
  val io = IO(new Bundle {
    val s   = Input(Bool())
    val in0 = Input(Bool())
    val in1 = Input(Bool())
    val out = Output(Bool())
  })
  io.out := Mux(io.s, io.in1, io.in0)
}
object MyMuxClassMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new MyMux())
}
