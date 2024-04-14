FIRRTL version 1.1.0
circuit SignedMultiplier :
  module SignedMultiplier :
    input clock : Clock
    input reset : UInt<1>
    input io_a : SInt<8>
    input io_b : SInt<8>
    output io_product : SInt<16>

    node _io_product_T = mul(io_a, io_b) @[SignedMultipler.scala 10:22]
    io_product <= _io_product_T @[SignedMultipler.scala 10:14]
