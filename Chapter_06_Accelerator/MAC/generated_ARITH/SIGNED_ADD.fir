circuit SIGNED_ADD :
  module SIGNED_ADD :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip inputA : SInt<8>, flip inputB : SInt<8>, output : SInt<9>}

    node _io_output_T = add(io.inputA, io.inputB) @[SIGNED_ADD.scala 12:26]
    io.output <= _io_output_T @[SIGNED_ADD.scala 12:13]

