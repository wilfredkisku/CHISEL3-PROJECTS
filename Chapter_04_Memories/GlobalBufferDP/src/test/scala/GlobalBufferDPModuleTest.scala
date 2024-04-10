import org.scalatest._
import chisel3._
import chisel3.util._
import chisel3.experimental._
import chiseltest._

class GlobalBufferDPModuleTest extends FlatSpec with ChiselScalatestTester {
  behavior of "GlobalBufferDPModule"

  it should "pass the test" in{
    test(new GlobalBufferDPModule(1024, 16)){ dut =>

      val testData = Seq(0x12, 0xAB, 0x34, 0xCD, 0xFF, 0xFE) // Test data
      val testAddress = Seq(0, 1, 2, 3, 128, 129) // Test addresses

      // Test write operation
      for ((data, address) <- testData.zip(testAddress)) {
        dut.io.rdWrPortA.enableA.poke(true.B)
        dut.io.rdWrPortA.dataInA.poke(data.U)
        dut.io.rdWrPortA.writeA.poke(true.B)
        dut.io.rdWrPortA.addrA.poke(address.U)
        dut.clock.step(1)
      }
      for ((data, address) <- testData.zip(testAddress)) {
        dut.io.rdWrPortB.enableB.poke(true.B)
        dut.io.rdWrPortB.dataInB.poke(data.U)
        dut.io.rdWrPortB.writeB.poke(true.B)
        dut.io.rdWrPortB.addrB.poke(address.U)
        dut.clock.step(1)
      }

      for ((data, address) <- testData.zip(testAddress)) {
        dut.io.rdWrPortA.enableA.poke(true.B)
        dut.io.rdWrPortA.writeA.poke(false.B)
        dut.io.rdWrPortA.addrA.poke(address.U)
        dut.clock.step(1)
        dut.io.rdWrPortA.dataOutA.expect(data.U)
      }

    }
  }

}
