circuit FxP8_ADD :
  module FxP8_ADD :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in1 : Fixed<8><<6>>, flip in2 : Fixed<8><<6>>, out : Fixed<8><<6>>}

    node _io_out_T = add(io.in1, io.in2) @[FIXED8_ADD.scala 14:20]
    node _io_out_T_1 = tail(_io_out_T, 1) @[FIXED8_ADD.scala 14:20]
    node _io_out_T_2 = asFixedPoint(_io_out_T_1, 6) @[FIXED8_ADD.scala 14:20]
    io.out <= _io_out_T_2 @[FIXED8_ADD.scala 14:10]

