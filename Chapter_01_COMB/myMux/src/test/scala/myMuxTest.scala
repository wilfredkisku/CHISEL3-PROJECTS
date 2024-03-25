import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class myMuxTest extends AnyFlatSpec with ChiselScalatestTester {

  "MyMux" should "pass" in {
    test(new MyMux()) { x =>

      x.io.s.poke(0.B)
      x.io.in0.poke(0.B)
      x.io.in1.poke(0.B)
      x.io.out.expect(0.B)

      x.io.s.poke(1.B)
      x.io.in0.poke(0.B)
      x.io.in1.poke(0.B)
      x.io.out.expect(0.B)

      x.io.s.poke(0.B)
      x.io.in0.poke(1.B)
      x.io.in1.poke(0.B)
      x.io.out.expect(1.B)

      x.io.s.poke(1.B)
      x.io.in0.poke(1.B)
      x.io.in1.poke(1.B)
      x.io.out.expect(1.B)

    }
  }
}
