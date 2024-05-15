import chisel3._
import chisel3.util._

class SIGNED_ADD extends Module{

  val io = IO(new Bundle{
    val inputA = Input(SInt(8.W))
    val inputB = Input(SInt(8.W))
    val output = Output(SInt(9.W))
  })

  io.output := io.inputA +& io.inputB

}
// Generate Verilog for the top module
object SIGNED_ADD_TOP extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new SIGNED_ADD(), Array("--target-dir", "generated_ARITH"))
}