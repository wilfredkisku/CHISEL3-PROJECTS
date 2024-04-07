import chisel3._
import chisel3.util._
import chisel3.experimental._
import chisel3.experimental.BundleLiterals._

class QueueModule[T <: Data](ioType: T, entries: Int = 200) extends Module {
  val in = IO(Flipped(Decoupled(ioType)))
  val out = IO(Decoupled(ioType))
  out <> Queue(in, entries)
}



object QueueModuleMain extends App{
  //val io = IO(new in1)
  println("Generate the verilog file.")
  emitVerilog(new  QueueModule(UInt(9.W)))
}