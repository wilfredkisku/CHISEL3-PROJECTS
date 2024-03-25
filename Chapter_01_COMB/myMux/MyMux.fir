circuit MyMux :
  module MyMux :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip s : UInt<1>, flip in0 : UInt<1>, flip in1 : UInt<1>, out : UInt<1>}

    node _io_out_T = mux(io.s, io.in1, io.in0) @[myMux.scala 14:16]
    io.out <= _io_out_T @[myMux.scala 14:10]

