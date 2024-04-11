import chisel3._

class SignedMultiplier extends Module {
  val io = IO(new Bundle {
    val a = Input(SInt(8.W))
    val b = Input(SInt(8.W))
    val product = Output(SInt(16.W))
  })

  io.product := io.a * io.b
}

object SignedMultiplierMain extends App {
  println("Generate the Verilog file!")
  emitVerilog(new SignedMultiplier())
}