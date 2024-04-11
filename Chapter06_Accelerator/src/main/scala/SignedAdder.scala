import chisel3._
import chisel3.util._

class SignedAdder extends Module {
  val io = IO(new Bundle {
    val a = Input(SInt(8.W))
    val b = Input(SInt(8.W))
    val sum = Output(SInt(8.W))
    val carryOut = Output(Bool())
    val overflow = Output(Bool())
  })

  val sum = io.a + io.b
  val carryOut = sum(7)
  val overflow = (io.a(7) ^ io.b(7)) & (io.a(7) ^ sum(7))

  io.sum := sum
  io.carryOut := carryOut
  io.overflow := overflow
}

object SignedAdderMain extends App {
  println("Generate the Verilog file!")
  emitVerilog(new SignedAdder())
}