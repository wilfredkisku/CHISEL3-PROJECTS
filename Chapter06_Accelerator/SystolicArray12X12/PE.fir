circuit PE :
  module PE :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip weightIn : SInt<8>, flip ifmIn : SInt<8>, parp : SInt<32>, weightOut : SInt<8>, ifmOut : SInt<8>}

    reg weightBuff : SInt, clock with :
      reset => (UInt<1>("h0"), weightBuff) @[PE.scala 13:27]
    weightBuff <= io.weightIn @[PE.scala 13:27]
    io.weightOut <= weightBuff @[PE.scala 14:16]
    reg ifmBuff : SInt, clock with :
      reset => (UInt<1>("h0"), ifmBuff) @[PE.scala 16:24]
    ifmBuff <= io.ifmIn @[PE.scala 16:24]
    io.ifmOut <= ifmBuff @[PE.scala 17:13]
    node _T = eq(io.weightIn, asSInt(UInt<1>("h0"))) @[PE.scala 19:21]
    node _T_1 = eq(io.ifmIn, asSInt(UInt<1>("h0"))) @[PE.scala 19:41]
    node _T_2 = or(_T, _T_1) @[PE.scala 19:29]
    when _T_2 : @[PE.scala 19:49]
      io.parp <= asSInt(UInt<1>("h0")) @[PE.scala 20:11]
    else :
      node _io_parp_T = mul(io.weightIn, io.ifmIn) @[PE.scala 22:28]
      io.parp <= _io_parp_T @[PE.scala 22:13]


