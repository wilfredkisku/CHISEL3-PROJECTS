import chisel3._
import chisel3.util._

class fp32Class extends Module {
val io = IO(new Bundle{
  val fpnumA = Input(UInt(32.W))
  val fpnumB = Input(UInt(32.W))

  val fpSum = Output(UInt(32.W))
})

  //number A break
  val fpnumAsign = io.fpnumA(31)
  val fpnumAexp = io.fpnumA(30, 23)
  val fpnumAman = io.fpnumA(22, 0)

  //number b break
  val fpnumBsign = io.fpnumB(31)
  val fpnumBexp = io.fpnumB(30, 23)
  val fpnumBman = io.fpnumB(22, 0)

  val sum = Wire(UInt(32.W))

  sum := fpnumAman +& fpnumBman
  io.fpSum := sum

}

object xorClassMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new fp32Class())
}