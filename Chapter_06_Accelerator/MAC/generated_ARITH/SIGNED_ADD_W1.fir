circuit SIGNED_ADD_W1 :
  module SIGNED_ADD_W1 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip inputA : SInt<8>, flip inputB : SInt<1>, output : SInt<9>}

    node _io_output_T = add(io.inputA, io.inputB) @[SIGNED_ADD_W1.scala 12:26]
    io.output <= _io_output_T @[SIGNED_ADD_W1.scala 12:13]

