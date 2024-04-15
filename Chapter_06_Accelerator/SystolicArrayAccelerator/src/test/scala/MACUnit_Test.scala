import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class MACUnit_Test extends AnyFlatSpec with ChiselScalatestTester {

  "PassThroughGenerator" should "pass" in {


    // Scala Code: `test` runs the unit test.
    // test takes a user Module and has a code block that applies pokes and expects to the
    // circuit under test (c)
    test(new MACUnit) { c =>
      c.io.inputA.poke(5.S)
      c.io.weight.poke((-3).S)
      c.io.inputB.poke((-15).S)
      c.io.output.expect((-30).S)
    }
    println("SUCCESS!!") // Scala Code: if we get here, our tests passed!
  }
}