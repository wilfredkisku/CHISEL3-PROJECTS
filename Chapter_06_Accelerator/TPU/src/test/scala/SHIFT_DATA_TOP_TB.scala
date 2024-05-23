import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers


class SHIFT_DATA_TOP_TB extends AnyFlatSpec with ChiselScalatestTester with Matchers {
  behavior of "data shifting"

  it should "correctly transmit data each clock" in {
    test(new SHIFT_DATA_TOP) { c =>

      c.io.inp.poke("b00110100".U) //52
      println(c.io.out.peek().toString())
      //c.io.inp.poke("b10110110".U)
      c.clock.step(1)
      println(c.io.out.peek().toString())
      c.io.inp.poke("b00000110".U) //6
      c.clock.step(1)
      println(c.io.out.peek().toString())
      c.io.inp.poke("b00000111".U) //7
      c.clock.step(1)
      println(c.io.out.peek().toString())
      c.io.inp.poke("b00010110".U) //22
      c.clock.step(1)
      println(c.io.out.peek().toString())
      c.io.inp.poke("b00010000".U) //16
      c.clock.step(1)
      println(c.io.out.peek().toString())
      c.clock.step(1)
      println(c.io.out.peek().toString())
      c.clock.step(1)
      println(c.io.out.peek().toString())
      c.clock.step(1)
      println(c.io.out.peek().toString())
      c.clock.step(1)
      println(c.io.out.peek().toString())
      c.clock.step(1)
      println(c.io.out.peek().toString())
      c.clock.step(1)
      println(c.io.out.peek().toString())
    }
  }
}