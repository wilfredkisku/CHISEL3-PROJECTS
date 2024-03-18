import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class PassThroughGeneratorTest extends AnyFlatSpec with ChiselScalatestTester {

  "PassThroughGenerator" should "pass" in {


    // Scala Code: `test` runs the unit test.
    // test takes a user Module and has a code block that applies pokes and expects to the
    // circuit under test (c)
    test(new PassThroughGenerator(10)) { c =>
      c.io.in.poke(0.U)
      c.io.out.expect(0.U)
      c.io.in.poke(1023.U)
      c.io.out.expect(1023.U)
    }
    println("SUCCESS!!") // Scala Code: if we get here, our tests passed!
  }
}

