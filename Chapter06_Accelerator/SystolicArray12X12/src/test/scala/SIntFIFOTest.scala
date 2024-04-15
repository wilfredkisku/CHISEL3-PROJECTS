import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers

class SIntFIFOTest extends AnyFlatSpec with ChiselScalatestTester with Matchers {
  behavior of "SIntFIFO"

  it should "enqueue and dequeue elements correctly" in {
    test(new SIntFIFO) { c =>
      val testValues = Seq(-128, -64, 0, 64, 127) // Example test values

      // Enqueue test values
      testValues.foreach { value =>
        c.io.enq.valid.poke(true.B)
        c.io.enq.bits.poke(value.S(8.W))
        c.clock.step(1) // Advance simulation time
      }
      c.io.enq.valid.poke(false.B) // Stop enqueueing

      // Allow some cycles between enqueue and dequeue
      c.clock.step(5)

      // Dequeue and check values
      testValues.foreach { expectedValue =>
        c.io.deq.ready.poke(true.B)
        c.io.deq.valid.expect(true.B) // Expect valid data to be available
        c.io.deq.bits.expect(expectedValue.S(8.W)) // Check the dequeued value
        c.clock.step(1) // Advance simulation time

      }
    }
  }
}