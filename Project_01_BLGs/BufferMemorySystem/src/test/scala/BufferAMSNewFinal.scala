//import chisel3._
//import chiseltest._
//import org.scalatest.flatspec.AnyFlatSpec
//import org.scalatest.matchers.should.Matchers
//
//class BufferAMSNewFinal extends AnyFlatSpec with ChiselScalatestTester {
// //behavior of "BufferAMSNew"
//
//  "BufferAMSNew" should "accumulate zero counts, sort them, and maintain indices, with reset behavior" in {
//    test(new BufferAMSNew) { c =>
//
//      // Helper function to generate a random frame or all zeros
//      def generateFrame(allZeros: Boolean = false, allOnes : Boolean = false): Seq[UInt] = {
//        if (allZeros) {
//          Seq.fill(128)(0.U(8.W)) // Generate 128 zeros
//        } else if (allOnes) {
//          Seq.fill(128)(1.U(8.W)) // Generate 128 ones
//        } else {
//          Seq.fill(128)(scala.util.Random.nextInt(256).U(8.W)) // Generate random 8-bit unsigned values
//        }
//      }
//
//      def pokeVecInput(values: Seq[UInt]): Unit = {
//        for (i <- 0 until 128) {
//          c.io.adcValues(i).poke(values(i))
//        }
//      }
//
//      def peekVecOutput(values: Seq[UInt]):Unit = {
//        for (i <- 0 until 8) {
//          c.io.zeroSums(i).expect(values(i))
//        }
//      }
//
////      for (cycle <- 0 until 16) {
////        //cycle 1
////        val frame = if (cycle % 2 == 0) generateFrame(allZeros = true) else generateFrame()
////        pokeVecInput(frame)
////        c.clock.step()
////        val slice1 = frame.slice(0, 16)
////        val slice2 = frame.slice(16, 32)
////        val slice3 = frame.slice(32, 48)
////        val slice4 = frame.slice(48, 64)
////        val slice5 = frame.slice(64, 80)
////        val slice6 = frame.slice(80, 96)
////        val slice7 = frame.slice(96, 112)
////        val slice8 = frame.slice(112, 128)
////
////        val cnt1 = slice1.map(v => (v === 0.U).asUInt).fold(0.U)(_ +& _)
////        val cnt2 = slice2.map(v => (v === 0.U).asUInt).fold(0.U)(_ +& _)
////        val cnt3 = slice3.map(v => (v === 0.U).asUInt).fold(0.U)(_ +& _)
////        val cnt4 = slice4.map(v => (v === 0.U).asUInt).fold(0.U)(_ +& _)
////        val cnt5 = slice5.map(v => (v === 0.U).asUInt).fold(0.U)(_ +& _)
////        val cnt6 = slice6.map(v => (v === 0.U).asUInt).fold(0.U)(_ +& _)
////        val cnt7 = slice7.map(v => (v === 0.U).asUInt).fold(0.U)(_ +& _)
////        val cnt8 = slice8.map(v => (v === 0.U).asUInt).fold(0.U)(_ +& _)
////
////        //val cnt = slice.map(v => (v === 0.U).asUInt).fold(0.U)(_ +& _)
////        //c.io.zeroSums.expect(VecInit())
////        peekVecOutput(Seq(cnt1.asUInt()(7, 0), cnt2.asUInt()(7, 0), cnt3.asUInt()(7, 0), cnt4.asUInt()(7, 0), cnt5.asUInt()(7, 0), cnt6.asUInt()(7, 0), cnt7.asUInt()(7, 0), cnt8.asUInt()(7, 0)))
////        // Optionally, print zero counts and sorted indices at cycle 15 for debugging
//////        if (cycle == 15) {
//////          val zeroSums = c.io.zeroSums.peek()
//////          val indicesOut = c.io.indicesOut.peek()
//////
//////          println(s"Zero Sums at cycle 15: ${zeroSums}")
//////          println(s"Indices Out at cycle 15: ${indicesOut}")
////        }
//
//      for (cycle <- 0 until 16) {
//        // Generate input frames
//        val frame = if (cycle % 2 == 0) generateFrame(allZeros = true) else generateFrame()
//        pokeVecInput(frame)
//        c.clock.step()
//
//        // Slice frame into 16-element chunks for zero counting
////        val slices = (0 until 8).map(i => frame.slice(i * 16, (i + 1) * 16))
////
////        // Count zeros in each slice
////        val zeroCounts = slices.map(slice => slice.map(v => (v === 0.U).asUInt).reduce(_ +& _))
//
//        // Split the frame into 8 slices, each with 16 elements
//        val slices: Seq[Seq[UInt]] = (0 until 8).map(i => frame.slice(i * 16, (i + 1) * 16))
//
//        // Count zeros in each slice
//        val zeroCounts: Seq[UInt] = slices.map { slice => slice.map(v => if (v == 0) 1 else 0).sum
//
//        // Check zero counts
//        peekVecOutput(zeroCounts.map(_.asUInt()(7, 0)))
//      }
//
//    }
//  }
//}
