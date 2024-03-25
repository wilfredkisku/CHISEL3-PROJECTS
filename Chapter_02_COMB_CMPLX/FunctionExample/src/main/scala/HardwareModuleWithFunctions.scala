import chisel3._
import chisel3.util._

class HardwareModuleWithFunctions extends Module {
  val io = IO(new Bundle {
    val inputA = Input(UInt(4.W))
    val inputB = Input(UInt(4.W))
    val output = Output(UInt(5.W))
    val condition = Input(Bool())
  })

  // Function to add two UInt inputs
  def adder(a: UInt, b: UInt): UInt = {
    a + b
  }

  // Function to shift left a UInt input by a specified amount
  def shiftLeftByN(input: UInt, n: Int): UInt = {
    input << n
  }

  // Function to select between two UInt inputs based on a condition
  def muxSelect(cond: Bool, a: UInt, b: UInt): UInt = {
    Mux(cond, a, b)
  }

  // Function to perform custom multiplication operation
  def customMultiplier(a: UInt, b: UInt): UInt = {
    val product = a * b
    // additional logic
    product
  }

  // Define the hardware behavior
  val sum = adder(io.inputA, io.inputB)
  val shiftedResult = shiftLeftByN(sum, 2)
  val selectedResult = muxSelect(io.condition, sum, shiftedResult)
  val finalResult = customMultiplier(selectedResult, 3.U)

  // Output the final result
  io.output := finalResult
}

object HardwareModuleWithFunctionsMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new HardwareModuleWithFunctions())
}