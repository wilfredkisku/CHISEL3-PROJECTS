import chisel3._
import chisel3.util._

class MAC_TOP extends Module{

  val io = IO(new Bundle{
    val wgt = Input(SInt(8.W))
    val ifm = Input(SInt(8.W))
    val result = Output(SInt(16.W))
    val valid = Output(Bool())
  })


  //intermediate registers
  //defining the clock for operation
  val count = RegInit(0.U(2.W))
  count := count + 1.U

  //stage 1
  val wgtReg = Reg(SInt(8.W))
  val ifmReg = Reg(SInt(8.W))

  //stage 2
  val mulReg = Reg(SInt(16.W))

  //stage 3
  //val sumReg = Reg(SInt(16.W))
  val sumReg = RegInit(0.S(16.W))

  //stage 4
  val resultReg = Reg(SInt(16.W))

  //instantiating modules for operations inside MAC unit
  val add = Module(new SIGNED_ADD_W16())
  val mul = Module(new SIGNED_MUL())


  // get the inputs and store them in registers
  // operations after a clock cycle

  wgtReg := io.wgt
  ifmReg := io.ifm

  // add.io.inputA := wgtReg
  // add.io.inputB := ifmReg

  // Multiply the wgt and ifm to obtain a product
  // Multiply the wgtReg and ifmReg value and store the result in the mulReg
  mul.io.inputA := wgtReg
  mul.io.inputB := ifmReg
  mulReg := mul.io.output

  // Add the multiplied value
  add.io.inputA := mulReg
  add.io.inputB := sumReg
  io.result := add.io.output

  // generate the valid signal

  when(count === 3.U) {
    io.valid := true.B
    count := 0.U
  }.otherwise{
    io.valid := false.B
  }
}

// Generate Verilog for the top module
object MAC_TOP extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new MAC_TOP(), Array("--target-dir", "generated_MAC_TOP"))
}