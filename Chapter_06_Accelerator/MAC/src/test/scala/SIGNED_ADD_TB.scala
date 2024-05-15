import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class SIGNED_ADD_TB extends AnyFlatSpec with ChiselScalatestTester {
  "SIGNED_MUL" should "add two 8bit signed integers correctly" in {
    test(new SIGNED_ADD) { c =>

      c.io.inputA.poke(-128.S)
      c.io.inputB.poke(-128.S)
      c.io.output.expect(-256.S)
      c.clock.step(1)

    }
  }
}