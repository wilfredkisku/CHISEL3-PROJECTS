circuit myMuxParameterized :
  module myMuxParameterized :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip s : UInt<1>, flip in0 : UInt<8>, flip in1 : UInt<8>, out : UInt<8>}

    node _io_out_T = mux(io.s, io.in1, io.in0) @[myMuxParameterized.scala 14:18]
    io.out <= _io_out_T @[myMuxParameterized.scala 14:12]

