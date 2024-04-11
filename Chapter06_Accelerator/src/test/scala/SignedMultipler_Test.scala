import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class SignedMultiplier_Test extends AnyFlatSpec with ChiselScalatestTester {

  "PassThroughGenerator" should "pass" in {


    // Scala Code: `test` runs the unit test.
    // test takes a user Module and has a code block that applies pokes and expects to the
    // circuit under test (c)
    test(new SignedMultiplier) { c =>
      c.io.a.poke(-5.S)
      c.io.b.poke((-3).S)
      c.io.product.expect((15).S)
    }
    println("SUCCESS!!") // Scala Code: if we get here, our tests passed!
  }
}