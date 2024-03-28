import chisel3._
import chisel3.util._

class CounterWithRegInit(maxVal: Int) extends Module {
  val io = IO(new Bundle {
    val en  = Input(Bool())
    val out = Output(UInt(log2Ceil(maxVal+1).W))
  })

  val count = RegInit(0.U(log2Ceil(maxVal+1).W))
  val nextVal = Mux(count < maxVal.U, count + 1.U, 0.U)
  count := Mux(io.en, nextVal, count)
  io.out := count
}

object CounterWithRegInitMain extends App{
  println("Generate the verilog file.")
  emitVerilog(new CounterWithRegInit(17))
}