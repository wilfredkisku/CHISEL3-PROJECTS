import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers

class FP_MUL_TB extends AnyFlatSpec with ChiselScalatestTester with Matchers {
  behavior of "FP8 Multiply"

//  it should "correctly multiply 8-bit floating-point numbers to result in larger than normal" in {
//    test(new FP8_MUL) { c =>
//      // Example: Adding 0.0 with 0.0
//      val inputA = "b01111001".U
//      val inputB = "b11111011".U
//      // Expected result: 0.0 -> 0b00000000
//      val expectedResult = "b11111100".U
//
//      c.io.inputA.poke(inputA)
//      c.io.inputB.poke(inputB)
//      c.clock.step(1)
//      c.io.output.expect(expectedResult)
//    }
//  }
//  it should "correctly multiply 8-bit floating-point numbers to result in smaller than subnormal" in {
//    test(new FP8_MUL) { c =>
//      // Example: Adding 0.0 with 0.0
//      val inputA = "b00000001".U
//      val inputB = "b10000011".U
//      // Expected result: 0.0 -> 0b00000000
//      val expectedResult = "b00000000".U
//
//      c.io.inputA.poke(inputA)
//      c.io.inputB.poke(inputB)
//      c.clock.step(1)
//      c.io.output.expect(expectedResult)
//    }
//  }

  it should "correctly multiply 8-bit floating-point number" in {
    test(new FP8_MUL) { c =>
      // Example: Adding 0.0 with 0.0
      val inputA = "b01010010".U
      val inputB = "b10010111".U
      // Expected result: 0.0 -> 0b00000000
      val expectedResult = "b10101101".U

      c.io.inputA.poke(inputA)
      c.io.inputB.poke(inputB)
      c.clock.step(1)
      c.io.output.expect(expectedResult)
    }
  }
//  it should "correctly result as the number if any 8-bit floating-point number is zero" in {
//    test(new FP8_ADD) { c =>
//      // Example: Adding 0.0 with 0.0
//      val inputB = "b00000000".U
//      val inputA = "b11111111".U
//      // Expected result: 0.0 -> 0b00000000
//      val expectedResult = "b11111111".U
//
//      c.io.inputA.poke(inputA)
//      c.io.inputB.poke(inputB)
//      c.clock.step(1)
//      c.io.output.expect(expectedResult)
//    }
//  }
//
//  it should "add two 8-bit fp normal number" in {
//    test(new FP8_ADD) { c =>
//      // Example: Adding 0.0 with 0.0
//      val inputB_1 = "b01001101".U
//      val inputA_1 = "b11001101".U
//      // Expected result: 0.0 -> 0b00000000
//      val expectedResult_1 = "b00000000".U
//
//      c.io.inputA.poke(inputA_1)
//      c.io.inputB.poke(inputB_1)
//      c.clock.step(1)
//      c.io.output.expect(expectedResult_1)
//
//      // Example: Adding 0.0 with 0.0
//      val inputB_2 = "b01001111".U
//      val inputA_2 = "b01001111".U
//      // Expected result: 0.0 -> 0b00000000
//      val expectedResult_2 = "b01010011".U
//
//      c.io.inputA.poke(inputA_2)
//      c.io.inputB.poke(inputB_2)
//      c.clock.step(1)
//      c.io.output.expect(expectedResult_2)
//
//      // Example: Adding 0.0 with 0.0
//      val inputB_3 = "b11111011".U
//      val inputA_3 = "b11111011".U
//      // Expected result: 0.0 -> 0b00000000
//      val expectedResult_3 = "b11111111".U
//
//      c.io.inputA.poke(inputA_3)
//      c.io.inputB.poke(inputB_3)
//      c.clock.step(1)
//      c.io.output.expect(expectedResult_3)
//
//      // Example: Adding 0.0 with 0.0
//      val inputB_4 = "b11111011".U
//      val inputA_4 = "b11111001".U
//      // Expected result: 0.0 -> 0b00000000
//      val expectedResult_4 = "b11111110".U
//
//      c.io.inputA.poke(inputA_4)
//      c.io.inputB.poke(inputB_4)
//      c.clock.step(1)
//      c.io.output.expect(expectedResult_4)
//
//      // Example: Adding 0.0 with 0.0
//      val inputB_5 = "b00111001".U
//      val inputA_5 = "b00111001".U
//      // Expected result: 0.0 -> 0b00000000
//      val expectedResult_5 = "b00111101".U
//
//      c.io.inputA.poke(inputA_5)
//      c.io.inputB.poke(inputB_5)
//      c.clock.step(1)
//      c.io.output.expect(expectedResult_5)
//    }
//  }
//
//  it should "add two 8-bit fp subnormal number" in {
//    test(new FP8_ADD) { c =>
//      // Example: Adding 0.0 with 0.0
//      val inputB_1 = "b00000001".U
//      val inputA_1 = "b10000001".U
//      // Expected result: 0.0 -> 0b00000000
//      val expectedResult_1 = "b00000000".U
//
//      c.io.inputA.poke(inputA_1)
//      c.io.inputB.poke(inputB_1)
//      c.clock.step(1)
//      c.io.output.expect(expectedResult_1)
//
//      // Example: Adding 0.0 with 0.0
//      val inputB_2 = "b10000011".U
//      val inputA_2 = "b10000011".U
//      // Expected result: 0.0 -> 0b00000000
//      val expectedResult_2 = "b10000110".U
//
//      c.io.inputA.poke(inputA_2)
//      c.io.inputB.poke(inputB_2)
//      c.clock.step(1)
//      c.io.output.expect(expectedResult_2)
//
//      // Example: Adding 0.0 with 0.0
//      val inputB_3 = "b10000011".U
//      val inputA_3 = "b10000001".U
//      // Expected result: 0.0 -> 0b00000000
//      val expectedResult_3 = "b10000100".U
//
//      c.io.inputA.poke(inputA_3)
//      c.io.inputB.poke(inputB_3)
//      c.clock.step(1)
//      c.io.output.expect(expectedResult_3)
//
//      // Example: Adding 0.0 with 0.0
//      val inputB_4 = "b10000011".U
//      val inputA_4 = "b00000001".U
//      // Expected result: 0.0 -> 0b00000000
//      val expectedResult_4 = "b10000010".U
//
//      c.io.inputA.poke(inputA_4)
//      c.io.inputB.poke(inputB_4)
//      c.clock.step(1)
//      c.io.output.expect(expectedResult_4)
//    }
//  }
//
//  it should "add two 8-bit fp numbers either subnormal or normal" in {
//    test(new FP8_ADD) { c =>
//      // Example: Adding 0.0 with 0.0
//      val inputB_1 = "b00000101".U
//      val inputA_1 = "b10000011".U
//      // Expected result: 0.0 -> 0b00000000
//      val expectedResult_1 = "b00000100".U
//
//      c.io.inputA.poke(inputA_1)
//      c.io.inputB.poke(inputB_1)
//      c.clock.step(1)
//      c.io.output.expect(expectedResult_1)
//
//      // Example: Adding 0.0 with 0.0
//      val inputB_2 = "b00000101".U
//      val inputA_2 = "b10000011".U
//      // Expected result: 0.0 -> 0b00000000
//      val expectedResult_2 = "b00000100".U
//
//      c.io.inputA.poke(inputA_2)
//      c.io.inputB.poke(inputB_2)
//      c.clock.step(1)
//      c.io.output.expect(expectedResult_2)
//
//      // Example: Adding 0.0 with 0.0
//      val inputB_3 = "b10000101".U
//      val inputA_3 = "b00000011".U
//      // Expected result: 0.0 -> 0b00000000
//      val expectedResult_3 = "b10000100".U
//
//      c.io.inputA.poke(inputA_3)
//      c.io.inputB.poke(inputB_3)
//      c.clock.step(1)
//      c.io.output.expect(expectedResult_3)
//    }
//  }
}