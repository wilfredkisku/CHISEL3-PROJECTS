import chisel3._

class FIFO16BIT extends Module {
  val io = IO(new Bundle {
    val wr_en = Input(Bool())
    val rd_en = Input(Bool())
    val data_in = Input(UInt(16.W))
    val data_out = Output(UInt(16.W))
    val full = Output(Bool())
    val empty = Output(Bool())
    val valid = Output(Bool())
  })

  val fifo = Reg(Vec(3, UInt(16.W)))
  val count = RegInit(0.U(2.W))
  val read_ptr = RegInit(0.U(2.W))
  val write_ptr = RegInit(0.U(2.W))

  io.empty := (count === 0.U)
  io.full := (count === 3.U)
  io.valid := !io.empty
  io.data_out := 0.U // Default value

  when(io.wr_en && !io.full) {
    fifo(write_ptr) := io.data_in
    write_ptr := Mux(write_ptr === 2.U, 0.U, write_ptr + 1.U)
    count := count + 1.U
  }

  when(io.rd_en && !io.empty) {
    io.data_out := fifo(read_ptr)
    read_ptr := Mux(read_ptr === 2.U, 0.U, read_ptr + 1.U)
    count := count - 1.U
  }
}

object FIFO16BIT_TOP extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new FIFO16BIT())
}
