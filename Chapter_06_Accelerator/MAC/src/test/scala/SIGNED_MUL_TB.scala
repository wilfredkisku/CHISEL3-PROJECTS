import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class SIGNED_MUL_TB extends AnyFlatSpec with ChiselScalatestTester {
  "SIGNED_MUL" should "multiply two 8bit signed integers correctly" in {
    test(new SIGNED_MUL) { c =>

      c.io.inputA.poke(-24.S)
      c.io.inputB.poke(-10.S)
      c.io.output.expect(240.S)
      c.clock.step(1)

    }
  }
}