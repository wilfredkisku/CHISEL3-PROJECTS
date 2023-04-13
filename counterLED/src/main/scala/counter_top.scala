import chisel3._
import chisel3.util._
class counter_top(w: Int) extends Module{

  val io = IO(new Bundle{
        val count = Output(UInt(w.W))
  })

  val CNT_MAX = (50000000 / 2 - 1).U

  val cntReg = RegInit(0.U(32.W))
  val blkReg = RegInit(0.U(w.W))

  cntReg := cntReg + 1.U
  when(cntReg === CNT_MAX){
    cntReg := 0.U
    when (blkReg === w.U)
      {
        blkReg := 0.U
      }
      .otherwise
      {
        blkReg := blkReg + 1.U
      }
  }
  io.count := blkReg
}

// Generate the Verilog code
object counterMain extends App {
  println("Generating the counter hardware")
  (new chisel3.stage.ChiselStage).emitVerilog(new counter_top(8), Array("--target-dir", "generated"))

}
