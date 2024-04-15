import chisel3._

class MACUnit extends Module {
  val io = IO(new Bundle {
    val inputA = Input(SInt(8.W))
    val inputB = Input(SInt(8.W))
    val weight = Input(SInt(8.W))
    val output = Output(SInt(32.W))
  })

  val multiplier = Module(new SignedMultiplier)
  val adder = Module(new SignedAdder)

  multiplier.io.a := io.inputA
  multiplier.io.b := io.weight

  adder.io.a := multiplier.io.product
  adder.io.b := io.inputB

  io.output := adder.io.sum
}

object MACUnitMain extends App {
  println("Generate the Verilog file!")
  emitVerilog(new MACUnit())
}