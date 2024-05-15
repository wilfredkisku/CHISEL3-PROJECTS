import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class SIGNED_ADD_W1_TB extends AnyFlatSpec with ChiselScalatestTester {
  "SIGNED_MUL" should "add an 8bit and 1bit signed integers correctly" in {
    test(new SIGNED_ADD_W1) { c =>

      c.io.inputA.poke(-128.S)
      c.io.inputB.poke(-1.S)
      c.io.output.expect(-129.S)
      c.clock.step(1)

    }
  }
}