  import chisel3._
  import chiseltest._
  import org.scalatest.flatspec.AnyFlatSpec

  class SPI_MASTER_TB extends AnyFlatSpec with ChiselScalatestTester {
    "SPIMaster" should "send and receive data correctly" in {
      test(new SPI_MASTER) { c =>
        c.io.start.poke(true.B)
        c.io.masterData.poke("b10011101".U)
        c.io.miso.poke(false.B) // Assuming slave sends 0s
        c.clock.step(1)
        c.io.start.poke(false.B)

        val inputB5 = "b10011101".U

        for (i <- 0 until 16) { // 8 bits * 2 (for SCLK toggle)
          println(c.io.mosi.peek())
          c.clock.step(1)

          //println(inputB5(i).asBool)
        }
        c.io.cs.expect(true.B)
      }
    }
  }