import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class signedConversionTest extends AnyFlatSpec with ChiselScalatestTester {

  "signedConversion" should "pass" in {
    test(new signedConversion(8)) { x =>

      x.io.sign.poke(0.B)
      x.io.mag.poke(10.U)
      x.io.twos.expect(10.U)

      x.io.sign.poke(1.B)
      x.io.mag.poke(10.U)
      x.io.twos.expect("b111110110".U(9.W))

    }
  }
}