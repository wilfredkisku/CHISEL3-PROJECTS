import chisel3._

class RomModule extends Module {
  val io = IO(new Bundle {
    val address = Input(UInt(8.W)) // Assuming 8-bit address width
    val dataOut = Output(UInt(32.W)) // Assuming 32-bit instruction width
  })

  // Define instruction memory
  val instructions = Seq(
    "h00000000".U, // Example instruction 1
    "h00010000".U, // Example instruction 2
    "h00010010".U, // Example instruction 2
    "h01010100".U, // Example instruction 2
    "h01010110".U, // Example instruction 2
    "h00010011".U, // Example instruction 2
    // Add more instructions as needed
  )

//  val times = (0 until 16).map(i => i.asUInt(8.W))
//  val m = VecInit(times)

  // Create ROM memory
  val rom = VecInit(instructions)

  // Output data based on the address
  io.dataOut := rom(io.address)
}

object RomModuleMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new RomModule())
}

