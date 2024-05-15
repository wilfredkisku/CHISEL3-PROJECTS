import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class SIGNED_MUL_W1_TB extends AnyFlatSpec with ChiselScalatestTester {
  "SIGNED_MUL" should "multiply 8bit and 1bit signed integers correctly" in {
    test(new SIGNED_MUL_W1) { c =>

      c.io.inputA.poke(-24.S)
      c.io.inputB.poke(-1.S)
      c.io.output.expect(24.S)
      c.clock.step(1)

    }
  }
}