import chisel3._
import chisel3.util._

class FloatingPointMultiplier extends Module {
  val io = IO(new Bundle {
    val input1 = Input(UInt(16.W)) // 18-bit input 1: 1 sign bit, 8 bit exponent, 9 bit mantissa
    val input2 = Input(UInt(16.W)) // 18-bit input 2: 1 sign bit, 8 bit exponent, 9 bit mantissa
    val output = Output(UInt(16.W)) // 16-bit output: 1 sign bit, 7 bit exponent, 8 bit mantissa
  })

  // Separate sign, exponent, and mantissa for input 1
  val input1Sign = io.input1(15)
  val input1Exponent = io.input1(14, 7)
  val input1Mantissa = Cat(1.U(1.W), io.input1(6, 0))

  // Separate sign, exponent, and mantissa for input 2
  val input2Sign = io.input2(15)
  val input2Exponent = io.input2(14, 7)
  val input2Mantissa = Cat(1.U(1.W), io.input2(6, 0))

  // Normalize inputs
//  val (normInput1Mantissa, normInput1Exponent) = normalize(input1Mantissa, input1Exponent)
//  val (normInput2Mantissa, normInput2Exponent) = normalize(input2Mantissa, input2Exponent)

  // Multiply mantissas
  val multipliedMantissa = Wire(UInt(14.W))
  multipliedMantissa :=  input1Mantissa * input2Mantissa

    // Determine the sign of the result
  val resultSign = input1Sign ^ input2Sign

  val multipliedExponent = Wire(UInt(9.W))

  // Combine sign, exponent, and mantissa for the output
  val outputSign = resultSign
  val outputExponent = multipliedExponent(7,0)
  val outputMantissa = Wire(UInt(7.W))

  // Add exponents
  when (multipliedMantissa(13) === 1.U)
  {
      multipliedExponent := input1Exponent + input2Exponent + 1.U
      outputMantissa := multipliedMantissa(8,1)
  }
    .otherwise{
      multipliedExponent := input1Exponent + input2Exponent
      outputMantissa := multipliedMantissa(7,0)
    }

  //outputMantissa := multipliedMantissa(16, 9)

  // Output result
  io.output := Cat(outputSign, outputExponent, outputMantissa)

//  // Function to normalize mantissa and adjust exponent
//  def normalize(mantissa: UInt, exponent: UInt): (UInt, UInt) = {
//    val leadingZeros = PriorityEncoder(Reverse(mantissa)) + 1.U
//    val normMantissa = (mantissa << leadingZeros).asUInt()
//    val normExponent = exponent - leadingZeros
//    (normMantissa, normExponent)
//  }
}

object FloatingPointMultiplierMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new FloatingPointMultiplier())
}