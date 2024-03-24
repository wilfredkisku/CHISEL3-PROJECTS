import chisel3._
import chisel3.util._

class GlobalBuffer extends Module {
  val io = IO(new Bundle {
    val dataIn = Input(UInt(8.W))
    val writeEnable = Input(Bool())
    val address = Input(UInt(18.W))
    val dataOut = Output(UInt(8.W))
  })

  // Define memory size
  val memSize = 256 * 1024 // 256 KB
  // Define memory
  val mem = Mem(memSize, UInt(8.W))

  // Synchronous read
  io.dataOut := RegNext(mem(io.address))

  // Synchronous write
  when(io.writeEnable) {
    mem(io.address) := io.dataIn
  }
}

// Main module
class GlobalBufferMain extends Module {
  val io = IO(new Bundle {
    val dataIn = Input(UInt(8.W))
    val writeEnable = Input(Bool())
    val address = Input(UInt(18.W))
    val dataOut = Output(UInt(8.W))
  })

  val globalBuffer = Module(new GlobalBuffer)

  globalBuffer.io.dataIn := io.dataIn
  globalBuffer.io.writeEnable := io.writeEnable
  globalBuffer.io.address := io.address
  io.dataOut := globalBuffer.io.dataOut
}

object GlobalBufferMainEntry extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new GlobalBufferMain())
}