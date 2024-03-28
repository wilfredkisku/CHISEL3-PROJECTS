import chisel3._
import chisel3.util._
import chiseltest._
//import chisel3.tester._
//import chisel3.tester.RawTester.test

import chiseltest.RawTester.test
import treadle._

import org.scalatest.flatspec.AnyFlatSpec

//class RegisterModuleTest {
//
//}
class RegisterModuleTest extends AnyFlatSpec with ChiselScalatestTester {
  "RegisterModule" should "pass" in {
    test(new RegisterModule) { c =>
      for (i <- 0 until 100) {
        c.io.in.poke(i.U)
        c.clock.step(1)
        c.io.out.expect((i + 1).U)
        c.io.out.expect((i + 1).U)
      }
    }
  }
}