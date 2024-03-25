import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class RaccoonClassTest extends AnyFlatSpec with ChiselScalatestTester {

  "RaccoonClass" should "pass" in {
    test(new RaccoonClass()) { r =>
      r.io.noise.poke(1.B)
      r.io.trash.poke(0.B)
      r.io.food.poke(0.B)
      r.clock.step()
      r.io.action.expect(RaccAction.hide)

      r.io.noise.poke(0.B)
      r.clock.step()
      r.io.action.expect(RaccAction.wander)

      r.io.trash.poke(1.B)
      r.clock.step()
      r.io.action.expect(RaccAction.rummage)

      r.io.trash.poke(0.B)
      r.io.food.poke(1.B)
      r.clock.step()
      r.io.action.expect(RaccAction.eat)

      r.io.food.poke(1.B)
      r.clock.step()
      r.io.action.expect(RaccAction.eat)

      r.io.food.poke(0.B)
      r.clock.step()
      r.io.action.expect(RaccAction.wander)

      r.io.noise.poke(1.B)
      r.clock.step()
      r.io.action.expect(RaccAction.hide)
    }
  }
}