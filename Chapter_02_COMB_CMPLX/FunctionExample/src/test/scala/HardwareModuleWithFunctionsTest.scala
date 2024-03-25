import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._
import chisel3._

class HardwareModuleWithFunctionsTest extends AnyFlatSpec with ChiselScalatestTester{
  "HardwareModuleWithFunctions" should "pass" in {
    test(new HardwareModuleWithFunctions()) { dut =>
      // Input values
      //val inputA = Wire(UInt(4.W))
      //val inputB = 3.U
      //val condition = true.B

      ///inputA := 5.U

      // Write input values to the inputs of the DUT
      dut.io.inputA.poke(5.U)
      dut.io.inputB.poke(3.U)
      dut.io.condition.poke(true.B)

      // Wait for the output to settle
      dut.clock.step()

      // Expected output
      //val expectedResult = (5.U + 3.U) * 3.U

      // Verify the output of the DUT
      dut.io.output.expect(24.U)
    }
  }
}