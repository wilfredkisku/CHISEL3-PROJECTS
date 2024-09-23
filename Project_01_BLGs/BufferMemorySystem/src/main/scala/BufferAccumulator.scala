import chisel3._
import chisel3.util._

class BufferAccumulator extends Module{
  val width: Int = 8
  val io = IO(new Bundle{
    val adcValues = Input(Vec(128, UInt(width.W)))
    //val dataOut = Output(Vec(128, UInt(width.W)))
    val zeroSums = Output(Vec(8, UInt(8.W)))
  })

  val zeroAccumulators = RegInit(VecInit(Seq.fill(8)(0.U(8.W))))

  val lineCounter = RegInit(0.U(4.W))

  when (lineCounter === 15.U){
    lineCounter := 0.U
    zeroAccumulators := VecInit(Seq.fill(8)(0.U(8.W)))
  } .otherwise{
    lineCounter := lineCounter + 1.U

    for (i <- 0 until 8){
      val slice = io.adcValues.slice(i*16, (i+1)*16)
      val zeroCount = slice.map(v => (v === 0.U).asUInt).fold(0.U)(_ +& _)

      zeroAccumulators(i) := zeroAccumulators(i) + zeroCount
    }

  }
  io.zeroSums := zeroAccumulators

}


object BufferAccumulatorTopLevel extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new BufferAccumulator)
}