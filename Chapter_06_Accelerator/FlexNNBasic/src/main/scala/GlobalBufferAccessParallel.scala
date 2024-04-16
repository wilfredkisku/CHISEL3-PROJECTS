
  import chisel3._
  import chisel3.util._

  class GlobalBufferAccessParallel extends Module{
    val io = IO(new Bundle {
      val readAddr = Input(UInt(log2Ceil(576).W))
      val readData = Output(Vec(9, UInt(8.W)))
      val bankSel = Input(UInt(2.W)) // Selects one of the 4 banks
    })

    // Define 4 memory banks, each capable of storing 576 8-bit weights
    val banks = Seq.fill(4)(Mem(576, UInt(8.W)))

    // Logic to read 9 weights in parallel from the selected bank
    // Assuming readAddr points to the first of the 9 weights to be read
    for (i <- 0 until 9) {
      when(io.bankSel === 0.U) {
        io.readData(i) := banks(0)(io.readAddr + i.U)
      }.elsewhen(io.bankSel === 1.U) {
        io.readData(i) := banks(1)(io.readAddr + i.U)
      }.elsewhen(io.bankSel === 2.U) {
        io.readData(i) := banks(2)(io.readAddr + i.U)
      }.otherwise {
        io.readData(i) := banks(3)(io.readAddr + i.U)
      }
    }
  }

  object GlobalBufferAccessParallelMain extends App {
    println((new chisel3.stage.ChiselStage).emitVerilog(new GlobalBufferAccessParallel))
  }
