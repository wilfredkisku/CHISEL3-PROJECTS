circuit SIGNED_MUL :
  module SIGNED_MUL :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip inputA : SInt<8>, flip inputB : SInt<8>, output : SInt<16>}

    node _io_output_T = mul(io.inputA, io.inputB) @[SIGNED_MUL.scala 12:26]
    io.output <= _io_output_T @[SIGNED_MUL.scala 12:13]

