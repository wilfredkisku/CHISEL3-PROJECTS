import chisel3._
import chisel3.util._

class QueueModule extends Module {
  val io = IO(new Bundle {
    val a = Flipped(Decoupled(UInt(32.W))) // valid and bits are inputs
    val b = Flipped(Decoupled(UInt(32.W)))
    val z = Decoupled(UInt(32.W)) // valid and bits are outputs
  })
  // Note that a, b, and z are all of type DecoupledIO

  io.z.bits := 0.U(32.W)
  io.z.valid := 0.U(1.W)

  // Buffer the inputs with queues
  val qa = Queue(io.a) // io.a is the input to the FIFO
  // qa is DecoupledIO output from FIFO
  val qb = Queue(io.b)

  // We only dequeue when io.z is ready
  qa.nodeq() // equivalent to qa.ready := false.B
  qb.nodeq()

  // When qa and qb have valid inputs and io.z is ready for an output
  when (qa.valid && qb.valid && io.z.ready) {
    io.z.enq(qa.deq() + qb.deq())
    /* The above is short for
      io.z.valid := true.B
      io.z.bits := qa.bits + qb.bits
      qa.ready := true.B
      qb.ready := true.B
    */
  }
}

object QueueModuleEntry extends App {
  println("Generate the Verilog file!")
  chisel3.emitVerilog(new QueueModule())
}