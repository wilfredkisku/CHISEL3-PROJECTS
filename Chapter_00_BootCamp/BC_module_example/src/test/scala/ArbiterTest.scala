import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class ArbiterTest extends AnyFlatSpec with ChiselScalatestTester {

  "ArbiterTest" should "pass" in {


    // Scala Code: `test` runs the unit test.
    // test takes a user Module and has a code block that applies pokes and expects to the
    // circuit under test (c)
    test(new Arbiter()) { c =>
      import scala.util.Random
      val data = Random.nextInt(65536)
      c.io.fifo_data.poke(data.U)

      for (i <- 0 until 8) {
        c.io.fifo_valid.poke((((i >> 0) % 2) != 0).B)
        c.io.pe0_ready.poke((((i >> 1) % 2) != 0).B)
        c.io.pe1_ready.poke((((i >> 2) % 2) != 0).B)

        c.io.fifo_ready.expect((i > 1).B)
        c.io.pe0_valid.expect((i == 3 || i == 7).B)
        c.io.pe1_valid.expect((i == 5).B)

        if (i == 3 || i ==7) {
          c.io.pe0_data.expect((data).U)
        } else if (i == 5) {
          c.io.pe1_data.expect((data).U)
        }
      }
      println("SUCCESS!!") // Scala Code: if we get here, our tests passed!
    }
  }
}