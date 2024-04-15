import chisel3._
import chisel3.util._

class PE extends Module{
val io = IO(new Bundle{
  val weightIn = Input(SInt(8.W))
  val ifmIn = Input(SInt(8.W))
  val parp = Output(SInt(32.W))
  val weightOut = Output(SInt(8.W))
  val ifmOut = Output(SInt(8.W))
})

  val weightBuff = RegNext(io.weightIn)
  io.weightOut := weightBuff

  val ifmBuff = RegNext(io.ifmIn)
  io.ifmOut := ifmBuff

  when (io.weightIn === 0.S || io.ifmIn === 0.S){
  io.parp := 0.S
  }.otherwise {
    io.parp := io.weightIn * io.ifmIn
  }

}
