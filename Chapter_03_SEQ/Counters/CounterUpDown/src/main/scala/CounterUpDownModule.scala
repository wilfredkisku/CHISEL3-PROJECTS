import chisel3._
import chisel3.util._

class CounterUpDownModule(maxVal : Int) extends Module{

  val io = IO(new Bundle{
    val en = Input(Bool())
    val upDown = Input(Bool())
    val out = Output(UInt(log2Ceil(maxVal + 1).W))
  })

  val count = RegInit(0.U(log2Ceil(maxVal + 1).W))
  val nextValUp = Mux(count < maxVal.U, count + 1.U, 0.U)
  val nextValDown = Mux(count > 0.U, count - 1.U, log2Ceil(maxVal + 1).U)

//  when (io.en) {
//    when (count < maxVal.U) {
//      count := count + 1.U
//    } .otherwise {
//      count := 0.U
//    }
//  }
//  io.out := count

  when(io.upDown){
  count := Mux(io.en, nextValUp, count)
  }
    .otherwise {
      count := Mux(io.en, nextValDown, count)
    }

  io.out := count
}

object CounterUpDownModuleMain extends App{
  println("Generate the verilog file.")
  emitVerilog(new CounterUpDownModule(7))
}