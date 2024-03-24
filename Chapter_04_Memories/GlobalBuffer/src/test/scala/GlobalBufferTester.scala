import org.scalatest._
import chisel3._
import chiseltest._

class GlobalBufferMainTest extends FlatSpec with ChiselScalatestTester {
  behavior of "GlobalBufferTest"

  it should "pass" in {
    test(new GlobalBufferMain) { c =>
      // Test parameters
      val testData = Seq(0x12, 0xAB, 0x34, 0xCD) // Test data
      val testAddress = Seq(0, 1, 2, 3) // Test addresses

      // Test write operation
      for ((data, address) <- testData.zip(testAddress)) {
        c.io.dataIn.poke(data.U)
        c.io.writeEnable.poke(true.B)
        c.io.address.poke(address.U)
        c.clock.step(1)
      }

      // Test read operation
      for ((data, address) <- testData.zip(testAddress)) {
        c.io.writeEnable.poke(false.B)
        c.io.address.poke(address.U)
        c.clock.step(1)
        c.io.dataOut.expect(data.U)
      }
    }
  }
}