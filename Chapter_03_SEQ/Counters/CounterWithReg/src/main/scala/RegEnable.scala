import chisel3._
import chisel3.util._

class RegEnableModule(maxVal : Int) extends Module{

  val io = IO(new Bundle{
    val en = Input(Bool())
    val out = Output(UInt(log2Ceil(maxVal+1).W))
  })

  io.out := RegEnable(Mux(io.out < maxVal.U, io.out + 1.U, 0.U),0.U,io.en)

}

object RegEnableModuleMain extends App{
  println("Generate the verilog file.")
  emitVerilog(new RegEnableModule(7))
}