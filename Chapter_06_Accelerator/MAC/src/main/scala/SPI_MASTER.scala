import chisel3._
import chisel3.util._


class SPI_MASTER extends Module {
  val io = IO(new Bundle {
    val start = Input(Bool())
    val masterData = Input(UInt(8.W))
    val miso = Input(Bool())
    val mosi = Output(Bool())
    val sclk = Output(Bool())
    val cs = Output(Bool())
  })

  val sIdle :: sActive :: Nil = Enum(2)
  val state = RegInit(sIdle)
  val bitCounter = RegInit(0.U(3.W))
  val dataReg = Reg(UInt(8.W))
  val sclkReg = RegInit(false.B)

  io.cs := true.B
  io.mosi := dataReg(7)
  //io.sclk := sclkReg
  io.sclk := clock.asBool()(false.B)

  switch(state) {
    is(sIdle) {
      when(io.start) {
        dataReg := io.masterData
        state := sActive
        io.cs := false.B
        bitCounter := 0.U
      }
    }
    is(sActive) {
      when(bitCounter === 7.U) {
        state := sIdle
        io.cs := true.B
      }.otherwise {
        sclkReg := !sclkReg
        when(sclkReg) {
          dataReg := Cat(dataReg(6, 0), io.miso)
          bitCounter := bitCounter + 1.U
        }
      }
    }
  }
}

object SPI_MASTER_TOP extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new SPI_MASTER(), Array("--target-dir", "generated_SPI"))
}