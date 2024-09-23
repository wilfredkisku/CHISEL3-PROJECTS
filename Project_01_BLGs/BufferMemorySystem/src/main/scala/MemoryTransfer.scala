import chisel3._
import chisel3.util._

class MemoryTransfer extends Module {
  val io = IO(new Bundle {
    val readEnable = Input(Bool())                    // Enable signal for reading chunks
    val chunkIndex = Input(UInt(3.W))                 // Chunk index (0 to 7) for selecting the chunk
    val rowIndex = Input(UInt(4.W))                   // Row index (0 to 15)
    val dataOut = Output(Vec(16, UInt(8.W)))          // Output 16 columns at a time (1 row of a chunk)
  })

  // Define the 16x128 memory (16 rows, each containing 128 columns of 8-bit data)
  val memory = SyncReadMem(16, Vec(64, UInt(8.W)))

  // Chunk selection logic
  val baseColumn = io.chunkIndex * 16.U               // Starting column for the selected chunk

  // Read the selected chunk
  when(io.readEnable) {
    // For each row, extract 16 consecutive columns starting from baseColumn
    //io.dataOut := memory.read(io.rowIndex).slice(baseColumn, baseColumn + 16.U)
  }
}

object MemoryTransferTopLevel extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new MemoryTransfer)
}
