import chisel3._
import chisel3.util._

class INT8_MUL extends Module{
  val io = IO(new Bundle {
    val inputA = Input(SInt(8.W))  // 8 bits
    val inputB = Input(SInt(8.W))  // Same for the second input
    val output = Output(SInt(16.W)) // 9 bits wide to accommodate potential overflow (this limits the result to be only 8-bit)
  })

  // Perform the addition
  io.output := io.inputA * io.inputB

}

// Generate the Verilog code
object INT8_MUL_Main extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new INT8_MUL)
}


