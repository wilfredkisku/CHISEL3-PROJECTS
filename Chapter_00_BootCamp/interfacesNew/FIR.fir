circuit FIR :
  module FIR :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<8>, out : UInt<8>}

    wire inp : UInt<8> @[FIR.scala 13:17]
    inp <= io.in @[FIR.scala 14:7]
    reg x_n1 : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[FIR.scala 15:21]
    x_n1 <= inp @[FIR.scala 15:21]
    reg x_n2 : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[FIR.scala 16:21]
    x_n2 <= x_n1 @[FIR.scala 16:21]
    reg x_n3 : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[FIR.scala 17:21]
    x_n3 <= x_n2 @[FIR.scala 17:21]
    node _io_out_T = mul(io.in, UInt<8>("h1")) @[FIR.scala 18:19]
    node _io_out_T_1 = mul(x_n1, UInt<8>("h1")) @[FIR.scala 19:10]
    node _io_out_T_2 = add(_io_out_T, _io_out_T_1) @[FIR.scala 18:31]
    node _io_out_T_3 = tail(_io_out_T_2, 1) @[FIR.scala 18:31]
    node _io_out_T_4 = mul(x_n2, UInt<8>("h1")) @[FIR.scala 20:10]
    node _io_out_T_5 = add(_io_out_T_3, _io_out_T_4) @[FIR.scala 19:22]
    node _io_out_T_6 = tail(_io_out_T_5, 1) @[FIR.scala 19:22]
    node _io_out_T_7 = mul(x_n3, UInt<8>("h1")) @[FIR.scala 21:10]
    node _io_out_T_8 = add(_io_out_T_6, _io_out_T_7) @[FIR.scala 20:22]
    node _io_out_T_9 = tail(_io_out_T_8, 1) @[FIR.scala 20:22]
    io.out <= _io_out_T_9 @[FIR.scala 18:10]

