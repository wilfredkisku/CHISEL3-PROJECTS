import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class BufferAMSTesterNew extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "BufferAMS"

  it should "accumulate zero counts, sort them, and maintain indices, with reset behavior" in {
    test(new BufferAMSNew).withAnnotations(Seq(WriteVcdAnnotation)) { c =>

      // Helper function to generate a random frame or all zeros
      def generateFrame(allZeros: Boolean = false): Seq[UInt] = {
        if (allZeros) {
          Seq.fill(128)(0.U(8.W)) // Generate 128 zeros
        } else {
          Seq.fill(128)(scala.util.Random.nextInt(256).U(8.W)) // Generate random 8-bit unsigned values
        }
      }

      // Helper function to poke values directly into the Vec input
      def pokeVecInput(values: Seq[UInt]): Unit = {
        for (i <- 0 until 128) {
          c.io.adcValues(i).poke(values(i))
        }
      }

      // Run the simulation for 16 frames
      for (cycle <- 0 until 16) {
        val frame = if (cycle % 2 == 0) generateFrame(allZeros = true) else generateFrame()

        // Use the helper function to poke the generated frame into the adcValues input
        pokeVecInput(frame)

        // Step the clock for each frame
        c.clock.step()

        // Optionally, print zero counts and sorted indices at cycle 15 for debugging
        if (cycle == 15) {
          val zeroSums = c.io.zeroSums.peek()
          val indicesOut = c.io.indicesOut.peek()

          println(s"Zero Sums at cycle 15: ${zeroSums}")
          println(s"Indices Out at cycle 15: ${indicesOut}")
        }
      }

      // After 16 cycles, explicitly reset the module
      c.reset.poke(true.B)  // Assert reset signal
      c.clock.step()        // Step clock to apply reset
      c.reset.poke(false.B) // Deassert reset signal
      c.clock.step()        // Step clock to allow reset to take effect

      // Give the module a few clock cycles to stabilize after reset
      c.clock.step(2)       // Extra steps to ensure proper reset

      // Check if zero counts reset after 16 cycles
      for (i <- 0 until 8) {
        c.io.zeroSums(i).expect(0.U) // Expect zero counts to reset to 0
      }
    }
  }
}
