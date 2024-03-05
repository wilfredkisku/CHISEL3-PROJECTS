circuit fp32Arithmetic :
  module fp32Arithmetic :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip fpNumberA : UInt<32>, flip fpNumberB : UInt<32>, flip operation : UInt<2>, signA : UInt<1>, expA : UInt<8>, mantissaA : UInt<23>, signB : UInt<1>, expB : UInt<8>, mantissaB : UInt<23>, mag : UInt<8>}

    node _io_signA_T = bits(io.fpNumberA, 31, 31) @[fp32Arithmetic.scala 69:27]
    io.signA <= _io_signA_T @[fp32Arithmetic.scala 69:12]
    node _io_expA_T = bits(io.fpNumberA, 30, 23) @[fp32Arithmetic.scala 70:26]
    io.expA <= _io_expA_T @[fp32Arithmetic.scala 70:11]
    node _io_mantissaA_T = bits(io.fpNumberA, 22, 0) @[fp32Arithmetic.scala 71:31]
    io.mantissaA <= _io_mantissaA_T @[fp32Arithmetic.scala 71:16]
    node _io_signB_T = bits(io.fpNumberB, 31, 31) @[fp32Arithmetic.scala 74:27]
    io.signB <= _io_signB_T @[fp32Arithmetic.scala 74:12]
    node _io_expB_T = bits(io.fpNumberB, 30, 23) @[fp32Arithmetic.scala 75:26]
    io.expB <= _io_expB_T @[fp32Arithmetic.scala 75:11]
    node _io_mantissaB_T = bits(io.fpNumberB, 22, 0) @[fp32Arithmetic.scala 76:31]
    io.mantissaB <= _io_mantissaB_T @[fp32Arithmetic.scala 76:16]
    io.mag <= UInt<8>("h0") @[fp32Arithmetic.scala 79:10]
    node _T = eq(UInt<2>("h0"), io.operation) @[fp32Arithmetic.scala 82:3]
    when _T : @[fp32Arithmetic.scala 82:3]
      skip
    else :
      node _T_1 = eq(UInt<2>("h1"), io.operation) @[fp32Arithmetic.scala 82:3]
      when _T_1 : @[fp32Arithmetic.scala 82:3]
        skip
      else :
        node _T_2 = eq(UInt<2>("h2"), io.operation) @[fp32Arithmetic.scala 82:3]
        when _T_2 : @[fp32Arithmetic.scala 82:3]
          skip
        else :
          node _T_3 = eq(UInt<2>("h3"), io.operation) @[fp32Arithmetic.scala 82:3]
          when _T_3 : @[fp32Arithmetic.scala 82:3]
            skip


