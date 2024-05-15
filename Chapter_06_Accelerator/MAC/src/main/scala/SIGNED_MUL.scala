import chisel3._
import chisel3.util._

class SIGNED_MUL extends Module{

  val io = IO(new Bundle{
    val inputA = Input(SInt(8.W))
    val inputB = Input(SInt(8.W))
    val output = Output(SInt(16.W))
  })

  io.output := io.inputA * io.inputB

}
// Generate Verilog for the top module
object SIGNED_MUL_TOP extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new SIGNED_MUL(), Array("--target-dir", "generated_ARITH"))
}