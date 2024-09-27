import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class BufferAMSNewTestbench extends AnyFlatSpec with ChiselScalatestTester {

  "BufferAMSNew" should "pass" in{
    test(new BufferAMSNew()) { x =>

//      val seq1 = Seq.fill(20)(1.U(8.W))
//      val seq2 = Seq.fill(100)(0.U(8.W))
//      val seq3 = Seq.fill(8)(1.U(8.W))
//      val seq4 = Seq.fill(32)(0.U(8.W))
//      val seq5 = Seq.fill(68)(1.U(8.W))
//      val seq6 = Seq.fill(12)(0.U(8.W))
//      val seq7 = Seq.fill(16)(0.U(8.W))
//      val seq8 = Seq.fill(16)(1.U(8.W))
//      val seq9 = Seq.fill(40)(1.U(8.W))
//      val seq10 = Seq.fill(50)(0.U(8.W))
//
//      val adcFrame1 = VecInit(seq1 ++ seq2 ++ seq3)
//
//      x.io.adcValues.poke(adcFrame1)
//      x.clock.step(1)
//
//      //x.io.zeroSums.expect()
//      //x.io.indicesOut.expect()
//      val frameOut1 = VecInit(seq1 ++ seq2 ++ seq3)
//      x.io.frameOut.expect(frameOut1)

      // Create sequences
      val seq1 = Seq.fill(20)(0.U(8.W))
      val seq2 = Seq.fill(100)(1.U(8.W))
      val seq3 = Seq.fill(8)(0.U(8.W))

      // Concatenate sequences
      val adcFrame1 = seq1 ++ seq2 ++ seq3

      // Poke each element of adcValues Vec one by one
      for (i <- 0 until 128) {
        x.io.adcValues(i).poke(adcFrame1(i))
      }

      // step 1
      x.clock.step(1)

      // Check the frameOut Vec by comparing each element
      for (i <- 0 until 128) {
        x.io.frameOut(i).expect(adcFrame1(i))
      }


      // You can also check zeroSums or indicesOut here if you have logic for them
      // Example:
       x.io.zeroSums(0).expect(16.U)
       x.io.zeroSums(1).expect(4.U)

      // Create sequences
      val seq1_2 = Seq.fill(20)(0.U(8.W))
      val seq2_2 = Seq.fill(100)(1.U(8.W))
      val seq3_2 = Seq.fill(8)(0.U(8.W))

      // Concatenate sequences
      val adcFrame2 = seq1_2 ++ seq2_2 ++ seq3_2

      // Poke each element of adcValues Vec one by one
      for (i <- 0 until 128) {
        x.io.adcValues(i).poke(adcFrame2(i))
      }

      // step 2
      x.clock.step(1)

      x.io.zeroSums(0).expect(32.U)
      x.io.zeroSums(1).expect(8.U)

      // step 3
      x.clock.step(1)

      x.io.zeroSums(0).expect(48.U)
      x.io.zeroSums(1).expect(12.U)

      // step 4
      x.clock.step(1)
      // step 5
      x.clock.step(1)
      // step 6
      x.clock.step(1)
      // step 7
      x.clock.step(1)
      // step 8
      x.clock.step(1)
      // step 9
      x.clock.step(1)
      // step 10
      x.clock.step(1)
      // step 11
      x.clock.step(1)
      // step 12
      x.clock.step(1)
      // step 13
      x.clock.step(1)
      // step 14
      x.clock.step(1)
      // step 15
      x.clock.step(1)
      x.io.zeroSums(0).expect(240.U)
      x.io.zeroSums(1).expect(60.U)
      // step 16
      x.clock.step(1)
      x.io.zeroSums(0).expect(256.U)
      x.io.zeroSums(1).expect(64.U)

      val indicesOutValues = x.io.indicesOut.peek() // Get the values from indicesOut
      println("indicesOut values: " + indicesOutValues.map(_.litValue).mkString(", "))

      val zeroSumsValues2 = x.io.zeroSums.peek() // Get the values from indicesOut
      println("ZeroSums values: " + zeroSumsValues2.map(_.litValue).mkString(", "))

      //step 17
      x.clock.step(1)
      x.io.zeroSums(0).expect(0.U)
      x.io.zeroSums(1).expect(0.U)

      val indicesOutValues2 = x.io.indicesOut.peek() // Get the values from indicesOut
      println("indicesOut values: " + indicesOutValues2.map(_.litValue).mkString(", "))

            x.clock.step(1)
      x.io.zeroSums(0).expect(16.U)
      x.io.zeroSums(1).expect(4.U)

      // Concatenate sequences
      val seq5 = Seq.fill(18)(1.U(8.W))
      val seq5_ = Seq.fill(14)(0.U(8.W))
      val seq6 = Seq.fill(64)(0.U(8.W))
      val seq7 = Seq.fill(16)(0.U(8.W))
      val seq8 = Seq.fill(16)(0.U(8.W))
      val adcFrame3 = seq5 ++ seq5_ ++ seq6++ seq7 ++ seq8

      // Poke each element of adcValues Vec one by one
      for (i <- 0 until 128) {
        x.io.adcValues(i).poke(adcFrame3(i))
      }

      x.clock.step(1)
      x.io.zeroSums(0).expect(16.U)
      x.io.zeroSums(1).expect(18.U)
    }
  }

}
