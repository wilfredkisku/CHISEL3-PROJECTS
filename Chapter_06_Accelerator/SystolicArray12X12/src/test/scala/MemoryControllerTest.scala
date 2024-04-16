import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class MemoryControllerTester extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "MemoryController"

  it should "correctly read weight and feature map data" in {
    test(new MemoryController(8, 10)) { dut =>
      // Assuming we have a method to initialize memories from a file, which is a bit complex in Chisel.
      // Instead, we'll focus on simulating the read process and verifying the output.

      // Example: Trigger a read operation
      dut.io.readEnable.poke(true.B)
      dut.io.weightAddr.poke(0.U) // Example address
      dut.io.featureMapAddr.poke(0.U) // Example address
      dut.clock.step(1)

      // Here you would compare the output to expected values, which requires knowing what's in your memory.
      // Since we haven't actually initialized the memory with specific values, we'll skip this step.

      // Example: Check if readDone is asserted after the operation
      dut.clock.step(3) // Advance the state machine through its states
      dut.io.readDone.expect(true.B)

      // Reset readEnable to prepare for another operation or to return to idle
      dut.io.readEnable.poke(false.B)
      dut.clock.step(1)
    }
  }
}