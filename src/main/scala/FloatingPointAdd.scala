import chisel3._
import chisel3.util._

class FP16AdderExtended extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(16.W))
    val b = Input(UInt(16.W))
    val result = Output(UInt(16.W))
  })

  // Extract sign, exponent, and significand
  def extractFP(fp: UInt) = {
    val sign = fp(15)
    val exponent = fp(14, 10)
    val significand = fp(9, 0)
    (sign, exponent, significand)
  }

  val (signA, expA, sigA) = extractFP(io.a)
  val (signB, expB, sigB) = extractFP(io.b)

  // Special Cases Flags
  val zeroFlagA = expA === 0.U && sigA === 0.U
  val zeroFlagB = expB === 0.U && sigB === 0.U
  val infFlagA = expA === "b11111".U && sigA === 0.U
  val infFlagB = expB === "b11111".U && sigB === 0.U

  // Handling special cases
  when(zeroFlagA && !zeroFlagB) {
    // A is zero, return B
    io.result := io.b
  }.elsewhen(!zeroFlagA && zeroFlagB) {
    // B is zero, return A
    io.result := io.a
  }.elsewhen(zeroFlagA && zeroFlagB) {
    // Both are zero (considering signs could be handled here as well)
    io.result := io.a // or io.b, since both are zero
  }.elsewhen(infFlagA || infFlagB) {
    // Handling infinity
    when(infFlagA && infFlagB && (signA =/= signB)) {
      // Inf - Inf = NaN
      io.result := "b1111111111111111".U // NaN representation (sign does not matter)
    }.otherwise {
      // One or both are infinity, result is infinity with the sign of A or B
      // If signs are different in subtraction, this would need more logic
      io.result := Mux(infFlagA, io.a, io.b)
    }
  }.otherwise {
    // Normal addition logic here, including handling denormalized numbers
    // This is where you would insert the logic from the previous example
    // and extend it to handle denormalized numbers more accurately.

    // Placeholder for normal addition logic
    io.result := 0.U // Replace this with actual addition logic
  }
}

object FP16AdderExtendedMain extends App{
  println((new chisel3.stage.ChiselStage).emitVerilog(new FP16AdderExtended))
}
