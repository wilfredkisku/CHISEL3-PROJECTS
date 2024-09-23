import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class BufferAccumulatorTest extends AnyFlatSpec with ChiselScalatestTester {

  "BufferAccumulator" should "accumulate zero counts correctly" in {
    test(new BufferAccumulator) { c =>

      // Function to poke a Seq of UInt values into a Vec input
      def pokeVecInput(values: Seq[UInt]): Unit = {
        for (i <- 0 until 128) {
          c.io.adcValues(i).poke(values(i))
        }
      }

      // Step 1: Send a frame with no zeros (all values are 1)
      val frame1 = Seq.fill(128)(1.U)  // No zeros in this frame
      pokeVecInput(frame1)
      c.clock.step(1)

      // No zeros should be accumulated
      for (i <- 0 until 8) {
        c.io.zeroSums(i).expect(0.U)
      }

      // Step 2: Send a frame with half zeros in each slice (8 zeros per slice)
      val frame2 = (Seq.fill(8)(Seq.fill(8)(0.U) ++ Seq.fill(8)(1.U))).flatten
      pokeVecInput(frame2)
      c.clock.step(1)

      // Now each slice should have accumulated 8 zeros
      for (i <- 0 until 8) {
        c.io.zeroSums(i).expect(8.U)
      }

      // Step 3: Send a frame with all zeros
      val frame3 = Seq.fill(128)(0.U)  // All zeros
      pokeVecInput(frame3)
      c.clock.step(1)

      // Now each slice should have accumulated an additional 16 zeros
      for (i <- 0 until 8) {
        c.io.zeroSums(i).expect(24.U)  // 8 from the previous step + 16 zeros now
      }

      // Step 4: Send another frame with no zeros
      val frame4 = Seq.fill(128)(2.U)  // No zeros
      pokeVecInput(frame4)
      c.clock.step(1)

      // The zero counts should remain at 24
      for (i <- 0 until 8) {
        c.io.zeroSums(i).expect(24.U)
      }

      // Step 5: Send 12 more frames (to reach 16 total) and expect reset
      for (_ <- 0 until 12) {
        pokeVecInput(frame1)  // Non-zero frames
        c.clock.step(1)
      }

      // After 16 frames, the accumulators should reset
      for (i <- 0 until 8) {
        c.io.zeroSums(i).expect(0.U)
      }
    }
  }
}
