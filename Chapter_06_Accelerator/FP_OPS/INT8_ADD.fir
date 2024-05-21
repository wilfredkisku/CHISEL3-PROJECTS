circuit INT8_ADD :
  module INT8_ADD :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip inputA : SInt<8>, flip inputB : SInt<8>, output : SInt<9>}

    node _io_output_T = add(io.inputA, io.inputB) @[INT8_ADD.scala 12:24]
    node _io_output_T_1 = tail(_io_output_T, 1) @[INT8_ADD.scala 12:24]
    node _io_output_T_2 = asSInt(_io_output_T_1) @[INT8_ADD.scala 12:24]
    io.output <= _io_output_T_2 @[INT8_ADD.scala 12:11]

