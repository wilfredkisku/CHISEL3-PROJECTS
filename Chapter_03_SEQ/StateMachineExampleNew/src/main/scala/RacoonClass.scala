
import chisel3._
import chisel3.util._


object RaccAction extends ChiselEnum {
  val hide, wander, rummage, eat = Value
}
class RaccoonClass extends Module { // using when
  val io = IO(new Bundle {
    val noise = Input(Bool())
    val trash = Input(Bool())
    val food  = Input(Bool())
    val action = Output(RaccAction())
  })
  val state = RegInit(RaccAction.hide)
  when (state === RaccAction.hide) {
    when (!io.noise) { state := RaccAction.wander }
  } .elsewhen (state === RaccAction.wander) {
    when (io.noise) { state := RaccAction.hide }
      .elsewhen (io.trash) { state := RaccAction.rummage }
  } .elsewhen (state === RaccAction.rummage) {
    when (io.noise) { state := RaccAction.hide }
      .elsewhen (io.food) { state := RaccAction.eat }
  } .elsewhen (state === RaccAction.eat) {
    when (io.noise) { state := RaccAction.hide }
      .elsewhen (!io.food) { state := RaccAction.wander }
  }
  io.action := state
}

object RaccActionClassMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new RaccoonClass())
}