import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers

class FP16MultiplierSpec extends AnyFlatSpec with ChiselScalatestTester with Matchers {
  behavior of "FP16Multiplier"

  it should "correctly multiply two 16-bit floating-point numbers" in {
    test(new FP16Multiplier) { c =>
      // Example: Multiplying 1.0 by 2.0
      // 1.0 in 16-bit float (sign=0, exponent=15 (0b01111), significand=0) -> 0b0011110000000000
      // 2.0 in 16-bit float (sign=0, exponent=16 (0b10000), significand=0) -> 0b0100000000000000
      val inputA = "b0011110000000000".U
      val inputB = "b0100000000000000".U
      // Expected result: 2.0 -> 0b0100000000000000
      val expectedResult = "b0100000000000000".U

      c.io.a.poke(inputA)
      c.io.b.poke(inputB)
      c.clock.step(1)
      c.io.result.expect(expectedResult)
    }
  }

  it should "handle multiplication by zero correctly" in {
    test(new FP16Multiplier) { c =>
      // Multiplying any number by zero should result in zero
      val inputA = "b0011110000000000".U // 1.0
      val inputB = "b0000000000000000".U // 0.0
      val expectedResult = "b0000000000000000".U // 0.0

      c.io.a.poke(inputA)
      c.io.b.poke(inputB)
      c.clock.step(1)
      c.io.result.expect(expectedResult)
    }
  }

  it should "handle infinity correctly" in {
    test(new FP16Multiplier) { c =>
      // Multiplying any non-zero number by infinity should result in infinity
      val inputA = "b0111100000000000".U // A large number
      val inputB = "b0111110000000000".U // Infinity
      val expectedResult = "b0111110000000000".U // Infinity

      c.io.a.poke(inputA)
      c.io.b.poke(inputB)
      c.clock.step(1)
      c.io.result.expect(expectedResult)
    }
  }

  // Add more tests as needed to cover other cases like denormalized numbers, NaN, etc.
}