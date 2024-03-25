import chisel3._
import chisel3.util._

class myWhenAbs(w: Int) extends Module {
  val io = IO(new Bundle {
    val x    = Input(SInt(w.W))
    val absX = Output(SInt(w.W))
  })
  io.absX := io.x
  when (io.x < 0.S) {
    io.absX := -io.x
  }
}

object myWhenAbsTest extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new myWhenAbs(8))
}
