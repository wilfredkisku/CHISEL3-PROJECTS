circuit SIGNED_ADD_W16 :
  module SIGNED_ADD_W16 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip inputA : SInt<16>, flip inputB : SInt<16>, output : SInt<17>}

    node _io_output_T = add(io.inputA, io.inputB) @[SIGNED_ADD_W16.scala 12:26]
    io.output <= _io_output_T @[SIGNED_ADD_W16.scala 12:13]

