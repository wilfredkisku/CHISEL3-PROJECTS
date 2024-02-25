import chisel3._
import chisel3.util._

class signedConversion(w: Int) extends Module {
  val io = IO(new Bundle {
    val sign = Input(Bool())
    val mag  = Input(UInt(w.W))
    val twos = Output(UInt((w+1).W))
  })

  when (io.sign) {
    io.twos := Cat(1.B, ~io.mag) +& 1.U
  } .otherwise {
    io.twos := io.mag
  }
}
object signedConversionMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new signedConversion(8))
}
