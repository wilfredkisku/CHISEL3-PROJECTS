import chisel3._
import chisel3.util._

class BufferMemorySystem extends Module{
  val width: Int = 8
  val io = IO(new Bundle{
    val enable = Input(Bool())
    val write = Input(Bool())
    val addr = Input(UInt(4.W))
    val adcValues = Input(Vec(128, UInt(width.W)))
    val dataOut = Output(Vec(128, UInt(width.W)))
  })

  val counter = RegInit(0.U(4.W))
  //val count = UInt(4.W)
  val mem = SyncReadMem(16, Vec(128, UInt(width.W)))

  when ( io.enable && counter < 16.U ){
    counter := counter + 1.U
  }
  //when(io.enable && io.write){
  mem.write(counter, io.adcValues)
  //}
  io.dataOut := mem.read(io.addr, io.enable)
}


object TopLevel extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new BufferMemorySystem)
}