import chisel3._
import chisel3.util._

class ReadWritePortA(depth: Int, bitwidth: Int) extends Bundle {
  val enableA = Input(Bool())
  val writeA = Input(Bool())
  val addrA = Input(UInt(log2Ceil(depth).W))
  val dataInA = Input(UInt(bitwidth.W))
  val dataOutA = Output(UInt(bitwidth.W))
}
class ReadWritePortB(depth: Int, bitwidth: Int) extends Bundle {
  val enableB = Input(Bool())
  val writeB = Input(Bool())
  val addrB = Input(UInt(log2Ceil(depth).W))
  val dataInB = Input(UInt(bitwidth.W))
  val dataOutB = Output(UInt(bitwidth.W))
}
class GlobalBufferDPModule(depth: Int, width : Int) extends Module{
  val io = IO(new Bundle {
    val rdWrPortA = new ReadWritePortA(depth, width)
    val rdWrPortB = new ReadWritePortB(depth, width)
  })

  val mem = SyncReadMem(depth, UInt(width.W))

  io.rdWrPortA.dataOutA := DontCare
  io.rdWrPortB.dataOutB := DontCare

  when (io.rdWrPortB.enableB){
    val rdwrPortB = mem(io.rdWrPortB.addrB)
    when (io.rdWrPortB.writeB) {
      rdwrPortB := io.rdWrPortB.dataInB
    }.otherwise(
      io.rdWrPortB.dataOutB := rdwrPortB
    )
  }

  when (io.rdWrPortA.enableA){
    val rdwrPortA = mem(io.rdWrPortA.addrA)
    when (io.rdWrPortA.writeA) {
      rdwrPortA := io.rdWrPortA.dataInA
    }.otherwise(
      io.rdWrPortA.dataOutA := rdwrPortA
    )
  }
}



object GlobalBufferDPMainEntry extends App {
  println("Generate the Verilog file!")
  emitVerilog(new GlobalBufferDPModule(1024, 8))
}