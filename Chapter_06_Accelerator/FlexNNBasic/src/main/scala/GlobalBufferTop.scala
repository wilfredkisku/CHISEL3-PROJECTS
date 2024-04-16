import chisel3._
import chisel3.util._

class GlobalBufferTop extends Module {
  val io = IO(new Bundle {
    // Define top-level IO, possibly including interfaces to other parts of your CNN accelerator
  })

  val gbBlocks = Seq.fill(4)(Module(new GlobalBuffer(8, 1024)))

  // Example connection for one GB block
  // gbBlocks(0).io.writeEnable := ...
  // gbBlocks(0).io.readEnable := ...
  // gbBlocks(0).io.writeAddr := ...
  // gbBlocks(0).io.readAddr := ...
  // gbBlocks(0).io.writeData := ...
  // Connect these blocks to the rest of your system as needed
}

object GlobalBufferTopMain extends App {
  println("Generating Verilog for a Global Buffer Top Block for North, South, West and East.")
  (new chisel3.stage.ChiselStage).emitVerilog(new GlobalBufferTop)
  println("Generation Process completed!!")
}