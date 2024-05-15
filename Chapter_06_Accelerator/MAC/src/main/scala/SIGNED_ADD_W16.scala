import chisel3._
import chisel3.util._

class SIGNED_ADD_W16 extends Module{

  val io = IO(new Bundle{
    val inputA = Input(SInt(16.W))
    val inputB = Input(SInt(16.W))
    val output = Output(SInt(17.W))
  })

  io.output := io.inputA +& io.inputB

}
// Generate Verilog for the top module
object SIGNED_ADD_W16_TOP extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new SIGNED_ADD_W16(), Array("--target-dir", "generated_ARITH"))
}