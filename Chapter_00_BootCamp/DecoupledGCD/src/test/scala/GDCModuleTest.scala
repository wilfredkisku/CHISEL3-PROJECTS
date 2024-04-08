import chisel3._
import chisel3.util._
import chiseltest._
import chisel3.experimental.BundleLiterals._
//import chisel3.tester._
//import chisel3.tester.RawTester.test

import chiseltest.RawTester.test
import treadle._

import org.scalatest.flatspec.AnyFlatSpec

class GDCModuleTest(w: Int) extends AnyFlatSpec with ChiselScalatestTester {
  "GCDModule" should "pass" in {
    test(new GCDModule(w: Int)) { dut =>
      dut.input.initSource().setSourceClock(dut.clock)
      dut.output.initSink().setSinkClock(dut.clock)

      val testValues = for { x <- 1 to 10; y <- 1 to 10} yield (x, y)
      val inputSeq = testValues.map { case (x, y) =>
        (new GcdInputBundle(16)).Lit(_.value1 -> x.U, _.value2 -> y.U)
      }
      val resultSeq = testValues.map { case (x, y) =>
        new GcdOutputBundle(16).Lit(_.value1 -> x.U, _.value2 -> y.U, _.gcd -> BigInt(x).gcd(BigInt(y)).U)
      }

      fork {
        //spawn multiple input processes
        dut.input.enqueueSeq(inputSeq)
      }.fork {
        // for (var <- init_val to end_val)
        // expect output from multiple spawned processes
        for (expected <- resultSeq) {
          dut.output.expectDequeue(expected)
          dut.clock.step(5) // wait some cycles before receiving the next output to create backpressure
        }
      }.join()
    }
  }
}

object GDCModuleTestMain extends App{
  val obj = new GDCModuleTest(16)
  println(obj)
}