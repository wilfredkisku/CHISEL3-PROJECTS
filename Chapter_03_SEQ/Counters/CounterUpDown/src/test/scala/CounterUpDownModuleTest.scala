import org.scalatest.flatspec.AnyFlatSpec
import chiseltest._
import chisel3._

class CounterUpDownModuleTest extends AnyFlatSpec with ChiselScalatestTester {

  // Define the test
  behavior of "Counter Up Down Module"

  it should "count up when enabled and upDown is true" in {
    test(new CounterUpDownModule(7)) { c =>
      c.io.en.poke(true.B)
      c.io.upDown.poke(true.B)
      c.clock.step(1) // Tick the clock once

      c.io.out.expect(1.U)

      c.clock.step(1) // Tick the clock again
      c.io.out.expect(2.U)
    }
  }

  it should "count down when enabled and upDown is false" in {
    test(new CounterUpDownModule(7)) { c =>
      c.io.en.poke(true.B)
      c.io.upDown.poke(false.B)
      c.clock.step(1) // Tick the clock once

      c.io.out.expect(7.U)

      c.clock.step(1) // Tick the clock again
      c.io.out.expect(6.U)
    }
  }

  it should "not count when disabled" in {
    test(new CounterUpDownModule(7)) { c =>
      c.io.en.poke(false.B)
      c.io.upDown.poke(true.B)
      c.clock.step(1) // Tick the clock once

      c.io.out.expect(0.U)

      c.clock.step(1) // Tick the clock again
      c.io.out.expect(0.U)
    }
  }

  it should "wrap around when reaching max value" in {
    test(new CounterUpDownModule(7)) { c =>
      c.io.en.poke(true.B)
      c.io.upDown.poke(true.B)

      c.clock.step(1) // 0 -> 1
      c.io.out.expect(1.U)

      c.clock.step(1) // 1 -> 2
      c.io.out.expect(2.U)

      c.clock.step(1) // 2 -> 3 (wrap around to 0)
      c.io.out.expect(3.U)
    }
  }

  it should "wrap around when reaching min value" in {
    test(new CounterUpDownModule(7)) { c =>
      c.io.en.poke(true.B)
      c.io.upDown.poke(false.B)

      c.clock.step(1) // 0 -> 3 (wrap around to 3)
      c.io.out.expect(7.U)

      c.clock.step(1) // 3 -> 2
      c.io.out.expect(6.U)

      c.clock.step(1) // 2 -> 1
      c.io.out.expect(5.U)
    }
  }
}