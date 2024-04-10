import org.scalatest._
import chisel3._
import chisel3.util._
import chisel3.experimental._
import chiseltest._


class GlobalBufferTest extends FlatSpec with ChiselScalatestTester{
  behavior of "GlobalBuffer"

  it should "pass the test" in {
    test(new GlobalBuffer) { dut =>
//      // Initialize inputs
//      dut.io.enableA.poke(true.B)
//      dut.io.writeA.poke(true.B)
//      dut.io.addrA.poke(42.U)
//      dut.io.dataInA.poke(123.U)
//
//      // Wait for a few cycles
//      dut.clock.step(5)
//
//      // Verify outputs
//      dut.io.writeA.poke(false.B)
//      dut.io.dataOutA.expect(123.U)
//
//      // Deassert inputs
//      dut.io.enableA.poke(true.B)
//      dut.io.writeA.poke(false.B)
//
//      // Wait for a few more cycles
//      dut.clock.step(5)
//      dut.io.addrA.poke(42.U)
//      // Verify outputs
//      dut.io.dataOutA.expect(123.U)


      val testData = Seq(0x12, 0xAB, 0x34, 0xCD) // Test data
      val testAddress = Seq(0, 1, 2, 3) // Test addresses

      // Test write operation
      for ((data, address) <- testData.zip(testAddress)) {
        dut.io.enableA.poke(true.B)
        dut.io.dataInA.poke(data.U)
        dut.io.writeA.poke(true.B)
        dut.io.addrA.poke(address.U)
        dut.clock.step(1)
      }

      // Test read operation

      for ((data, address) <- testData.zip(testAddress)) {
        dut.io.enableA.poke(true.B)
        dut.io.writeA.poke(false.B)
        dut.io.addrA.poke(address.U)
        dut.clock.step(1)
        dut.io.dataOutA.expect(data.U)
      }

    }
  }
}