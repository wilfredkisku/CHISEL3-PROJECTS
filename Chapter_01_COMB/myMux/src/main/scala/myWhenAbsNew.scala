import chisel3._
import chisel3.util._

class myWhenAbsNew(w: Int) extends Module {
  val io = IO(new Bundle {
    val x    = Input(SInt(w.W))
    val absX = Output(SInt(w.W))
  })
  io.absX := Mux(io.x > 0.S, io.x, -io.x)
}

object myWhenAbsNewTest extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new myWhenAbsNew(8))
}