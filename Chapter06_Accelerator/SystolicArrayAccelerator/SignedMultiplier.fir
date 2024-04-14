circuit SignedMultiplier :
  module SignedMultiplier :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : SInt<8>, flip b : SInt<8>, product : SInt<16>}

    node _io_product_T = mul(io.a, io.b) @[SignedMultipler.scala 10:22]
    io.product <= _io_product_T @[SignedMultipler.scala 10:14]

