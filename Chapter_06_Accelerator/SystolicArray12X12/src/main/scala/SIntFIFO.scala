import chisel3._
import chisel3.util._

class SIntFIFO extends Module {
  val io = IO(new Bundle {
    val enq = Flipped(Decoupled(SInt(8.W))) // Input port for enqueueing data
    val deq = Decoupled(SInt(8.W)) // Output port for dequeueing data
  })

  // Create a FIFO queue of depth 24 for 8-bit signed integers
  val fifo = Queue(io.enq, entries = 24)

  // Connect the FIFO queue to the output port
  io.deq <> fifo
}

object TopLevel extends App {
  emitVerilog(new SIntFIFO)
}
