import chisel3._
import chisel3.util._
import chiseltest._
import chiseltest.RawTester.test

class MyMuxWhen(w: Int) extends Module {
  val io = IO(new Bundle {
    val s   = Input(Bool())
    val in0 = Input(UInt(w.W))
    val in1 = Input(UInt(w.W))
    val out = Output(UInt(w.W))
  })
  when (io.s) {
    io.out := io.in1
  } .otherwise {
    io.out := io.in0
  }
}

object myMuxParameterizedWhenMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new MyMuxWhen(8))
}