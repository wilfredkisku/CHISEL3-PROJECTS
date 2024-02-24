import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class xorClassTest extends AnyFlatSpec with ChiselScalatestTester {

  "xorClass" should "pass" in {
    test(new xorClass()) { x =>
        x.io.a.poke(0.B)
        x.io.b.poke(0.B)
        x.io.c.expect(0.B) // 0 ^ 0

        x.io.a.poke(0.B)
        x.io.b.poke(1.B)
        x.io.c.expect(1.B) // 0 ^ 1

        x.io.a.poke(1.B)
        x.io.b.poke(0.B)
        x.io.c.expect(1.B) // 1 ^ 0

        x.io.a.poke(1.B)
        x.io.b.poke(1.B)
        x.io.c.expect(0.B) // 1 ^ 1
    }
  }
}