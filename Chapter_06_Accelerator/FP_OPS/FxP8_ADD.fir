circuit FxP8_ADD :
  module FxP8_ADD :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip inputA : Fixed<8><<6>>, flip inputB : Fixed<8><<6>>, output : Fixed<9><<6>>}

    node _io_output_T = add(io.inputA, io.inputB) @[FIXED8_ADD.scala 14:26]
    node _io_output_T_1 = tail(_io_output_T, 1) @[FIXED8_ADD.scala 14:26]
    node _io_output_T_2 = asFixedPoint(_io_output_T_1, 6) @[FIXED8_ADD.scala 14:26]
    io.output <= _io_output_T_2 @[FIXED8_ADD.scala 14:13]

