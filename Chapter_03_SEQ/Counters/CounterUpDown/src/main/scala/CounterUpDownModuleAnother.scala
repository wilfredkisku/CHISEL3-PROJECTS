import chisel3._
import chisel3.util._

class CounterUpDownModuleAnother(maxVal : Int) extends Module{

  val io = IO(new Bundle{
    val en = Input(Bool())
    val upDown = Input(Bool())
    val out = Output(UInt(log2Ceil(maxVal + 1).W))
  })

  val count = RegInit(0.U(log2Ceil(maxVal + 1).W))
  val nextValUp = Mux(count < maxVal.U, count + 1.U, 0.U)
  val nextValDown = Mux(count > 0.U, count - 1.U, maxVal.U)

  count := Mux(io.en & io.upDown, nextValUp, nextValDown)
  //count := Mux(io.en & ~io.upDown, nextValDown, count)
//  when(io.upDown){
//    count := Mux(io.en, nextValUp, count)
//  }
//    .otherwise {
//      count := Mux(io.en, nextValDown, count)
//    }

  io.out := count
}

object CounterUpDownModuleAnotherMain extends App{
  println("Generate the verilog file.")
  emitVerilog(new CounterUpDownModuleAnother(7))
}
