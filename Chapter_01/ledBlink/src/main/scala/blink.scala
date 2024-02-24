import chisel3._

class blink extends Module {
  val io = IO(new Bundle {
     val led: UInt = Output(UInt(1.W))
  })
  private val CNT_MAX = (100000000 / 2 - 1).U

  private val cntReg = RegInit(0.U(32.W))
  private val blkReg = RegInit(0.U(1.W))

  cntReg := cntReg + 1.U
  when(cntReg === CNT_MAX) {
    cntReg := 0.U
    blkReg := ~blkReg
  }
  io.led := blkReg
}

/**
 * An object extending App to generate the Verilog code.
 */
object BlinkMain extends App {
  println("Hello World, I will now generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new blink())
}
