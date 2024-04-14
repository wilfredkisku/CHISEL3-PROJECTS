import chisel3._
import chisel3.util._

class SystolicArray extends Module{
  val io = IO(new Bundle {
    // Define any external inputs/outputs for the grid if necessary
    // For example, inputs to the first row/column and outputs from the last row/column
    val gridWeightIn = Input(Vec(12, SInt(8.W)))
    val gridIfmIn = Input(Vec(12, SInt(8.W)))
    val gridParpOut = Output(Vec(12, Vec(12, SInt(32.W))))
  })

  // Create a 12x12 grid of PEs
  val peArray = Seq.fill(12, 12)(Module(new PE))

  // Initialize the connections between PEs
  for (row <- 0 until 12) {
    for (col <- 0 until 12) {
      if (row == 0) {
        peArray(row)(col).io.ifmIn := io.gridIfmIn(col) // Connect the first row's IFM inputs
      } else {
        peArray(row)(col).io.ifmIn := peArray(row - 1)(col).io.ifmOut // Chain IFM vertically
      }

      if (col == 0) {
        peArray(row)(col).io.weightIn := io.gridWeightIn(row) // Connect the first column's weight inputs
      } else {
        peArray(row)(col).io.weightIn := peArray(row)(col - 1).io.weightOut // Chain weights horizontally
      }

      // Connect the parp outputs to the grid output
      io.gridParpOut(row)(col) := peArray(row)(col).io.parp
    }
  }
}


object SystolicArrayMain extends App{
  emitVerilog(new SystolicArray())
}