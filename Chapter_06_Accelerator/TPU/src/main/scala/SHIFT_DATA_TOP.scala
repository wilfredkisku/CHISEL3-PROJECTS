import chisel3._
import chisel3.util._

class SHIFT_DATA_TOP extends Module{

  val io = IO(new Bundle{
    val inp = Input(UInt(8.W))
    val out = Output(UInt(8.W))
  })

  val reg1 = RegNext(io.inp)
  val reg2 = RegNext(reg1)
  val reg3 = RegNext(reg2)
  val reg4 = RegNext(reg3)
  val reg5 = RegNext(reg4)

  io.out := reg5


}
object SHIFT_DATA_TOP_MAIN extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new SHIFT_DATA_TOP())
}