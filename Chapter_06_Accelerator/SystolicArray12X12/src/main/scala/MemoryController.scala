import chisel3._
import chisel3.util._

class MemoryController(dataWidth: Int, addrWidth: Int) extends Module {
  val io = IO(new Bundle {
    val readEnable = Input(Bool())
    val weightAddr = Input(UInt(addrWidth.W))
    val featureMapAddr = Input(UInt(addrWidth.W))
    val weightDataOut = Output(UInt(dataWidth.W))
    val featureMapDataOut = Output(UInt(dataWidth.W))
    val readDone = Output(Bool())
  })

  // Dummy memory modules for weights and input feature maps
  val weightMemory = Mem(1024, UInt(dataWidth.W)) // Example size
  val featureMapMemory = Mem(1024, UInt(dataWidth.W)) // Example size

  // State machine for controlling reads
  val sIdle :: sReadWeights :: sReadFeatureMaps :: sDone :: Nil = Enum(4)
  val state = RegInit(sIdle)

  // Registers to hold data
  val weightDataReg = Reg(UInt(dataWidth.W))
  val featureMapDataReg = Reg(UInt(dataWidth.W))

  // Default outputs
  io.weightDataOut := weightDataReg
  io.featureMapDataOut := featureMapDataReg
  io.readDone := false.B

  switch(state) {
    is(sIdle) {
      when(io.readEnable) {
        state := sReadWeights
      }
    }
    is(sReadWeights) {
      weightDataReg := weightMemory.read(io.weightAddr)
      state := sReadFeatureMaps
    }
    is(sReadFeatureMaps) {
      featureMapDataReg := featureMapMemory.read(io.featureMapAddr)
      state := sDone
    }
    is(sDone) {
      io.readDone := true.B
      when(!io.readEnable) {
        state := sIdle
      }
    }
  }
}

object MemoryControllerMain extends App{
  emitVerilog(new MemoryController(8, 10))
}