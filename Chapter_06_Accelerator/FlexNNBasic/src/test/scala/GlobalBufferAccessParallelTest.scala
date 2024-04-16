
  import chisel3._
  import chiseltest._
  import org.scalatest.flatspec.AnyFlatSpec

  class GlobalBufferAccessParallelTest extends AnyFlatSpec with ChiselScalatestTester {
    behavior of "GlobalBuffer"

    it should "correctly read 9 weights in parallel from selected banks" in {
      test(new GlobalBufferAccessParallel) { c =>
        // Example initialization (pseudo-code, replace with actual initialization)
        // Assuming a method to write to the banks is available for test purposes
        // This part will vary based on how the banks are actually implemented
        // Initialize the banks with known values (for simplicity, using bank index as value)

        for (bank <- 0 until 4) {
          for (addr <- 0 until 576) {
            // Assuming a way to write to memory for initialization
            c.io.bankSel(bank.U)
            c..poke(addr, value) // Pseudo-code, replace with actual method
          }
        }

        // Select a bank and read address
        c.io.bankSel.poke(0.U) // Select bank 0
        c.io.readAddr.poke(0.U) // Read from address 0

        // Assuming clock cycle management is necessary
        c.clock.step(1)

        // Check outputs
        for (i <- 0 until 9) {
          // Assuming the initialization was done with values that make it easy to check
          c.io.readData(i).expect(i.U) // Replace with the expected value based on initialization
        }

        // Repeat the process for other banks and addresses as necessary
        // This is a very basic check, more comprehensive tests might be needed
      }
    }
  }
