import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class BufferAMSTesterNewNew extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "BufferAMSNew"

  it should "handle input patterns and reset correctly" in {
    test(new BufferAMSNew).withAnnotations(Seq(WriteVcdAnnotation)) { c =>

      // Helper function to generate different test patterns
      def generateFrame(pattern: String): Seq[UInt] = pattern match {
        case "allZeros" => Seq.fill(128)(0.U(8.W)) // All zeros
        case "allOnes" => Seq.fill(128)(1.U(8.W))  // All ones
        case "alternating" => Seq.tabulate(128)(i => if (i % 2 == 0) 0.U(8.W) else 1.U(8.W)) // Alternating
        case "random" => Seq.fill(128)(scala.util.Random.nextInt(256).U(8.W)) // Random 8-bit unsigned values
      }

      // Helper function to poke values into the Vec input
      def pokeVecInput(values: Seq[UInt]): Unit = {
        for (i <- 0 until 128) {
          c.io.adcValues(i).poke(values(i))
        }
      }

      // Test 1: All Zeros Input (Accumulate over several frames)
      pokeVecInput(generateFrame("allZeros"))
      c.clock.step()

      for (i <- 0 until 8) {
        c.io.zeroSums(i).expect(16.U) // Expect 16 zeros per slice after 1 frame
      }

      // Test 2: Apply reset after processing some frames
      pokeVecInput(generateFrame("allOnes")) // Random or All-Ones Frame
      c.clock.step() // Run one more frame with ones

      // Now apply the reset and ensure it's handled correctly
      c.reset.poke(true.B)  // Assert reset signal
      c.clock.step()        // Step clock to apply reset
      c.reset.poke(false.B) // Deassert reset signal
      c.clock.step(2)       // Step clock twice to allow reset to take effect

      // Check if zero counts are reset to zero after reset
      for (i <- 0 until 8) {
        c.io.zeroSums(i).expect(0.U) // Expect zero accumulators to be cleared after reset
      }
    }
  }
}
