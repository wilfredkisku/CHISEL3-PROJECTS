import chisel3._
import chisel3.util._
import chiseltest._
import chiseltest.RawTester.test

class xorClass extends Module {
  val io = IO(new Bundle {
    val a   = Input(Bool())
    val b   = Input(Bool())
    val c   = Output(Bool())
  })
  io.c := io.a ^ io.b
}

object xorClassMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new xorClass())
}