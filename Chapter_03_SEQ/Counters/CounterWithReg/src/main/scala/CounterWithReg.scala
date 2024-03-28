import chisel3._
import chisel3.util._

class CounterWithReg(maxVal : Int) extends Module{
  val io = IO(new Bundle{
    val en = Input(Bool())
    val out = Output(UInt(log2Ceil(maxVal + 1).W))
  })

  val count = Reg(UInt(log2Ceil(maxVal + 1).W))
  val NextVal = Mux(count < maxVal.U, count + 1.U, 0.U)
  val applyEn = Mux(io.en, NextVal, count)

  count := Mux(reset.asBool, 0.U, applyEn)
  io.out := count
}

object CounterWithRegMain extends App{
  println("Generate the verilog file.")
  emitVerilog(new CounterWithReg(7))
}