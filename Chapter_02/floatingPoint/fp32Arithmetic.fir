circuit fp32Arithmetic :
  module fp32Arithmetic :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip fpNumber : UInt<32>, sign : UInt<1>, exp : UInt<8>, mantissa : UInt<23>}

    node _io_sign_T = bits(io.fpNumber, 31, 31) @[fp32Arithmetic.scala 12:25]
    io.sign <= _io_sign_T @[fp32Arithmetic.scala 12:11]
    node _io_exp_T = bits(io.fpNumber, 30, 23) @[fp32Arithmetic.scala 13:24]
    io.exp <= _io_exp_T @[fp32Arithmetic.scala 13:10]
    node _io_mantissa_T = bits(io.fpNumber, 22, 0) @[fp32Arithmetic.scala 14:29]
    io.mantissa <= _io_mantissa_T @[fp32Arithmetic.scala 14:15]

