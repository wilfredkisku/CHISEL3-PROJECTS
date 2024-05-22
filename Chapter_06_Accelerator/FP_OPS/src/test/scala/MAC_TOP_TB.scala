import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers

class MAC_TOP_TB extends AnyFlatSpec with ChiselScalatestTester with Matchers {
  behavior of "FP8 Multiply"

  it should "correctly multiply 8-bit floating-point number another" in {
    test(new MAC_TOP_FP8) { c =>
      // Initially, the valid signal should be false
      //c.io.wgt.poke("b01000000".U)
      //c.io.ifm.poke("b01000000".U)

      c.io.wgt.poke("b00110100".U)
      c.io.ifm.poke("b00111000".U)
      c.io.valid.expect(false.B)
      //c.io.result.expect("b00111100".U)
      // Step through 3 clock cycles
      (0 until 3).foreach { _ =>
        c.io.valid.expect(false.B) // Valid should still be false
        println(c.io.result.peek().toString())
        //c.io.wgt.poke("b01000000".U)
        //c.io.ifm.poke("b01000000".U)
        c.clock.step(1)
        //c.io.wgt.poke("b01000000".U)
        //c.io.ifm.poke("b00111100".U)
      }

      // On the 4th clock cycle, valid should be true

      c.io.result.expect("b00110110".U)
      c.io.valid.expect(true.B)
      c.clock.step(1)


      // After resetting, the counter starts over
//      c.reset.poke(true.B)
//      c.clock.step(1)
//      c.reset.poke(false.B)
//      c.io.valid.expect(false.B) // Valid should be false immediately after reset
    }
  }

}