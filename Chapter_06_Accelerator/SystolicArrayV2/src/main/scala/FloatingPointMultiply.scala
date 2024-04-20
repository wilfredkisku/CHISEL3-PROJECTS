import chisel3._
import chisel3.util._

class FP16Multiplier extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(16.W))
    val b = Input(UInt(16.W))
    val result = Output(UInt(16.W))
  })

  // Extract sign, exponent, and significand, including implicit leading 1 for normalized numbers
  def extractFP(fp: UInt) = {
    val sign = fp(15)
    val exponent = fp(14, 10)
    val significand = Cat("b1".U(1.W), fp(9, 0)) // Assuming normalized, add leading 1
    (sign, exponent, significand)
  }

  val (signA, expA, sigA) = extractFP(io.a)
  val (signB, expB, sigB) = extractFP(io.b)

  // Calculate new sign
  val newSign = signA ^ signB

  // Special Cases Flags
  val isZeroA = expA === 0.U && io.a(9, 0) === 0.U
  val isZeroB = expB === 0.U && io.b(9, 0) === 0.U
  val isInfA = expA === "b11111".U
  val isInfB = expB === "b11111".U
  val isDenormA = expA === 0.U && io.a(9, 0) =/= 0.U
  val isDenormB = expB === 0.U && io.b(9, 0) =/= 0.U

  when(isZeroA || isZeroB) {
    // If either A or B is zero, the result is zero (with the appropriate sign)
    io.result := Cat(newSign, 0.U(15.W))
  }.elsewhen(isInfA || isInfB) {
    // If either A or B is infinity, the result is infinity (with the appropriate sign)
    io.result := Cat(newSign, "b11111".U, 0.U(10.W))
  }.otherwise {
    // Handle normal and denormalized numbers
    val expResult = (expA.zext() + expB.zext() - "b01111".U.zext()).asUInt() // Adjust for bias
    val sigResult = (sigA * sigB)(21, 10) // Multiply significands and normalize

    // Check for overflow or underflow in exponent
    when(expResult(5)) {
      // Underflow
      io.result := 0.U // For simplicity, could be improved to handle gradual underflow
    }.elsewhen(expResult > "b11110".U) {
      // Overflow
      io.result := Cat(newSign, "b11111".U, 0.U(10.W)) // Infinity
    }.otherwise {
      // Normal result
      io.result := Cat(newSign, expResult(4, 0), sigResult(9, 0))
    }
  }
}

object FP16Multiplier extends App{
println((new chisel3.stage.ChiselStage).emitVerilog(new FP16Multiplier))

}