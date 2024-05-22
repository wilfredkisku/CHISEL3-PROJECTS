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


//  //io.result := multiplier.io.output
//  val inputBuffA = RegInit(0.U(8.W))
//  val inputBuffB = RegInit(0.U(8.W))
//
//  val mulBuff = RegNext(multiplier.io.output)
//  val addBuff = RegNext(adder.io.output)
//  val resBuff = RegNext(io.result)
//
//  multiplier.io.inputA := inputBuffA
//  multiplier.io.inputB := inputBuffB
//
//  adder.io.inputA := mulBuff
//  adder.io.inputB := addBuff
//
//  resBuff := adder.io.output
//  io.result := resBuff
//
//  //handle the counter for mac operation
//  val counter = RegInit(0.U(log2Ceil(3 + 1).W))
//  counter := Mux(counter === 3.U, 0.U, counter + 1.U)
//  io.valid := counter === 3.U
//
//// unverified code
//  when(counter === 3.U){
//    inputBuffA := 0.U
//    inputBuffB := 0.U
//
//  }.otherwise{
//    inputBuffA := io.wgt
//    inputBuffB := io.ifm
//  }

// new code

    multiplier.io.inputA := io.wgt
    multiplier.io.inputB := io.ifm



  val resBuff = RegInit(0.U(8.W))
  val count = RegInit(0.U(2.W))
  val nextval = Mux(count < 3.U, adder.io.output, 0.U)
  resBuff := Mux(count < 3.U, nextval ,0.U)

  adder.io.inputA := multiplier.io.output
  adder.io.inputB := resBuff
  //io.valid := count === 3.U
  count := Mux(count === 3.U, 0.U, count + 1.U)
  io.valid := count === 3.U
  io.result := resBuff
}
// Generate Verilog for the top module
object MAC_TOP_MAIN extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new MAC_TOP_FP8())
}
