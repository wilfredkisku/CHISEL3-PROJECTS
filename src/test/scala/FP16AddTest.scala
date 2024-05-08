/*
  CHECK FOR THESE NUMEBRS IN THE TEST
  0 01111 0000000000  3C00                   1                   1    1
  0 00101 0000000000  1400        0.0009765625        0.0009765625    eps
  0 01111 0000000001  3C01         1.000976563         1.000976563    1+eps
  1 10000 0000000000  C000                  -2                  -2    -2
  0 11110 1111111111  7BFF               65504               65504    2/r*(2-eps)
  0 00001 0000000000  0400     6.103515625e-05     6.103515625e-05    r
  0 00000 1111111111  03FF     6.097555161e-05     6.097555161e-05    r*(1-eps)
  0 00000 0000000001  0001     5.960464478e-08     5.960464478e-08    r*eps
  0 00000 0000000001  0001     5.960464478e-08     5.960464478e-08    r*eps/2
  0 00000 0000000000  0000                   0                   0    zero
  0 00000 0000000000  0000                   0                   0    -zero
  0 11111 0000000000  7C00                 Inf                 Inf    1/zero
  1 11111 0000000000  FC00                -Inf                -Inf    -1/zero
  1 11111 1111111111  FFFF                 NaN                 NaN    zero/zero
  0 01101 0101010101  3555        0.3333333333        0.3332519531    1/3
 */
import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers

class FP16AddTest extends AnyFlatSpec with ChiselScalatestTester with Matchers {
  behavior of "FP16Add"

  it should "correctly add two 16-bit floating-point numbers" in {
    test(new FP16Add) { c =>
      // Example: Adding -0.0 with +0.0
      // -0.0 in 16-bit float (sign=1, exponent=15 (0b00000), significand=0) -> 0b1000000000000000
      // +0.0 in 16-bit float (sign=0, exponent=16 (0b00000), significand=0) -> 0b0000000000000000
      val inputA = "b1000000000000000".U
      val inputB = "b0000000000000000".U
      // Expected result: 0.0 -> 0b0000000000000000
      val expectedResult = "b0000000000000000".U

      c.io.a.poke(inputA)
      c.io.b.poke(inputB)
      c.clock.step(1)
      c.io.result.expect(expectedResult)

      // Example: Adding -0.0 with +0.0
      // -0.0 in 16-bit float (sign=1, exponent=15 (0b00000), significand=0) -> 0b1000000000000000
      // -0.0 in 16-bit float (sign=0, exponent=16 (0b00000), significand=0) -> 0b1000000000000000
      val inputA2 = "b1000000000000000".U
      val inputB2 = "b1000000000000000".U
      // Expected result: 2.0 -> 0b0100000000000000
      val expectedResult2 = "b0000000000000000".U

      c.io.a.poke(inputA2)
      c.io.b.poke(inputB2)
      c.clock.step(1)
      c.io.result.expect(expectedResult2)

      // Example: Adding -0.0 with -0.0077
      // -0.0077 in 16-bit float (sign=1, exponent=15 (0b00000), significand=0) -> 0b1001111111100010
      // -0.0 in 16-bit float (sign=0, exponent=16 (0b00000), significand=0) -> 0b1000000000000000
      val inputA3 = "b1001111111100010".U
      val inputB3 = "b1000000000000000".U
      // Expected result: 2.0 -> 0b0100000000000000
      val expectedResult3 = "b1001111111100010".U

      c.io.a.poke(inputA3)
      c.io.b.poke(inputB3)
      c.clock.step(1)
      c.io.result.expect(expectedResult3)

      // Example: Adding -0.0 with -0.0077
      // -0.0077 in 16-bit float (sign=1, exponent=15 (0b00000), significand=0) -> 0b1001111111100010
      // -0.0 in 16-bit float (sign=0, exponent=16 (0b00000), significand=0) -> 0b1000000000000000
      val inputA4 = "b0000000000000000".U
      val inputB4 = "b0101000010100010".U
      val expectedResult4 = "b0101000010100010".U

      c.io.a.poke(inputA4)
      c.io.b.poke(inputB4)
      c.clock.step(1)
      c.io.result.expect(expectedResult4)

      // Example: Adding -0.0 with -0.0077
      // -0.0077 in 16-bit float (sign=1, exponent=15 (0b00000), significand=0) -> 0b1001111111100010
      // -0.0 in 16-bit float (sign=0, exponent=16 (0b00000), significand=0) -> 0b1000000000000000
      val inputA5 = "b1011000000001001".U
      val inputB5 = "b1000100000001001".U
      val expectedResult5 = "b1011000000001010".U

      c.io.a.poke(inputA5)
      c.io.b.poke(inputB5)
      c.clock.step(1)
      c.io.result.expect(expectedResult5)

      // Example: Adding -0.0 with -0.0077
      // -inf in 16-bit float (sign=1, exponent=16 (0b11111), significand=0) -> b1111110000000000
      // +inf in 16-bit float (sign=0, exponent=16 (0b11111), significand=0) -> b0111110000000000
      val inputA6 = "b1111110000000000".U
      val inputB6 = "b0111110000000000".U
      val expectedResult6 = "b0111111111111111".U

      c.io.a.poke(inputA6)
      c.io.b.poke(inputB6)
      c.clock.step(1)
      c.io.result.expect(expectedResult6)

    }
  }
}
