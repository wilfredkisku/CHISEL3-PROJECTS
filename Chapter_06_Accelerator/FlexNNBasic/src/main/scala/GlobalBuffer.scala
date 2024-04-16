import chisel3._
import chisel3.util._

class GlobalBuffer(dataWidth: Int, memDepth: Int) extends Module {
  val addrWidth = log2Ceil(memDepth)
  val io = IO(new Bundle {
    val writeEnable = Input(Bool())
    val readEnable = Input(Bool())
    val writeAddr = Input(UInt(addrWidth.W))
    val readAddr = Input(UInt(addrWidth.W))
    val writeData = Input(UInt(dataWidth.W))
    val readData = Output(UInt(dataWidth.W))
  })

  val memory = SyncReadMem(memDepth, UInt(dataWidth.W))

  when(io.writeEnable) {
    memory.write(io.writeAddr, io.writeData)
  }

  io.readData := DontCare // Use DontCare for uninitialized outputs
  when(io.readEnable) {
    io.readData := memory.read(io.readAddr, io.readEnable)
  }
}

object GlobalBufferMain extends App {
  println("Generating Verilog for a Global Buffer Block")
  (new chisel3.stage.ChiselStage).emitVerilog(new GlobalBuffer(8, 1024))
}
