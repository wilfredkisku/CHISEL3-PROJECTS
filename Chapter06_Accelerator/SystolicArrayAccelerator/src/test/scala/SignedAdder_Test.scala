import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class SignedAdder_Test extends AnyFlatSpec with ChiselScalatestTester {

  "PassThroughGenerator" should "pass" in {


    // Scala Code: `test` runs the unit test.
    // test takes a user Module and has a code block that applies pokes and expects to the
    // circuit under test (c)
    test(new SignedAdder) { c =>
      c.io.a.poke(-5.S)
      c.io.b.poke((-3).S)
      c.io.carryOut.expect(true.B)
      c.io.overflow.expect(false.B)
      c.io.sum.expect((-8).S)
    }
    println("SUCCESS!!") // Scala Code: if we get here, our tests passed!
  }
}