import chisel3._
import chisel3.util._



class GlobalBuffer extends Module {
  val width: Int = 16
  val io = IO(new Bundle {
    val enableA = Input(Bool())
    val writeA = Input(Bool())
    val addrA = Input(UInt(10.W))
    val dataInA = Input(UInt(width.W))
    val dataOutA = Output(UInt(width.W))

  })

  val mem = SyncReadMem(1024, UInt(width.W))
  //Seq.fill(256)(0 until 256)
  io.dataOutA := DontCare
  when (io.enableA){
    val rdwrPort = mem(io.addrA)
    when (io.writeA) {
      rdwrPort := io.dataInA
    }.otherwise(
      io.dataOutA := rdwrPort
    )
  }

}

object GlobalBufferMainEntry extends App {
  println("Generate the Verilog file!")
  emitVerilog(new GlobalBuffer())
}