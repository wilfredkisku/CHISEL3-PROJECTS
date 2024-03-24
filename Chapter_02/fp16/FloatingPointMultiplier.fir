circuit FloatingPointMultiplier :
  module FloatingPointMultiplier :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip input1 : UInt<16>, flip input2 : UInt<16>, output : UInt<16>}

    node input1Sign = bits(io.input1, 15, 15) @[FloatingPointMultiplier.scala 12:29]
    node input1Exponent = bits(io.input1, 14, 7) @[FloatingPointMultiplier.scala 13:33]
    node _input1Mantissa_T = bits(io.input1, 6, 0) @[FloatingPointMultiplier.scala 14:47]
    node input1Mantissa = cat(UInt<1>("h1"), _input1Mantissa_T) @[Cat.scala 33:92]
    node input2Sign = bits(io.input2, 15, 15) @[FloatingPointMultiplier.scala 17:29]
    node input2Exponent = bits(io.input2, 14, 7) @[FloatingPointMultiplier.scala 18:33]
    node _input2Mantissa_T = bits(io.input2, 6, 0) @[FloatingPointMultiplier.scala 19:47]
    node input2Mantissa = cat(UInt<1>("h1"), _input2Mantissa_T) @[Cat.scala 33:92]
    wire multipliedMantissa : UInt<14> @[FloatingPointMultiplier.scala 26:32]
    node _multipliedMantissa_T = mul(input1Mantissa, input2Mantissa) @[FloatingPointMultiplier.scala 27:41]
    multipliedMantissa <= _multipliedMantissa_T @[FloatingPointMultiplier.scala 27:22]
    node outputSign = xor(input1Sign, input2Sign) @[FloatingPointMultiplier.scala 30:31]
    wire multipliedExponent : UInt<9> @[FloatingPointMultiplier.scala 32:32]
    node outputExponent = bits(multipliedExponent, 7, 0) @[FloatingPointMultiplier.scala 36:42]
    wire outputMantissa : UInt<7> @[FloatingPointMultiplier.scala 37:28]
    node _T = bits(multipliedMantissa, 13, 13) @[FloatingPointMultiplier.scala 40:27]
    node _T_1 = eq(_T, UInt<1>("h1")) @[FloatingPointMultiplier.scala 40:32]
    when _T_1 : @[FloatingPointMultiplier.scala 41:3]
      node _multipliedExponent_T = add(input1Exponent, input2Exponent) @[FloatingPointMultiplier.scala 42:44]
      node _multipliedExponent_T_1 = tail(_multipliedExponent_T, 1) @[FloatingPointMultiplier.scala 42:44]
      node _multipliedExponent_T_2 = add(_multipliedExponent_T_1, UInt<1>("h1")) @[FloatingPointMultiplier.scala 42:61]
      node _multipliedExponent_T_3 = tail(_multipliedExponent_T_2, 1) @[FloatingPointMultiplier.scala 42:61]
      multipliedExponent <= _multipliedExponent_T_3 @[FloatingPointMultiplier.scala 42:26]
      node _outputMantissa_T = bits(multipliedMantissa, 8, 1) @[FloatingPointMultiplier.scala 43:43]
      outputMantissa <= _outputMantissa_T @[FloatingPointMultiplier.scala 43:22]
    else :
      node _multipliedExponent_T_4 = add(input1Exponent, input2Exponent) @[FloatingPointMultiplier.scala 46:44]
      node _multipliedExponent_T_5 = tail(_multipliedExponent_T_4, 1) @[FloatingPointMultiplier.scala 46:44]
      multipliedExponent <= _multipliedExponent_T_5 @[FloatingPointMultiplier.scala 46:26]
      node _outputMantissa_T_1 = bits(multipliedMantissa, 7, 0) @[FloatingPointMultiplier.scala 47:43]
      outputMantissa <= _outputMantissa_T_1 @[FloatingPointMultiplier.scala 47:22]
    node io_output_hi = cat(outputSign, outputExponent) @[Cat.scala 33:92]
    node _io_output_T = cat(io_output_hi, outputMantissa) @[Cat.scala 33:92]
    io.output <= _io_output_T @[FloatingPointMultiplier.scala 53:13]

