import chisel3._
import chisel3.util._
import chisel3.experimental.FixedPoint

// Define a module that adds two FixedPoint numbers
class FxP8_MUL extends Module {
  val io = IO(new Bundle {
    val inputA = Input(FixedPoint(8.W, 6.BP))  // 16 bits wide, 8 bits after the binary point
    val inputB = Input(FixedPoint(8.W, 6.BP))  // Same for the second input
    val output = Output(FixedPoint(8.W, 6.BP)) // 17 bits wide to accommodate potential overflow
  })

  // Perform the addition
  io.output := io.inputA * io.inputB
}

// Generate the Verilog code
object FxP8_MUL_Main extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new FxP8_MUL)
}
