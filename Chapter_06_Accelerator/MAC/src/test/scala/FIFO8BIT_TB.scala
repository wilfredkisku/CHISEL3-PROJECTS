import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers

class FIFO8BitTest extends AnyFlatSpec with ChiselScalatestTester with Matchers {
  behavior of "FIFO8Bit"

  it should "enqueue and dequeue correctly" in {
    test(new FIFO8Bit) { c =>
      c.io.wr_en.poke(true.B)
      c.io.rd_en.poke(false.B)
      c.io.data_in.poke(1.U)
      c.clock.step(1)

      c.io.data_in.poke(2.U)
      c.clock.step(1)

      c.io.data_in.poke(3.U)
      c.clock.step(1)

      c.io.full.expect(true.B)
      c.io.wr_en.poke(false.B)
      c.io.rd_en.poke(true.B)

      c.io.data_out.expect(1.U)

      c.clock.step(1)
      c.io.data_out.expect(2.U)
      c.io.valid.expect(true.B)

      c.clock.step(1)
      c.io.data_out.expect(3.U)
      c.io.valid.expect(true.B)

      c.clock.step(1)
//      c.io.data_out.expect(3.U)
//      c.io.valid.expect(true.B)

      c.io.empty.expect(true.B)
    }
  }

  it should "not overflow" in {
    test(new FIFO8Bit) { c =>
      c.io.wr_en.poke(true.B)
      for (i <- 1 to 4) {
        c.io.data_in.poke(i.U)
        c.clock.step(1)
      }

      c.io.full.expect(true.B)
      c.io.wr_en.poke(false.B)
      c.io.rd_en.poke(true.B)
      c.clock.step(1) // Start reading

      c.io.valid.expect(true.B)
    }
  }

  it should "not underflow" in {
    test(new FIFO8Bit) { c =>
      c.io.wr_en.poke(true.B)
      c.io.data_in.poke(42.U)
      c.clock.step(1)

      c.io.wr_en.poke(false.B)
      c.io.rd_en.poke(true.B)

      c.io.data_out.expect(42.U)
      c.io.valid.expect(true.B)
      c.clock.step(1)


//      c.clock.step(1)

      c.io.empty.expect(true.B)
      c.io.valid.expect(false.B)
    }
  }
}