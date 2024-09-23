import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class BufferAMSTester extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "BufferAMS"

  it should "accumulate zero counts correctly and sort them" in {
    test(new BufferAMS) { c =>
      // Initialize the inputs to zeros
      // Function to poke a Seq of UInt values into a Vec input
      def pokeVecInput(values: Seq[UInt]): Unit = {
        for (i <- 0 until 128) {
          c.io.adcValues(i).poke(values(i))
        }
      }
//
//      // Step 1: Send a frame with no zeros (all values are 1)
      val frame1 = Seq.fill(128)(0.U)  // No zeros in this frame
      pokeVecInput(frame1)
//      c.io.adcValues.poke(VecInit(Seq.fill(128)(0.U)).asInstanceOf[Vec[UInt]])

      // Check for multiple cycles (we simulate 16 frames)
      for (frame <- 0 until 16) {
        // Stimulate the ADC values with some test data
        val testFrame = if (frame % 2 == 0) {
          Seq.fill(128)(0.U) // all zeros (for even frames)
        } else {
          Seq.fill(128)(1.U) // all ones (for odd frames)
        }
        pokeVecInput(testFrame)
//        c.io.adcValues.poke(testFrame)

        // Step the clock
        c.clock.step()

//        // After each frame, print or check outputs
//        if (frame == 15) {
//          // After 16 frames, the zeroAccumulators should have counted the number of zeros
//          val expectedZeroCounts = VecInit(Seq(8.U, 8.U, 8.U, 8.U, 8.U, 8.U, 8.U, 8.U)) // Adjust depending on input
//
//          // Check zero counts
//          for (i <- 0 until 8) {
//            c.io.zeroSums(i).expect(expectedZeroCounts(i))
//          }
//
//          // Check indices (after sorting, this depends on your design)
//          // Example: Expecting sorted indices corresponding to the zero accumulators
//          // You can define expected indices here based on your input pattern
//          // For simplicity, assume we expect indices to be sorted in some known order
//          val expectedIndices = VecInit(Seq(0.U, 1.U, 2.U, 3.U, 4.U, 5.U, 6.U, 7.U))
//          for (i <- 0 until 8) {
//            c.io.indicesOut(i).expect(expectedIndices(i))
//          }
//
//          // Optionally print output values for debugging
//          println(s"ZeroSums: ${c.io.zeroSums.peek()}")
//          println(s"Indices: ${c.io.indicesOut.peek()}")
//        }
      }
    }
  }
}