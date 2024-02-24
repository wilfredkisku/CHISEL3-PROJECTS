FIRRTL version 1.1.0
circuit MyMux :
  module MyMux :
    input clock : Clock
    input reset : UInt<1>
    input io_s : UInt<1>
    input io_in0 : UInt<1>
    input io_in1 : UInt<1>
    output io_out : UInt<1>

    node _io_out_T = mux(io_s, io_in1, io_in0) @[myMux.scala 14:16]
    io_out <= _io_out_T @[myMux.scala 14:10]
