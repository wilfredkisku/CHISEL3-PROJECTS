import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class NormalizeClassTest extends AnyFlatSpec with ChiselScalatestTester {

  "NormalizeClass" should "pass" in {
    test(new NormalizeClass()) { r =>
      r.io.mantissa.poke(1215306.U)
      r.clock.step()
      r.io.shift.expect(3.U)
      r.io.normMantissa.expect(1333840.U)
    }
  }
}