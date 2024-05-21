circuit FxP8_MUL :
  module FxP8_MUL :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip inputA : Fixed<8><<6>>, flip inputB : Fixed<8><<6>>, output : Fixed<8><<6>>}

    node _io_output_T = mul(io.inputA, io.inputB) @[FIXED8_MUL.scala 14:26]
    io.output <= _io_output_T @[FIXED8_MUL.scala 14:13]

