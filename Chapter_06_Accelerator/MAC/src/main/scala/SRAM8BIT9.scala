import chisel3._
import chisel3.util._

class SRAM8BIT9 extends Module {
  val io = IO(new Bundle {
    val addr = Input(UInt(log2Ceil(9).W)) // 4 bits to address 9 locations
    val dataIn = Input(UInt(8.W)) // 8-bit data input
    val dataOut = Output(UInt(8.W)) // 8-bit data output
    val writeEnable = Input(Bool()) // Write enable signal
    val readEnable = Input(Bool()) // Read enable signal
  })

  // Create a memory with 9 elements, each 8 bits wide
  val mem = Mem(9, UInt(8.W))

  // Write operation
  when(io.writeEnable) {
    mem.write(io.addr, io.dataIn)
  }

  // Default dataOut
  io.dataOut := 0.U

  // Read operation
  when(io.readEnable) {
    io.dataOut := mem.read(io.addr)
  }
}

// Generate Verilog for the top module
object SRAM8BIT9TOP extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new SRAM8BIT9(), Array("--target-dir", "generated_SRAM"))
}
