import chisel3._
import chisel3.util.experimental.loadMemoryFromFile

class InitializedMemory extends Module {
  val io = IO(new Bundle {
    // Example IOs for demonstration
    val writeEnable = Input(Bool())
    val writeAddr = Input(UInt(8.W))
    val writeData = Input(UInt(8.W))
    val readAddr = Input(UInt(8.W))
    val readEnable = Input(Bool())
    val readData = Output(UInt(8.W))
  })

  val memSize = 256
  val memory = SyncReadMem(memSize, UInt(8.W))

  // Example initialization (Replace with actual initialization logic)
  val initData = (0 until memSize).map(_.U(8.W))
  // For actual file loading, use loadMemoryFromFile(memory, "path/to/your/init/file.txt")
  loadMemoryFromFile(memory, "/home/wilfred/IdeaProjects/RISC/loadHEX.txt")
  // Simplified read/write logic
  when(io.writeEnable) {
    memory.write(io.writeAddr, io.writeData)
  }
  io.readData := memory.read(io.readAddr, io.readEnable)
}

object TopLevel extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new InitializedMemory)
}