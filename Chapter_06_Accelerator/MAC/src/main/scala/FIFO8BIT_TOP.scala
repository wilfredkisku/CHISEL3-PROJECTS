import chisel3._
import chisel3.util._

// Define the top module
class FIFO8BIT_TOP extends Module {
  val io = IO(new Bundle {
    val wr_en = Input(UInt(2.W)) // 2-bit wide for enabling write to each FIFO
    val rd_en = Input(UInt(2.W)) // 2-bit wide for enabling read from each FIFO
    val data_in_1 = Input(UInt(8.W)) // Data input for FIFO 1
    val data_in_2 = Input(UInt(8.W)) // Data input for FIFO 2
    val data_out_1 = Output(UInt(8.W)) // Data output from FIFO 1
    val data_out_2 = Output(UInt(8.W)) // Data output from FIFO 2
    val full = Output(Vec(2, Bool())) // Indicates each FIFO's full status
    val empty = Output(Vec(2, Bool())) // Indicates each FIFO's empty status
  })

  // Instantiate the first FIFO
  val fifo1 = Module(new FIFO8Bit())
  fifo1.io.wr_en := io.wr_en(0)
  fifo1.io.rd_en := io.rd_en(0)
  fifo1.io.data_in := io.data_in_1
  io.data_out_1 := fifo1.io.data_out
  io.full(0) := fifo1.io.full
  io.empty(0) := fifo1.io.empty

  // Instantiate the second FIFO
  val fifo2 = Module(new FIFO8Bit())
  fifo2.io.wr_en := io.wr_en(1)
  fifo2.io.rd_en := io.rd_en(1)
  fifo2.io.data_in := io.data_in_2
  io.data_out_2 := fifo2.io.data_out
  io.full(1) := fifo2.io.full
  io.empty(1) := fifo2.io.empty
}

// Generate Verilog for the top module
object GenerateVerilog extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new FIFO8BIT_TOP(), Array("--target-dir", "generated"))
}