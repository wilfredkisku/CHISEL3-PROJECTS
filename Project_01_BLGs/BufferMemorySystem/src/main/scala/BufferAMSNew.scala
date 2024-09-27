import chisel3._
import chisel3.util._

//class BufferAMSNew extends Module {
//  val width: Int = 8
//  val io = IO(new Bundle {
//    val adcValues = Input(Vec(128, UInt(width.W)))  // Input: 128 8-bit values (one frame)
//    val zeroSums = Output(Vec(8, UInt(8.W)))        // Output: Zero counts for each slice of 16 values (sorted)
//    val indicesOut = Output(Vec(8, UInt(4.W)))      // Output: Indices corresponding to sorted zeroSums
//    val frameOut = Output(Vec(128, UInt(width.W)))  // Output: Current frame stored in buffer
//  })
//
//  // Register to accumulate zero counts for each slice of 16 values
//  val zeroAccumulators = RegInit(VecInit(Seq.fill(8)(0.U(8.W))))
//
//  // Register to store the indices corresponding to each zero count
//  val indexAccumulators = RegInit(VecInit((0 until 8).map(_.U(4.W))))
//
//  // 16 x 128 buffer to store 16 consecutive frames (each frame is 128 8-bit values)
//  //val frameBuffer = Reg(Vec(16, Vec(128, UInt(width.W))))
//  val frameBuffer = RegInit(VecInit(Seq.fill(16)(VecInit(Seq.fill(128)(0.U(width.W))))))
//  val lineCounter = RegInit(0.U(4.W))  // Counter to track which frame we are on (0-15)
//
//  // Store the current frame in the buffer at the current lineCounter index
//  frameBuffer(lineCounter) := io.adcValues
//
//  // Logic for resetting zeroAccumulators frequently
//  // This resets every frame instead of waiting for 16 frames
//  when(lineCounter === 15.U) {
//    lineCounter := 0.U
//    zeroAccumulators := VecInit(Seq.fill(8)(0.U(8.W)))  // Reset zero accumulators after 16 frames
//    indexAccumulators := VecInit((0 until 8).map(_.U(4.W))) // Reset the index accumulator
//  } .otherwise {
//    lineCounter := lineCounter + 1.U
//
//    // Process each of the 8 slices of 16 values
//    for (i <- 0 until 8) {
//      val slice = io.adcValues.slice(i * 16, (i + 1) * 16)  // Slice 16 values from adcValues
//      val zeroCount = slice.map(v => (v === 0.U).asUInt).fold(0.U)(_ +& _)  // Count zeros in this slice
//
//      // Accumulate the zero count over frames
//      zeroAccumulators(i) := zeroAccumulators(i) + zeroCount
//    }
//
//    // Sort zeroAccumulators in descending order while maintaining the indices (bubble sort)
//    for (i <- 0 until 8) {
//      for (j <- 0 until 7 - i) {
//        when(zeroAccumulators(j) < zeroAccumulators(j + 1)) {
//          // Swap zero counts
//          val temp = zeroAccumulators(j)
//          zeroAccumulators(j) := zeroAccumulators(j + 1)
//          zeroAccumulators(j + 1) := temp
//
//          // Swap corresponding indices
//          val tempIdx = indexAccumulators(j)
//          indexAccumulators(j) := indexAccumulators(j + 1)
//          indexAccumulators(j + 1) := tempIdx
//        }
//      }
//    }
//  }
//
//  // Output the accumulated zero counts for each slice (sorted)
//  io.zeroSums := zeroAccumulators
//  io.indicesOut := indexAccumulators
//
//  // Output the current frame stored in the buffer (can be any frame, here we output the current one)
//  io.frameOut := frameBuffer(lineCounter)
//}
//
object BufferAMSTopLevelNew extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new BufferAMSNew)
}


class BufferAMSNew extends Module {
  val width: Int = 8
  val io = IO(new Bundle {
    val adcValues = Input(Vec(128, UInt(width.W)))  // Input: 128 8-bit values (one frame)
    val zeroSums = Output(Vec(8, UInt(9.W)))        // Output: Zero counts for each slice of 16 values (sorted)
    val indicesOut = Output(Vec(8, UInt(5.W)))      // Output: Indices corresponding to sorted zeroSums
    val frameOut = Output(Vec(128, UInt(width.W)))  // Output: Current frame stored in buffer
  })

  //val sInit :: sSort :: Nil = Enum(2)

  //val state = RegInit(sSort)
  // Register to accumulate zero counts for each slice of 16 values
  val zeroAccumulators = RegInit(VecInit(Seq.fill(8)(0.U(9.W))))
  val indexAccumulators = RegInit(VecInit((0 until 8).map(_.U(4.W))))

  // 16 x 128 buffer to store 16 consecutive frames (each frame is 128 8-bit values)
  val frameBuffer = RegInit(VecInit(Seq.fill(16)(VecInit(Seq.fill(128)(0.U(width.W))))))
  val lineCounter = RegInit(0.U(5.W))  // Counter to track which frame we are on (0-15)

  // Store the current frame in the buffer at the current lineCounter index
  frameBuffer(lineCounter) := io.adcValues

  // Output the last written frame stored in the buffer
  io.frameOut := Mux(lineCounter === 0.U, frameBuffer(15.U), frameBuffer(lineCounter - 1.U))

  // Logic for resetting zeroAccumulators frequently
  when(lineCounter === 16.U) {

    zeroAccumulators := VecInit(Seq.fill(8)(0.U(9.W)))  // Reset zero accumulators after 16 frames
    indexAccumulators := VecInit((0 until 8).map(_.U(4.W))) // Reset the index accumulator

    // Sort zeroAccumulators in descending order while maintaining the indices (bubble sort)

      lineCounter := 0.U


    for (i <- 0 until 8) {
      for (j <- 0 until 7 - i) {
        when(zeroAccumulators(j) < zeroAccumulators(j + 1)) {
          // Swap zero counts
          val temp = zeroAccumulators(j)
          zeroAccumulators(j) := zeroAccumulators(j + 1)
          zeroAccumulators(j + 1) := temp

          // Swap corresponding indices
          val tempIdx = indexAccumulators(j)
          indexAccumulators(j) := indexAccumulators(j + 1)
          indexAccumulators(j + 1) := tempIdx
        }
      }
    }

  }
    .otherwise {
    lineCounter := lineCounter + 1.U

    // Process each of the 8 slices of 16 values
    for (i <- 0 until 8) {
      val slice = io.adcValues.slice(i * 16, (i + 1) * 16)  // Slice 16 values from adcValues
      val zeroCount = slice.map(v => (v === 0.U).asUInt).fold(0.U)(_ +& _)  // Count zeros in this slice

      // Accumulate the zero count over frames
      zeroAccumulators(i) := zeroAccumulators(i) + zeroCount



    }


  }

  // Output the accumulated zero counts for each slice (sorted)
  io.zeroSums := zeroAccumulators
  io.indicesOut := indexAccumulators
}
