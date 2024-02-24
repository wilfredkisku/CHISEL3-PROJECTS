circuit MyMuxWhen :
  module MyMuxWhen :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip s : UInt<1>, flip in0 : UInt<8>, flip in1 : UInt<8>, out : UInt<8>}

    when io.s : @[myMuxWhen.scala 13:15]
      io.out <= io.in1 @[myMuxWhen.scala 14:12]
    else :
      io.out <= io.in0 @[myMuxWhen.scala 16:12]


