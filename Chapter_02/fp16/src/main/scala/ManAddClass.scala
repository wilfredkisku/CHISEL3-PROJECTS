import chisel3._
import chisel3.util._

class ManAddClass extends Module {
  val io = IO(new Bundle {
    val manA = Input(UInt(23.W))
    val manB = Input(UInt(23.W))
    val exp = Input(UInt(8.W))
    val manOut = Output(UInt(23.W))
    val expOut = Output(UInt(8.W))
  })

  val operandA = Wire(UInt(24.W))
  val operandB = Wire(UInt(24.W))
  val operandOut = Wire(UInt(24.W))

  //val operandexp = Wire(UInt(8.W))

  operandA:= Cat(1.U, io.manA)
  operandB := Cat(1.U, io.manB)
  io.expOut := io.exp

  operandOut := operandA + operandB

  when(operandOut(23) === 1.U)
    {
    io.manOut := (operandOut >> 1.U)(22,0)
    io.expOut := io.exp + 1.U
    }
    .otherwise
    {
      io.manOut := operandOut(22,0)
    }
}


object ManAddClassMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new ManAddClass())
}