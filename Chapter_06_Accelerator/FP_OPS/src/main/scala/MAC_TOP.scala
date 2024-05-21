import chisel3._
import chisel3.util._

class MAC_TOP_FP8 extends Module{

  val io = IO(new Bundle{
    val wgt = Input(UInt(8.W))
    val ifm = Input(UInt(8.W))
    val result = Output(UInt(8.W))
    val valid = Output(Bool())
  })

  val multiplier = Module(new FP8_MUL)
  val adder = Module(new FP8_ADD)

  adder.io.inputA := io.wgt
  adder.io.inputB := io.ifm

  multiplier.io.inputA := io.wgt
  multiplier.io.inputB := io.ifm

  io.result := multiplier.io.output

  val inputABuff = RegInit(0.U(8.W))
  val inputBBuff = RegInit(0.U(8.W))

  //handle the counter for mac operation
  val counter = RegInit(0.U(log2Ceil(3 + 1).W))
  counter := Mux(counter === 3.U, 0.U, counter + 1.U)
  io.valid := counter === 3.U

  //unverified code
  val regOutput = RegInit(0.U(8.W))

  when(counter === 3.U){
    inputABuff := multiplier.io.output
    multiplier.io.inputA := input
    //multiplier.io.inputA := multiplier.io.output
    //multiplier.io.inputB := multiplier.io.inputB
    regOutput :=  regOutput
  }.otherwise{
    io.result := regOutput
  }

}
// Generate Verilog for the top module
object MAC_TOP_MAIN extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new MAC_TOP_FP8())
}
