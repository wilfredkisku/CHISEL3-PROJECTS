import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class GlobalBufferAccessParallelTest extends AnyFlatSpec with ChiselScalatestTester {
  behavior of "GlobalBufferAccessParallel"

  it should "write and read values correctly" in {
    test(new GlobalBufferAccessParallel) { c =>
      // Example write and read back for a single bank
      val testData = Seq.fill(9)(scala.util.Random.nextInt(256)) // Generate random test data
      val writeAddr = 0 // Starting address for the test
      val bankSel = 0 // Select bank 0 for this test

      // Write testData to the bank
      c.io.writeEnable.poke(true.B)
      c.io.bankSel.poke(bankSel.U)
      for ((data, addrOffset) <- testData.zipWithIndex) {
        c.io.writeAddr.poke((writeAddr + addrOffset).U)
        c.io.writeData.poke(data.U)
        c.clock.step(1) // Advance the clock after each write
      }
      c.io.writeEnable.poke(false.B)

      // Set up the read address and bank selection
      c.io.readAddr.poke(writeAddr.U)
      c.io.bankSel.poke(bankSel.U)
      c.clock.step(1) // Advance the clock to ensure read operation

      // Verify the read data matches the written data
      for ((expectedData, i) <- testData.zipWithIndex) {
        println(c.io.readData(i), expectedData.U, i)
        c.io.readData(i).expect(expectedData.U, s"Read data at index $i did not match expected value.")
      }

      // Additional tests can be added here to test other banks, addresses, and data patterns
    }
  }
}