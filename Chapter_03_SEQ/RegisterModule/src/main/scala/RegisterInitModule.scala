import chisel3._
import chisel3.stage.ChiselStage
import chisel3.util._

class RegisterInitModule extends Module{

  val io = IO(new Bundle{
    val in = Input(UInt(12.W))
    val out = Output(UInt(12.W))
  })

  val register = RegInit(0.U)
  register := io.in + 1.U
  io.out := register

}

object RegisterInitModuleMain extends App{
  println("Generate the verilog file.")
  emitVerilog(new RegisterInitModule())
}
