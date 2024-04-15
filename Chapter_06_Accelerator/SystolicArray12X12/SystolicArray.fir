circuit SystolicArray :
  module PE :
    input clock : Clock
    input reset : Reset
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


  module PE_1 :
    input clock : Clock
    input reset : Reset
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


  module PE_2 :
    input clock : Clock
    input reset : Reset
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


  module PE_3 :
    input clock : Clock
    input reset : Reset
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


  module PE_4 :
    input clock : Clock
    input reset : Reset
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


  module PE_5 :
    input clock : Clock
    input reset : Reset
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


  module PE_6 :
    input clock : Clock
    input reset : Reset
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


  module PE_7 :
    input clock : Clock
    input reset : Reset
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


  module PE_8 :
    input clock : Clock
    input reset : Reset
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


  module PE_9 :
    input clock : Clock
    input reset : Reset
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


  module PE_10 :
    input clock : Clock
    input reset : Reset
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


  module PE_11 :
    input clock : Clock
    input reset : Reset
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


  module PE_12 :
    input clock : Clock
    input reset : Reset
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


  module PE_13 :
    input clock : Clock
    input reset : Reset
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


  module PE_14 :
    input clock : Clock
    input reset : Reset
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


  module PE_15 :
    input clock : Clock
    input reset : Reset
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


  module PE_16 :
    input clock : Clock
    input reset : Reset
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


  module PE_17 :
    input clock : Clock
    input reset : Reset
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


  module PE_18 :
    input clock : Clock
    input reset : Reset
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


  module PE_19 :
    input clock : Clock
    input reset : Reset
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


  module PE_20 :
    input clock : Clock
    input reset : Reset
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


  module PE_21 :
    input clock : Clock
    input reset : Reset
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


  module PE_22 :
    input clock : Clock
    input reset : Reset
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


  module PE_23 :
    input clock : Clock
    input reset : Reset
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


  module PE_24 :
    input clock : Clock
    input reset : Reset
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


  module PE_25 :
    input clock : Clock
    input reset : Reset
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


  module PE_26 :
    input clock : Clock
    input reset : Reset
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


  module PE_27 :
    input clock : Clock
    input reset : Reset
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


  module PE_28 :
    input clock : Clock
    input reset : Reset
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


  module PE_29 :
    input clock : Clock
    input reset : Reset
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


  module PE_30 :
    input clock : Clock
    input reset : Reset
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


  module PE_31 :
    input clock : Clock
    input reset : Reset
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


  module PE_32 :
    input clock : Clock
    input reset : Reset
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


  module PE_33 :
    input clock : Clock
    input reset : Reset
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


  module PE_34 :
    input clock : Clock
    input reset : Reset
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


  module PE_35 :
    input clock : Clock
    input reset : Reset
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


  module PE_36 :
    input clock : Clock
    input reset : Reset
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


  module PE_37 :
    input clock : Clock
    input reset : Reset
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


  module PE_38 :
    input clock : Clock
    input reset : Reset
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


  module PE_39 :
    input clock : Clock
    input reset : Reset
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


  module PE_40 :
    input clock : Clock
    input reset : Reset
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


  module PE_41 :
    input clock : Clock
    input reset : Reset
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


  module PE_42 :
    input clock : Clock
    input reset : Reset
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


  module PE_43 :
    input clock : Clock
    input reset : Reset
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


  module PE_44 :
    input clock : Clock
    input reset : Reset
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


  module PE_45 :
    input clock : Clock
    input reset : Reset
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


  module PE_46 :
    input clock : Clock
    input reset : Reset
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


  module PE_47 :
    input clock : Clock
    input reset : Reset
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


  module PE_48 :
    input clock : Clock
    input reset : Reset
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


  module PE_49 :
    input clock : Clock
    input reset : Reset
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


  module PE_50 :
    input clock : Clock
    input reset : Reset
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


  module PE_51 :
    input clock : Clock
    input reset : Reset
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


  module PE_52 :
    input clock : Clock
    input reset : Reset
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


  module PE_53 :
    input clock : Clock
    input reset : Reset
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


  module PE_54 :
    input clock : Clock
    input reset : Reset
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


  module PE_55 :
    input clock : Clock
    input reset : Reset
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


  module PE_56 :
    input clock : Clock
    input reset : Reset
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


  module PE_57 :
    input clock : Clock
    input reset : Reset
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


  module PE_58 :
    input clock : Clock
    input reset : Reset
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


  module PE_59 :
    input clock : Clock
    input reset : Reset
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


  module PE_60 :
    input clock : Clock
    input reset : Reset
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


  module PE_61 :
    input clock : Clock
    input reset : Reset
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


  module PE_62 :
    input clock : Clock
    input reset : Reset
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


  module PE_63 :
    input clock : Clock
    input reset : Reset
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


  module PE_64 :
    input clock : Clock
    input reset : Reset
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


  module PE_65 :
    input clock : Clock
    input reset : Reset
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


  module PE_66 :
    input clock : Clock
    input reset : Reset
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


  module PE_67 :
    input clock : Clock
    input reset : Reset
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


  module PE_68 :
    input clock : Clock
    input reset : Reset
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


  module PE_69 :
    input clock : Clock
    input reset : Reset
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


  module PE_70 :
    input clock : Clock
    input reset : Reset
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


  module PE_71 :
    input clock : Clock
    input reset : Reset
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


  module PE_72 :
    input clock : Clock
    input reset : Reset
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


  module PE_73 :
    input clock : Clock
    input reset : Reset
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


  module PE_74 :
    input clock : Clock
    input reset : Reset
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


  module PE_75 :
    input clock : Clock
    input reset : Reset
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


  module PE_76 :
    input clock : Clock
    input reset : Reset
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


  module PE_77 :
    input clock : Clock
    input reset : Reset
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


  module PE_78 :
    input clock : Clock
    input reset : Reset
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


  module PE_79 :
    input clock : Clock
    input reset : Reset
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


  module PE_80 :
    input clock : Clock
    input reset : Reset
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


  module PE_81 :
    input clock : Clock
    input reset : Reset
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


  module PE_82 :
    input clock : Clock
    input reset : Reset
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


  module PE_83 :
    input clock : Clock
    input reset : Reset
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


  module PE_84 :
    input clock : Clock
    input reset : Reset
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


  module PE_85 :
    input clock : Clock
    input reset : Reset
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


  module PE_86 :
    input clock : Clock
    input reset : Reset
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


  module PE_87 :
    input clock : Clock
    input reset : Reset
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


  module PE_88 :
    input clock : Clock
    input reset : Reset
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


  module PE_89 :
    input clock : Clock
    input reset : Reset
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


  module PE_90 :
    input clock : Clock
    input reset : Reset
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


  module PE_91 :
    input clock : Clock
    input reset : Reset
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


  module PE_92 :
    input clock : Clock
    input reset : Reset
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


  module PE_93 :
    input clock : Clock
    input reset : Reset
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


  module PE_94 :
    input clock : Clock
    input reset : Reset
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


  module PE_95 :
    input clock : Clock
    input reset : Reset
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


  module PE_96 :
    input clock : Clock
    input reset : Reset
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


  module PE_97 :
    input clock : Clock
    input reset : Reset
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


  module PE_98 :
    input clock : Clock
    input reset : Reset
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


  module PE_99 :
    input clock : Clock
    input reset : Reset
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


  module PE_100 :
    input clock : Clock
    input reset : Reset
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


  module PE_101 :
    input clock : Clock
    input reset : Reset
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


  module PE_102 :
    input clock : Clock
    input reset : Reset
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


  module PE_103 :
    input clock : Clock
    input reset : Reset
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


  module PE_104 :
    input clock : Clock
    input reset : Reset
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


  module PE_105 :
    input clock : Clock
    input reset : Reset
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


  module PE_106 :
    input clock : Clock
    input reset : Reset
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


  module PE_107 :
    input clock : Clock
    input reset : Reset
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


  module PE_108 :
    input clock : Clock
    input reset : Reset
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


  module PE_109 :
    input clock : Clock
    input reset : Reset
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


  module PE_110 :
    input clock : Clock
    input reset : Reset
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


  module PE_111 :
    input clock : Clock
    input reset : Reset
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


  module PE_112 :
    input clock : Clock
    input reset : Reset
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


  module PE_113 :
    input clock : Clock
    input reset : Reset
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


  module PE_114 :
    input clock : Clock
    input reset : Reset
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


  module PE_115 :
    input clock : Clock
    input reset : Reset
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


  module PE_116 :
    input clock : Clock
    input reset : Reset
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


  module PE_117 :
    input clock : Clock
    input reset : Reset
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


  module PE_118 :
    input clock : Clock
    input reset : Reset
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


  module PE_119 :
    input clock : Clock
    input reset : Reset
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


  module PE_120 :
    input clock : Clock
    input reset : Reset
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


  module PE_121 :
    input clock : Clock
    input reset : Reset
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


  module PE_122 :
    input clock : Clock
    input reset : Reset
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


  module PE_123 :
    input clock : Clock
    input reset : Reset
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


  module PE_124 :
    input clock : Clock
    input reset : Reset
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


  module PE_125 :
    input clock : Clock
    input reset : Reset
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


  module PE_126 :
    input clock : Clock
    input reset : Reset
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


  module PE_127 :
    input clock : Clock
    input reset : Reset
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


  module PE_128 :
    input clock : Clock
    input reset : Reset
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


  module PE_129 :
    input clock : Clock
    input reset : Reset
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


  module PE_130 :
    input clock : Clock
    input reset : Reset
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


  module PE_131 :
    input clock : Clock
    input reset : Reset
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


  module PE_132 :
    input clock : Clock
    input reset : Reset
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


  module PE_133 :
    input clock : Clock
    input reset : Reset
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


  module PE_134 :
    input clock : Clock
    input reset : Reset
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


  module PE_135 :
    input clock : Clock
    input reset : Reset
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


  module PE_136 :
    input clock : Clock
    input reset : Reset
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


  module PE_137 :
    input clock : Clock
    input reset : Reset
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


  module PE_138 :
    input clock : Clock
    input reset : Reset
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


  module PE_139 :
    input clock : Clock
    input reset : Reset
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


  module PE_140 :
    input clock : Clock
    input reset : Reset
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


  module PE_141 :
    input clock : Clock
    input reset : Reset
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


  module PE_142 :
    input clock : Clock
    input reset : Reset
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


  module PE_143 :
    input clock : Clock
    input reset : Reset
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


  module SystolicArray :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip gridWeightIn : SInt<8>[12], flip gridIfmIn : SInt<8>[12], gridParpOut : SInt<32>[12][12]}

    inst peArray_0_0 of PE @[SystolicArray.scala 14:40]
    peArray_0_0.clock <= clock
    peArray_0_0.reset <= reset
    inst peArray_0_1 of PE_1 @[SystolicArray.scala 14:40]
    peArray_0_1.clock <= clock
    peArray_0_1.reset <= reset
    inst peArray_0_2 of PE_2 @[SystolicArray.scala 14:40]
    peArray_0_2.clock <= clock
    peArray_0_2.reset <= reset
    inst peArray_0_3 of PE_3 @[SystolicArray.scala 14:40]
    peArray_0_3.clock <= clock
    peArray_0_3.reset <= reset
    inst peArray_0_4 of PE_4 @[SystolicArray.scala 14:40]
    peArray_0_4.clock <= clock
    peArray_0_4.reset <= reset
    inst peArray_0_5 of PE_5 @[SystolicArray.scala 14:40]
    peArray_0_5.clock <= clock
    peArray_0_5.reset <= reset
    inst peArray_0_6 of PE_6 @[SystolicArray.scala 14:40]
    peArray_0_6.clock <= clock
    peArray_0_6.reset <= reset
    inst peArray_0_7 of PE_7 @[SystolicArray.scala 14:40]
    peArray_0_7.clock <= clock
    peArray_0_7.reset <= reset
    inst peArray_0_8 of PE_8 @[SystolicArray.scala 14:40]
    peArray_0_8.clock <= clock
    peArray_0_8.reset <= reset
    inst peArray_0_9 of PE_9 @[SystolicArray.scala 14:40]
    peArray_0_9.clock <= clock
    peArray_0_9.reset <= reset
    inst peArray_0_10 of PE_10 @[SystolicArray.scala 14:40]
    peArray_0_10.clock <= clock
    peArray_0_10.reset <= reset
    inst peArray_0_11 of PE_11 @[SystolicArray.scala 14:40]
    peArray_0_11.clock <= clock
    peArray_0_11.reset <= reset
    inst peArray_1_0 of PE_12 @[SystolicArray.scala 14:40]
    peArray_1_0.clock <= clock
    peArray_1_0.reset <= reset
    inst peArray_1_1 of PE_13 @[SystolicArray.scala 14:40]
    peArray_1_1.clock <= clock
    peArray_1_1.reset <= reset
    inst peArray_1_2 of PE_14 @[SystolicArray.scala 14:40]
    peArray_1_2.clock <= clock
    peArray_1_2.reset <= reset
    inst peArray_1_3 of PE_15 @[SystolicArray.scala 14:40]
    peArray_1_3.clock <= clock
    peArray_1_3.reset <= reset
    inst peArray_1_4 of PE_16 @[SystolicArray.scala 14:40]
    peArray_1_4.clock <= clock
    peArray_1_4.reset <= reset
    inst peArray_1_5 of PE_17 @[SystolicArray.scala 14:40]
    peArray_1_5.clock <= clock
    peArray_1_5.reset <= reset
    inst peArray_1_6 of PE_18 @[SystolicArray.scala 14:40]
    peArray_1_6.clock <= clock
    peArray_1_6.reset <= reset
    inst peArray_1_7 of PE_19 @[SystolicArray.scala 14:40]
    peArray_1_7.clock <= clock
    peArray_1_7.reset <= reset
    inst peArray_1_8 of PE_20 @[SystolicArray.scala 14:40]
    peArray_1_8.clock <= clock
    peArray_1_8.reset <= reset
    inst peArray_1_9 of PE_21 @[SystolicArray.scala 14:40]
    peArray_1_9.clock <= clock
    peArray_1_9.reset <= reset
    inst peArray_1_10 of PE_22 @[SystolicArray.scala 14:40]
    peArray_1_10.clock <= clock
    peArray_1_10.reset <= reset
    inst peArray_1_11 of PE_23 @[SystolicArray.scala 14:40]
    peArray_1_11.clock <= clock
    peArray_1_11.reset <= reset
    inst peArray_2_0 of PE_24 @[SystolicArray.scala 14:40]
    peArray_2_0.clock <= clock
    peArray_2_0.reset <= reset
    inst peArray_2_1 of PE_25 @[SystolicArray.scala 14:40]
    peArray_2_1.clock <= clock
    peArray_2_1.reset <= reset
    inst peArray_2_2 of PE_26 @[SystolicArray.scala 14:40]
    peArray_2_2.clock <= clock
    peArray_2_2.reset <= reset
    inst peArray_2_3 of PE_27 @[SystolicArray.scala 14:40]
    peArray_2_3.clock <= clock
    peArray_2_3.reset <= reset
    inst peArray_2_4 of PE_28 @[SystolicArray.scala 14:40]
    peArray_2_4.clock <= clock
    peArray_2_4.reset <= reset
    inst peArray_2_5 of PE_29 @[SystolicArray.scala 14:40]
    peArray_2_5.clock <= clock
    peArray_2_5.reset <= reset
    inst peArray_2_6 of PE_30 @[SystolicArray.scala 14:40]
    peArray_2_6.clock <= clock
    peArray_2_6.reset <= reset
    inst peArray_2_7 of PE_31 @[SystolicArray.scala 14:40]
    peArray_2_7.clock <= clock
    peArray_2_7.reset <= reset
    inst peArray_2_8 of PE_32 @[SystolicArray.scala 14:40]
    peArray_2_8.clock <= clock
    peArray_2_8.reset <= reset
    inst peArray_2_9 of PE_33 @[SystolicArray.scala 14:40]
    peArray_2_9.clock <= clock
    peArray_2_9.reset <= reset
    inst peArray_2_10 of PE_34 @[SystolicArray.scala 14:40]
    peArray_2_10.clock <= clock
    peArray_2_10.reset <= reset
    inst peArray_2_11 of PE_35 @[SystolicArray.scala 14:40]
    peArray_2_11.clock <= clock
    peArray_2_11.reset <= reset
    inst peArray_3_0 of PE_36 @[SystolicArray.scala 14:40]
    peArray_3_0.clock <= clock
    peArray_3_0.reset <= reset
    inst peArray_3_1 of PE_37 @[SystolicArray.scala 14:40]
    peArray_3_1.clock <= clock
    peArray_3_1.reset <= reset
    inst peArray_3_2 of PE_38 @[SystolicArray.scala 14:40]
    peArray_3_2.clock <= clock
    peArray_3_2.reset <= reset
    inst peArray_3_3 of PE_39 @[SystolicArray.scala 14:40]
    peArray_3_3.clock <= clock
    peArray_3_3.reset <= reset
    inst peArray_3_4 of PE_40 @[SystolicArray.scala 14:40]
    peArray_3_4.clock <= clock
    peArray_3_4.reset <= reset
    inst peArray_3_5 of PE_41 @[SystolicArray.scala 14:40]
    peArray_3_5.clock <= clock
    peArray_3_5.reset <= reset
    inst peArray_3_6 of PE_42 @[SystolicArray.scala 14:40]
    peArray_3_6.clock <= clock
    peArray_3_6.reset <= reset
    inst peArray_3_7 of PE_43 @[SystolicArray.scala 14:40]
    peArray_3_7.clock <= clock
    peArray_3_7.reset <= reset
    inst peArray_3_8 of PE_44 @[SystolicArray.scala 14:40]
    peArray_3_8.clock <= clock
    peArray_3_8.reset <= reset
    inst peArray_3_9 of PE_45 @[SystolicArray.scala 14:40]
    peArray_3_9.clock <= clock
    peArray_3_9.reset <= reset
    inst peArray_3_10 of PE_46 @[SystolicArray.scala 14:40]
    peArray_3_10.clock <= clock
    peArray_3_10.reset <= reset
    inst peArray_3_11 of PE_47 @[SystolicArray.scala 14:40]
    peArray_3_11.clock <= clock
    peArray_3_11.reset <= reset
    inst peArray_4_0 of PE_48 @[SystolicArray.scala 14:40]
    peArray_4_0.clock <= clock
    peArray_4_0.reset <= reset
    inst peArray_4_1 of PE_49 @[SystolicArray.scala 14:40]
    peArray_4_1.clock <= clock
    peArray_4_1.reset <= reset
    inst peArray_4_2 of PE_50 @[SystolicArray.scala 14:40]
    peArray_4_2.clock <= clock
    peArray_4_2.reset <= reset
    inst peArray_4_3 of PE_51 @[SystolicArray.scala 14:40]
    peArray_4_3.clock <= clock
    peArray_4_3.reset <= reset
    inst peArray_4_4 of PE_52 @[SystolicArray.scala 14:40]
    peArray_4_4.clock <= clock
    peArray_4_4.reset <= reset
    inst peArray_4_5 of PE_53 @[SystolicArray.scala 14:40]
    peArray_4_5.clock <= clock
    peArray_4_5.reset <= reset
    inst peArray_4_6 of PE_54 @[SystolicArray.scala 14:40]
    peArray_4_6.clock <= clock
    peArray_4_6.reset <= reset
    inst peArray_4_7 of PE_55 @[SystolicArray.scala 14:40]
    peArray_4_7.clock <= clock
    peArray_4_7.reset <= reset
    inst peArray_4_8 of PE_56 @[SystolicArray.scala 14:40]
    peArray_4_8.clock <= clock
    peArray_4_8.reset <= reset
    inst peArray_4_9 of PE_57 @[SystolicArray.scala 14:40]
    peArray_4_9.clock <= clock
    peArray_4_9.reset <= reset
    inst peArray_4_10 of PE_58 @[SystolicArray.scala 14:40]
    peArray_4_10.clock <= clock
    peArray_4_10.reset <= reset
    inst peArray_4_11 of PE_59 @[SystolicArray.scala 14:40]
    peArray_4_11.clock <= clock
    peArray_4_11.reset <= reset
    inst peArray_5_0 of PE_60 @[SystolicArray.scala 14:40]
    peArray_5_0.clock <= clock
    peArray_5_0.reset <= reset
    inst peArray_5_1 of PE_61 @[SystolicArray.scala 14:40]
    peArray_5_1.clock <= clock
    peArray_5_1.reset <= reset
    inst peArray_5_2 of PE_62 @[SystolicArray.scala 14:40]
    peArray_5_2.clock <= clock
    peArray_5_2.reset <= reset
    inst peArray_5_3 of PE_63 @[SystolicArray.scala 14:40]
    peArray_5_3.clock <= clock
    peArray_5_3.reset <= reset
    inst peArray_5_4 of PE_64 @[SystolicArray.scala 14:40]
    peArray_5_4.clock <= clock
    peArray_5_4.reset <= reset
    inst peArray_5_5 of PE_65 @[SystolicArray.scala 14:40]
    peArray_5_5.clock <= clock
    peArray_5_5.reset <= reset
    inst peArray_5_6 of PE_66 @[SystolicArray.scala 14:40]
    peArray_5_6.clock <= clock
    peArray_5_6.reset <= reset
    inst peArray_5_7 of PE_67 @[SystolicArray.scala 14:40]
    peArray_5_7.clock <= clock
    peArray_5_7.reset <= reset
    inst peArray_5_8 of PE_68 @[SystolicArray.scala 14:40]
    peArray_5_8.clock <= clock
    peArray_5_8.reset <= reset
    inst peArray_5_9 of PE_69 @[SystolicArray.scala 14:40]
    peArray_5_9.clock <= clock
    peArray_5_9.reset <= reset
    inst peArray_5_10 of PE_70 @[SystolicArray.scala 14:40]
    peArray_5_10.clock <= clock
    peArray_5_10.reset <= reset
    inst peArray_5_11 of PE_71 @[SystolicArray.scala 14:40]
    peArray_5_11.clock <= clock
    peArray_5_11.reset <= reset
    inst peArray_6_0 of PE_72 @[SystolicArray.scala 14:40]
    peArray_6_0.clock <= clock
    peArray_6_0.reset <= reset
    inst peArray_6_1 of PE_73 @[SystolicArray.scala 14:40]
    peArray_6_1.clock <= clock
    peArray_6_1.reset <= reset
    inst peArray_6_2 of PE_74 @[SystolicArray.scala 14:40]
    peArray_6_2.clock <= clock
    peArray_6_2.reset <= reset
    inst peArray_6_3 of PE_75 @[SystolicArray.scala 14:40]
    peArray_6_3.clock <= clock
    peArray_6_3.reset <= reset
    inst peArray_6_4 of PE_76 @[SystolicArray.scala 14:40]
    peArray_6_4.clock <= clock
    peArray_6_4.reset <= reset
    inst peArray_6_5 of PE_77 @[SystolicArray.scala 14:40]
    peArray_6_5.clock <= clock
    peArray_6_5.reset <= reset
    inst peArray_6_6 of PE_78 @[SystolicArray.scala 14:40]
    peArray_6_6.clock <= clock
    peArray_6_6.reset <= reset
    inst peArray_6_7 of PE_79 @[SystolicArray.scala 14:40]
    peArray_6_7.clock <= clock
    peArray_6_7.reset <= reset
    inst peArray_6_8 of PE_80 @[SystolicArray.scala 14:40]
    peArray_6_8.clock <= clock
    peArray_6_8.reset <= reset
    inst peArray_6_9 of PE_81 @[SystolicArray.scala 14:40]
    peArray_6_9.clock <= clock
    peArray_6_9.reset <= reset
    inst peArray_6_10 of PE_82 @[SystolicArray.scala 14:40]
    peArray_6_10.clock <= clock
    peArray_6_10.reset <= reset
    inst peArray_6_11 of PE_83 @[SystolicArray.scala 14:40]
    peArray_6_11.clock <= clock
    peArray_6_11.reset <= reset
    inst peArray_7_0 of PE_84 @[SystolicArray.scala 14:40]
    peArray_7_0.clock <= clock
    peArray_7_0.reset <= reset
    inst peArray_7_1 of PE_85 @[SystolicArray.scala 14:40]
    peArray_7_1.clock <= clock
    peArray_7_1.reset <= reset
    inst peArray_7_2 of PE_86 @[SystolicArray.scala 14:40]
    peArray_7_2.clock <= clock
    peArray_7_2.reset <= reset
    inst peArray_7_3 of PE_87 @[SystolicArray.scala 14:40]
    peArray_7_3.clock <= clock
    peArray_7_3.reset <= reset
    inst peArray_7_4 of PE_88 @[SystolicArray.scala 14:40]
    peArray_7_4.clock <= clock
    peArray_7_4.reset <= reset
    inst peArray_7_5 of PE_89 @[SystolicArray.scala 14:40]
    peArray_7_5.clock <= clock
    peArray_7_5.reset <= reset
    inst peArray_7_6 of PE_90 @[SystolicArray.scala 14:40]
    peArray_7_6.clock <= clock
    peArray_7_6.reset <= reset
    inst peArray_7_7 of PE_91 @[SystolicArray.scala 14:40]
    peArray_7_7.clock <= clock
    peArray_7_7.reset <= reset
    inst peArray_7_8 of PE_92 @[SystolicArray.scala 14:40]
    peArray_7_8.clock <= clock
    peArray_7_8.reset <= reset
    inst peArray_7_9 of PE_93 @[SystolicArray.scala 14:40]
    peArray_7_9.clock <= clock
    peArray_7_9.reset <= reset
    inst peArray_7_10 of PE_94 @[SystolicArray.scala 14:40]
    peArray_7_10.clock <= clock
    peArray_7_10.reset <= reset
    inst peArray_7_11 of PE_95 @[SystolicArray.scala 14:40]
    peArray_7_11.clock <= clock
    peArray_7_11.reset <= reset
    inst peArray_8_0 of PE_96 @[SystolicArray.scala 14:40]
    peArray_8_0.clock <= clock
    peArray_8_0.reset <= reset
    inst peArray_8_1 of PE_97 @[SystolicArray.scala 14:40]
    peArray_8_1.clock <= clock
    peArray_8_1.reset <= reset
    inst peArray_8_2 of PE_98 @[SystolicArray.scala 14:40]
    peArray_8_2.clock <= clock
    peArray_8_2.reset <= reset
    inst peArray_8_3 of PE_99 @[SystolicArray.scala 14:40]
    peArray_8_3.clock <= clock
    peArray_8_3.reset <= reset
    inst peArray_8_4 of PE_100 @[SystolicArray.scala 14:40]
    peArray_8_4.clock <= clock
    peArray_8_4.reset <= reset
    inst peArray_8_5 of PE_101 @[SystolicArray.scala 14:40]
    peArray_8_5.clock <= clock
    peArray_8_5.reset <= reset
    inst peArray_8_6 of PE_102 @[SystolicArray.scala 14:40]
    peArray_8_6.clock <= clock
    peArray_8_6.reset <= reset
    inst peArray_8_7 of PE_103 @[SystolicArray.scala 14:40]
    peArray_8_7.clock <= clock
    peArray_8_7.reset <= reset
    inst peArray_8_8 of PE_104 @[SystolicArray.scala 14:40]
    peArray_8_8.clock <= clock
    peArray_8_8.reset <= reset
    inst peArray_8_9 of PE_105 @[SystolicArray.scala 14:40]
    peArray_8_9.clock <= clock
    peArray_8_9.reset <= reset
    inst peArray_8_10 of PE_106 @[SystolicArray.scala 14:40]
    peArray_8_10.clock <= clock
    peArray_8_10.reset <= reset
    inst peArray_8_11 of PE_107 @[SystolicArray.scala 14:40]
    peArray_8_11.clock <= clock
    peArray_8_11.reset <= reset
    inst peArray_9_0 of PE_108 @[SystolicArray.scala 14:40]
    peArray_9_0.clock <= clock
    peArray_9_0.reset <= reset
    inst peArray_9_1 of PE_109 @[SystolicArray.scala 14:40]
    peArray_9_1.clock <= clock
    peArray_9_1.reset <= reset
    inst peArray_9_2 of PE_110 @[SystolicArray.scala 14:40]
    peArray_9_2.clock <= clock
    peArray_9_2.reset <= reset
    inst peArray_9_3 of PE_111 @[SystolicArray.scala 14:40]
    peArray_9_3.clock <= clock
    peArray_9_3.reset <= reset
    inst peArray_9_4 of PE_112 @[SystolicArray.scala 14:40]
    peArray_9_4.clock <= clock
    peArray_9_4.reset <= reset
    inst peArray_9_5 of PE_113 @[SystolicArray.scala 14:40]
    peArray_9_5.clock <= clock
    peArray_9_5.reset <= reset
    inst peArray_9_6 of PE_114 @[SystolicArray.scala 14:40]
    peArray_9_6.clock <= clock
    peArray_9_6.reset <= reset
    inst peArray_9_7 of PE_115 @[SystolicArray.scala 14:40]
    peArray_9_7.clock <= clock
    peArray_9_7.reset <= reset
    inst peArray_9_8 of PE_116 @[SystolicArray.scala 14:40]
    peArray_9_8.clock <= clock
    peArray_9_8.reset <= reset
    inst peArray_9_9 of PE_117 @[SystolicArray.scala 14:40]
    peArray_9_9.clock <= clock
    peArray_9_9.reset <= reset
    inst peArray_9_10 of PE_118 @[SystolicArray.scala 14:40]
    peArray_9_10.clock <= clock
    peArray_9_10.reset <= reset
    inst peArray_9_11 of PE_119 @[SystolicArray.scala 14:40]
    peArray_9_11.clock <= clock
    peArray_9_11.reset <= reset
    inst peArray_10_0 of PE_120 @[SystolicArray.scala 14:40]
    peArray_10_0.clock <= clock
    peArray_10_0.reset <= reset
    inst peArray_10_1 of PE_121 @[SystolicArray.scala 14:40]
    peArray_10_1.clock <= clock
    peArray_10_1.reset <= reset
    inst peArray_10_2 of PE_122 @[SystolicArray.scala 14:40]
    peArray_10_2.clock <= clock
    peArray_10_2.reset <= reset
    inst peArray_10_3 of PE_123 @[SystolicArray.scala 14:40]
    peArray_10_3.clock <= clock
    peArray_10_3.reset <= reset
    inst peArray_10_4 of PE_124 @[SystolicArray.scala 14:40]
    peArray_10_4.clock <= clock
    peArray_10_4.reset <= reset
    inst peArray_10_5 of PE_125 @[SystolicArray.scala 14:40]
    peArray_10_5.clock <= clock
    peArray_10_5.reset <= reset
    inst peArray_10_6 of PE_126 @[SystolicArray.scala 14:40]
    peArray_10_6.clock <= clock
    peArray_10_6.reset <= reset
    inst peArray_10_7 of PE_127 @[SystolicArray.scala 14:40]
    peArray_10_7.clock <= clock
    peArray_10_7.reset <= reset
    inst peArray_10_8 of PE_128 @[SystolicArray.scala 14:40]
    peArray_10_8.clock <= clock
    peArray_10_8.reset <= reset
    inst peArray_10_9 of PE_129 @[SystolicArray.scala 14:40]
    peArray_10_9.clock <= clock
    peArray_10_9.reset <= reset
    inst peArray_10_10 of PE_130 @[SystolicArray.scala 14:40]
    peArray_10_10.clock <= clock
    peArray_10_10.reset <= reset
    inst peArray_10_11 of PE_131 @[SystolicArray.scala 14:40]
    peArray_10_11.clock <= clock
    peArray_10_11.reset <= reset
    inst peArray_11_0 of PE_132 @[SystolicArray.scala 14:40]
    peArray_11_0.clock <= clock
    peArray_11_0.reset <= reset
    inst peArray_11_1 of PE_133 @[SystolicArray.scala 14:40]
    peArray_11_1.clock <= clock
    peArray_11_1.reset <= reset
    inst peArray_11_2 of PE_134 @[SystolicArray.scala 14:40]
    peArray_11_2.clock <= clock
    peArray_11_2.reset <= reset
    inst peArray_11_3 of PE_135 @[SystolicArray.scala 14:40]
    peArray_11_3.clock <= clock
    peArray_11_3.reset <= reset
    inst peArray_11_4 of PE_136 @[SystolicArray.scala 14:40]
    peArray_11_4.clock <= clock
    peArray_11_4.reset <= reset
    inst peArray_11_5 of PE_137 @[SystolicArray.scala 14:40]
    peArray_11_5.clock <= clock
    peArray_11_5.reset <= reset
    inst peArray_11_6 of PE_138 @[SystolicArray.scala 14:40]
    peArray_11_6.clock <= clock
    peArray_11_6.reset <= reset
    inst peArray_11_7 of PE_139 @[SystolicArray.scala 14:40]
    peArray_11_7.clock <= clock
    peArray_11_7.reset <= reset
    inst peArray_11_8 of PE_140 @[SystolicArray.scala 14:40]
    peArray_11_8.clock <= clock
    peArray_11_8.reset <= reset
    inst peArray_11_9 of PE_141 @[SystolicArray.scala 14:40]
    peArray_11_9.clock <= clock
    peArray_11_9.reset <= reset
    inst peArray_11_10 of PE_142 @[SystolicArray.scala 14:40]
    peArray_11_10.clock <= clock
    peArray_11_10.reset <= reset
    inst peArray_11_11 of PE_143 @[SystolicArray.scala 14:40]
    peArray_11_11.clock <= clock
    peArray_11_11.reset <= reset
    peArray_0_0.io.ifmIn <= io.gridIfmIn[0] @[SystolicArray.scala 20:36]
    peArray_0_0.io.weightIn <= io.gridWeightIn[0] @[SystolicArray.scala 26:39]
    io.gridParpOut[0][0] <= peArray_0_0.io.parp @[SystolicArray.scala 32:32]
    peArray_0_1.io.ifmIn <= io.gridIfmIn[1] @[SystolicArray.scala 20:36]
    peArray_0_1.io.weightIn <= peArray_0_0.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[0][1] <= peArray_0_1.io.parp @[SystolicArray.scala 32:32]
    peArray_0_2.io.ifmIn <= io.gridIfmIn[2] @[SystolicArray.scala 20:36]
    peArray_0_2.io.weightIn <= peArray_0_1.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[0][2] <= peArray_0_2.io.parp @[SystolicArray.scala 32:32]
    peArray_0_3.io.ifmIn <= io.gridIfmIn[3] @[SystolicArray.scala 20:36]
    peArray_0_3.io.weightIn <= peArray_0_2.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[0][3] <= peArray_0_3.io.parp @[SystolicArray.scala 32:32]
    peArray_0_4.io.ifmIn <= io.gridIfmIn[4] @[SystolicArray.scala 20:36]
    peArray_0_4.io.weightIn <= peArray_0_3.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[0][4] <= peArray_0_4.io.parp @[SystolicArray.scala 32:32]
    peArray_0_5.io.ifmIn <= io.gridIfmIn[5] @[SystolicArray.scala 20:36]
    peArray_0_5.io.weightIn <= peArray_0_4.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[0][5] <= peArray_0_5.io.parp @[SystolicArray.scala 32:32]
    peArray_0_6.io.ifmIn <= io.gridIfmIn[6] @[SystolicArray.scala 20:36]
    peArray_0_6.io.weightIn <= peArray_0_5.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[0][6] <= peArray_0_6.io.parp @[SystolicArray.scala 32:32]
    peArray_0_7.io.ifmIn <= io.gridIfmIn[7] @[SystolicArray.scala 20:36]
    peArray_0_7.io.weightIn <= peArray_0_6.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[0][7] <= peArray_0_7.io.parp @[SystolicArray.scala 32:32]
    peArray_0_8.io.ifmIn <= io.gridIfmIn[8] @[SystolicArray.scala 20:36]
    peArray_0_8.io.weightIn <= peArray_0_7.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[0][8] <= peArray_0_8.io.parp @[SystolicArray.scala 32:32]
    peArray_0_9.io.ifmIn <= io.gridIfmIn[9] @[SystolicArray.scala 20:36]
    peArray_0_9.io.weightIn <= peArray_0_8.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[0][9] <= peArray_0_9.io.parp @[SystolicArray.scala 32:32]
    peArray_0_10.io.ifmIn <= io.gridIfmIn[10] @[SystolicArray.scala 20:36]
    peArray_0_10.io.weightIn <= peArray_0_9.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[0][10] <= peArray_0_10.io.parp @[SystolicArray.scala 32:32]
    peArray_0_11.io.ifmIn <= io.gridIfmIn[11] @[SystolicArray.scala 20:36]
    peArray_0_11.io.weightIn <= peArray_0_10.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[0][11] <= peArray_0_11.io.parp @[SystolicArray.scala 32:32]
    peArray_1_0.io.ifmIn <= peArray_0_0.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_1_0.io.weightIn <= io.gridWeightIn[1] @[SystolicArray.scala 26:39]
    io.gridParpOut[1][0] <= peArray_1_0.io.parp @[SystolicArray.scala 32:32]
    peArray_1_1.io.ifmIn <= peArray_0_1.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_1_1.io.weightIn <= peArray_1_0.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[1][1] <= peArray_1_1.io.parp @[SystolicArray.scala 32:32]
    peArray_1_2.io.ifmIn <= peArray_0_2.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_1_2.io.weightIn <= peArray_1_1.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[1][2] <= peArray_1_2.io.parp @[SystolicArray.scala 32:32]
    peArray_1_3.io.ifmIn <= peArray_0_3.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_1_3.io.weightIn <= peArray_1_2.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[1][3] <= peArray_1_3.io.parp @[SystolicArray.scala 32:32]
    peArray_1_4.io.ifmIn <= peArray_0_4.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_1_4.io.weightIn <= peArray_1_3.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[1][4] <= peArray_1_4.io.parp @[SystolicArray.scala 32:32]
    peArray_1_5.io.ifmIn <= peArray_0_5.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_1_5.io.weightIn <= peArray_1_4.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[1][5] <= peArray_1_5.io.parp @[SystolicArray.scala 32:32]
    peArray_1_6.io.ifmIn <= peArray_0_6.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_1_6.io.weightIn <= peArray_1_5.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[1][6] <= peArray_1_6.io.parp @[SystolicArray.scala 32:32]
    peArray_1_7.io.ifmIn <= peArray_0_7.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_1_7.io.weightIn <= peArray_1_6.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[1][7] <= peArray_1_7.io.parp @[SystolicArray.scala 32:32]
    peArray_1_8.io.ifmIn <= peArray_0_8.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_1_8.io.weightIn <= peArray_1_7.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[1][8] <= peArray_1_8.io.parp @[SystolicArray.scala 32:32]
    peArray_1_9.io.ifmIn <= peArray_0_9.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_1_9.io.weightIn <= peArray_1_8.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[1][9] <= peArray_1_9.io.parp @[SystolicArray.scala 32:32]
    peArray_1_10.io.ifmIn <= peArray_0_10.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_1_10.io.weightIn <= peArray_1_9.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[1][10] <= peArray_1_10.io.parp @[SystolicArray.scala 32:32]
    peArray_1_11.io.ifmIn <= peArray_0_11.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_1_11.io.weightIn <= peArray_1_10.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[1][11] <= peArray_1_11.io.parp @[SystolicArray.scala 32:32]
    peArray_2_0.io.ifmIn <= peArray_1_0.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_2_0.io.weightIn <= io.gridWeightIn[2] @[SystolicArray.scala 26:39]
    io.gridParpOut[2][0] <= peArray_2_0.io.parp @[SystolicArray.scala 32:32]
    peArray_2_1.io.ifmIn <= peArray_1_1.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_2_1.io.weightIn <= peArray_2_0.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[2][1] <= peArray_2_1.io.parp @[SystolicArray.scala 32:32]
    peArray_2_2.io.ifmIn <= peArray_1_2.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_2_2.io.weightIn <= peArray_2_1.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[2][2] <= peArray_2_2.io.parp @[SystolicArray.scala 32:32]
    peArray_2_3.io.ifmIn <= peArray_1_3.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_2_3.io.weightIn <= peArray_2_2.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[2][3] <= peArray_2_3.io.parp @[SystolicArray.scala 32:32]
    peArray_2_4.io.ifmIn <= peArray_1_4.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_2_4.io.weightIn <= peArray_2_3.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[2][4] <= peArray_2_4.io.parp @[SystolicArray.scala 32:32]
    peArray_2_5.io.ifmIn <= peArray_1_5.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_2_5.io.weightIn <= peArray_2_4.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[2][5] <= peArray_2_5.io.parp @[SystolicArray.scala 32:32]
    peArray_2_6.io.ifmIn <= peArray_1_6.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_2_6.io.weightIn <= peArray_2_5.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[2][6] <= peArray_2_6.io.parp @[SystolicArray.scala 32:32]
    peArray_2_7.io.ifmIn <= peArray_1_7.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_2_7.io.weightIn <= peArray_2_6.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[2][7] <= peArray_2_7.io.parp @[SystolicArray.scala 32:32]
    peArray_2_8.io.ifmIn <= peArray_1_8.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_2_8.io.weightIn <= peArray_2_7.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[2][8] <= peArray_2_8.io.parp @[SystolicArray.scala 32:32]
    peArray_2_9.io.ifmIn <= peArray_1_9.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_2_9.io.weightIn <= peArray_2_8.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[2][9] <= peArray_2_9.io.parp @[SystolicArray.scala 32:32]
    peArray_2_10.io.ifmIn <= peArray_1_10.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_2_10.io.weightIn <= peArray_2_9.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[2][10] <= peArray_2_10.io.parp @[SystolicArray.scala 32:32]
    peArray_2_11.io.ifmIn <= peArray_1_11.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_2_11.io.weightIn <= peArray_2_10.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[2][11] <= peArray_2_11.io.parp @[SystolicArray.scala 32:32]
    peArray_3_0.io.ifmIn <= peArray_2_0.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_3_0.io.weightIn <= io.gridWeightIn[3] @[SystolicArray.scala 26:39]
    io.gridParpOut[3][0] <= peArray_3_0.io.parp @[SystolicArray.scala 32:32]
    peArray_3_1.io.ifmIn <= peArray_2_1.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_3_1.io.weightIn <= peArray_3_0.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[3][1] <= peArray_3_1.io.parp @[SystolicArray.scala 32:32]
    peArray_3_2.io.ifmIn <= peArray_2_2.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_3_2.io.weightIn <= peArray_3_1.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[3][2] <= peArray_3_2.io.parp @[SystolicArray.scala 32:32]
    peArray_3_3.io.ifmIn <= peArray_2_3.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_3_3.io.weightIn <= peArray_3_2.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[3][3] <= peArray_3_3.io.parp @[SystolicArray.scala 32:32]
    peArray_3_4.io.ifmIn <= peArray_2_4.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_3_4.io.weightIn <= peArray_3_3.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[3][4] <= peArray_3_4.io.parp @[SystolicArray.scala 32:32]
    peArray_3_5.io.ifmIn <= peArray_2_5.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_3_5.io.weightIn <= peArray_3_4.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[3][5] <= peArray_3_5.io.parp @[SystolicArray.scala 32:32]
    peArray_3_6.io.ifmIn <= peArray_2_6.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_3_6.io.weightIn <= peArray_3_5.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[3][6] <= peArray_3_6.io.parp @[SystolicArray.scala 32:32]
    peArray_3_7.io.ifmIn <= peArray_2_7.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_3_7.io.weightIn <= peArray_3_6.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[3][7] <= peArray_3_7.io.parp @[SystolicArray.scala 32:32]
    peArray_3_8.io.ifmIn <= peArray_2_8.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_3_8.io.weightIn <= peArray_3_7.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[3][8] <= peArray_3_8.io.parp @[SystolicArray.scala 32:32]
    peArray_3_9.io.ifmIn <= peArray_2_9.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_3_9.io.weightIn <= peArray_3_8.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[3][9] <= peArray_3_9.io.parp @[SystolicArray.scala 32:32]
    peArray_3_10.io.ifmIn <= peArray_2_10.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_3_10.io.weightIn <= peArray_3_9.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[3][10] <= peArray_3_10.io.parp @[SystolicArray.scala 32:32]
    peArray_3_11.io.ifmIn <= peArray_2_11.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_3_11.io.weightIn <= peArray_3_10.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[3][11] <= peArray_3_11.io.parp @[SystolicArray.scala 32:32]
    peArray_4_0.io.ifmIn <= peArray_3_0.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_4_0.io.weightIn <= io.gridWeightIn[4] @[SystolicArray.scala 26:39]
    io.gridParpOut[4][0] <= peArray_4_0.io.parp @[SystolicArray.scala 32:32]
    peArray_4_1.io.ifmIn <= peArray_3_1.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_4_1.io.weightIn <= peArray_4_0.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[4][1] <= peArray_4_1.io.parp @[SystolicArray.scala 32:32]
    peArray_4_2.io.ifmIn <= peArray_3_2.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_4_2.io.weightIn <= peArray_4_1.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[4][2] <= peArray_4_2.io.parp @[SystolicArray.scala 32:32]
    peArray_4_3.io.ifmIn <= peArray_3_3.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_4_3.io.weightIn <= peArray_4_2.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[4][3] <= peArray_4_3.io.parp @[SystolicArray.scala 32:32]
    peArray_4_4.io.ifmIn <= peArray_3_4.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_4_4.io.weightIn <= peArray_4_3.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[4][4] <= peArray_4_4.io.parp @[SystolicArray.scala 32:32]
    peArray_4_5.io.ifmIn <= peArray_3_5.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_4_5.io.weightIn <= peArray_4_4.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[4][5] <= peArray_4_5.io.parp @[SystolicArray.scala 32:32]
    peArray_4_6.io.ifmIn <= peArray_3_6.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_4_6.io.weightIn <= peArray_4_5.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[4][6] <= peArray_4_6.io.parp @[SystolicArray.scala 32:32]
    peArray_4_7.io.ifmIn <= peArray_3_7.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_4_7.io.weightIn <= peArray_4_6.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[4][7] <= peArray_4_7.io.parp @[SystolicArray.scala 32:32]
    peArray_4_8.io.ifmIn <= peArray_3_8.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_4_8.io.weightIn <= peArray_4_7.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[4][8] <= peArray_4_8.io.parp @[SystolicArray.scala 32:32]
    peArray_4_9.io.ifmIn <= peArray_3_9.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_4_9.io.weightIn <= peArray_4_8.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[4][9] <= peArray_4_9.io.parp @[SystolicArray.scala 32:32]
    peArray_4_10.io.ifmIn <= peArray_3_10.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_4_10.io.weightIn <= peArray_4_9.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[4][10] <= peArray_4_10.io.parp @[SystolicArray.scala 32:32]
    peArray_4_11.io.ifmIn <= peArray_3_11.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_4_11.io.weightIn <= peArray_4_10.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[4][11] <= peArray_4_11.io.parp @[SystolicArray.scala 32:32]
    peArray_5_0.io.ifmIn <= peArray_4_0.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_5_0.io.weightIn <= io.gridWeightIn[5] @[SystolicArray.scala 26:39]
    io.gridParpOut[5][0] <= peArray_5_0.io.parp @[SystolicArray.scala 32:32]
    peArray_5_1.io.ifmIn <= peArray_4_1.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_5_1.io.weightIn <= peArray_5_0.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[5][1] <= peArray_5_1.io.parp @[SystolicArray.scala 32:32]
    peArray_5_2.io.ifmIn <= peArray_4_2.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_5_2.io.weightIn <= peArray_5_1.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[5][2] <= peArray_5_2.io.parp @[SystolicArray.scala 32:32]
    peArray_5_3.io.ifmIn <= peArray_4_3.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_5_3.io.weightIn <= peArray_5_2.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[5][3] <= peArray_5_3.io.parp @[SystolicArray.scala 32:32]
    peArray_5_4.io.ifmIn <= peArray_4_4.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_5_4.io.weightIn <= peArray_5_3.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[5][4] <= peArray_5_4.io.parp @[SystolicArray.scala 32:32]
    peArray_5_5.io.ifmIn <= peArray_4_5.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_5_5.io.weightIn <= peArray_5_4.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[5][5] <= peArray_5_5.io.parp @[SystolicArray.scala 32:32]
    peArray_5_6.io.ifmIn <= peArray_4_6.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_5_6.io.weightIn <= peArray_5_5.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[5][6] <= peArray_5_6.io.parp @[SystolicArray.scala 32:32]
    peArray_5_7.io.ifmIn <= peArray_4_7.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_5_7.io.weightIn <= peArray_5_6.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[5][7] <= peArray_5_7.io.parp @[SystolicArray.scala 32:32]
    peArray_5_8.io.ifmIn <= peArray_4_8.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_5_8.io.weightIn <= peArray_5_7.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[5][8] <= peArray_5_8.io.parp @[SystolicArray.scala 32:32]
    peArray_5_9.io.ifmIn <= peArray_4_9.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_5_9.io.weightIn <= peArray_5_8.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[5][9] <= peArray_5_9.io.parp @[SystolicArray.scala 32:32]
    peArray_5_10.io.ifmIn <= peArray_4_10.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_5_10.io.weightIn <= peArray_5_9.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[5][10] <= peArray_5_10.io.parp @[SystolicArray.scala 32:32]
    peArray_5_11.io.ifmIn <= peArray_4_11.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_5_11.io.weightIn <= peArray_5_10.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[5][11] <= peArray_5_11.io.parp @[SystolicArray.scala 32:32]
    peArray_6_0.io.ifmIn <= peArray_5_0.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_6_0.io.weightIn <= io.gridWeightIn[6] @[SystolicArray.scala 26:39]
    io.gridParpOut[6][0] <= peArray_6_0.io.parp @[SystolicArray.scala 32:32]
    peArray_6_1.io.ifmIn <= peArray_5_1.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_6_1.io.weightIn <= peArray_6_0.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[6][1] <= peArray_6_1.io.parp @[SystolicArray.scala 32:32]
    peArray_6_2.io.ifmIn <= peArray_5_2.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_6_2.io.weightIn <= peArray_6_1.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[6][2] <= peArray_6_2.io.parp @[SystolicArray.scala 32:32]
    peArray_6_3.io.ifmIn <= peArray_5_3.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_6_3.io.weightIn <= peArray_6_2.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[6][3] <= peArray_6_3.io.parp @[SystolicArray.scala 32:32]
    peArray_6_4.io.ifmIn <= peArray_5_4.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_6_4.io.weightIn <= peArray_6_3.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[6][4] <= peArray_6_4.io.parp @[SystolicArray.scala 32:32]
    peArray_6_5.io.ifmIn <= peArray_5_5.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_6_5.io.weightIn <= peArray_6_4.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[6][5] <= peArray_6_5.io.parp @[SystolicArray.scala 32:32]
    peArray_6_6.io.ifmIn <= peArray_5_6.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_6_6.io.weightIn <= peArray_6_5.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[6][6] <= peArray_6_6.io.parp @[SystolicArray.scala 32:32]
    peArray_6_7.io.ifmIn <= peArray_5_7.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_6_7.io.weightIn <= peArray_6_6.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[6][7] <= peArray_6_7.io.parp @[SystolicArray.scala 32:32]
    peArray_6_8.io.ifmIn <= peArray_5_8.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_6_8.io.weightIn <= peArray_6_7.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[6][8] <= peArray_6_8.io.parp @[SystolicArray.scala 32:32]
    peArray_6_9.io.ifmIn <= peArray_5_9.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_6_9.io.weightIn <= peArray_6_8.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[6][9] <= peArray_6_9.io.parp @[SystolicArray.scala 32:32]
    peArray_6_10.io.ifmIn <= peArray_5_10.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_6_10.io.weightIn <= peArray_6_9.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[6][10] <= peArray_6_10.io.parp @[SystolicArray.scala 32:32]
    peArray_6_11.io.ifmIn <= peArray_5_11.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_6_11.io.weightIn <= peArray_6_10.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[6][11] <= peArray_6_11.io.parp @[SystolicArray.scala 32:32]
    peArray_7_0.io.ifmIn <= peArray_6_0.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_7_0.io.weightIn <= io.gridWeightIn[7] @[SystolicArray.scala 26:39]
    io.gridParpOut[7][0] <= peArray_7_0.io.parp @[SystolicArray.scala 32:32]
    peArray_7_1.io.ifmIn <= peArray_6_1.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_7_1.io.weightIn <= peArray_7_0.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[7][1] <= peArray_7_1.io.parp @[SystolicArray.scala 32:32]
    peArray_7_2.io.ifmIn <= peArray_6_2.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_7_2.io.weightIn <= peArray_7_1.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[7][2] <= peArray_7_2.io.parp @[SystolicArray.scala 32:32]
    peArray_7_3.io.ifmIn <= peArray_6_3.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_7_3.io.weightIn <= peArray_7_2.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[7][3] <= peArray_7_3.io.parp @[SystolicArray.scala 32:32]
    peArray_7_4.io.ifmIn <= peArray_6_4.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_7_4.io.weightIn <= peArray_7_3.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[7][4] <= peArray_7_4.io.parp @[SystolicArray.scala 32:32]
    peArray_7_5.io.ifmIn <= peArray_6_5.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_7_5.io.weightIn <= peArray_7_4.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[7][5] <= peArray_7_5.io.parp @[SystolicArray.scala 32:32]
    peArray_7_6.io.ifmIn <= peArray_6_6.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_7_6.io.weightIn <= peArray_7_5.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[7][6] <= peArray_7_6.io.parp @[SystolicArray.scala 32:32]
    peArray_7_7.io.ifmIn <= peArray_6_7.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_7_7.io.weightIn <= peArray_7_6.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[7][7] <= peArray_7_7.io.parp @[SystolicArray.scala 32:32]
    peArray_7_8.io.ifmIn <= peArray_6_8.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_7_8.io.weightIn <= peArray_7_7.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[7][8] <= peArray_7_8.io.parp @[SystolicArray.scala 32:32]
    peArray_7_9.io.ifmIn <= peArray_6_9.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_7_9.io.weightIn <= peArray_7_8.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[7][9] <= peArray_7_9.io.parp @[SystolicArray.scala 32:32]
    peArray_7_10.io.ifmIn <= peArray_6_10.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_7_10.io.weightIn <= peArray_7_9.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[7][10] <= peArray_7_10.io.parp @[SystolicArray.scala 32:32]
    peArray_7_11.io.ifmIn <= peArray_6_11.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_7_11.io.weightIn <= peArray_7_10.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[7][11] <= peArray_7_11.io.parp @[SystolicArray.scala 32:32]
    peArray_8_0.io.ifmIn <= peArray_7_0.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_8_0.io.weightIn <= io.gridWeightIn[8] @[SystolicArray.scala 26:39]
    io.gridParpOut[8][0] <= peArray_8_0.io.parp @[SystolicArray.scala 32:32]
    peArray_8_1.io.ifmIn <= peArray_7_1.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_8_1.io.weightIn <= peArray_8_0.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[8][1] <= peArray_8_1.io.parp @[SystolicArray.scala 32:32]
    peArray_8_2.io.ifmIn <= peArray_7_2.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_8_2.io.weightIn <= peArray_8_1.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[8][2] <= peArray_8_2.io.parp @[SystolicArray.scala 32:32]
    peArray_8_3.io.ifmIn <= peArray_7_3.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_8_3.io.weightIn <= peArray_8_2.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[8][3] <= peArray_8_3.io.parp @[SystolicArray.scala 32:32]
    peArray_8_4.io.ifmIn <= peArray_7_4.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_8_4.io.weightIn <= peArray_8_3.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[8][4] <= peArray_8_4.io.parp @[SystolicArray.scala 32:32]
    peArray_8_5.io.ifmIn <= peArray_7_5.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_8_5.io.weightIn <= peArray_8_4.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[8][5] <= peArray_8_5.io.parp @[SystolicArray.scala 32:32]
    peArray_8_6.io.ifmIn <= peArray_7_6.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_8_6.io.weightIn <= peArray_8_5.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[8][6] <= peArray_8_6.io.parp @[SystolicArray.scala 32:32]
    peArray_8_7.io.ifmIn <= peArray_7_7.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_8_7.io.weightIn <= peArray_8_6.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[8][7] <= peArray_8_7.io.parp @[SystolicArray.scala 32:32]
    peArray_8_8.io.ifmIn <= peArray_7_8.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_8_8.io.weightIn <= peArray_8_7.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[8][8] <= peArray_8_8.io.parp @[SystolicArray.scala 32:32]
    peArray_8_9.io.ifmIn <= peArray_7_9.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_8_9.io.weightIn <= peArray_8_8.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[8][9] <= peArray_8_9.io.parp @[SystolicArray.scala 32:32]
    peArray_8_10.io.ifmIn <= peArray_7_10.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_8_10.io.weightIn <= peArray_8_9.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[8][10] <= peArray_8_10.io.parp @[SystolicArray.scala 32:32]
    peArray_8_11.io.ifmIn <= peArray_7_11.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_8_11.io.weightIn <= peArray_8_10.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[8][11] <= peArray_8_11.io.parp @[SystolicArray.scala 32:32]
    peArray_9_0.io.ifmIn <= peArray_8_0.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_9_0.io.weightIn <= io.gridWeightIn[9] @[SystolicArray.scala 26:39]
    io.gridParpOut[9][0] <= peArray_9_0.io.parp @[SystolicArray.scala 32:32]
    peArray_9_1.io.ifmIn <= peArray_8_1.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_9_1.io.weightIn <= peArray_9_0.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[9][1] <= peArray_9_1.io.parp @[SystolicArray.scala 32:32]
    peArray_9_2.io.ifmIn <= peArray_8_2.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_9_2.io.weightIn <= peArray_9_1.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[9][2] <= peArray_9_2.io.parp @[SystolicArray.scala 32:32]
    peArray_9_3.io.ifmIn <= peArray_8_3.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_9_3.io.weightIn <= peArray_9_2.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[9][3] <= peArray_9_3.io.parp @[SystolicArray.scala 32:32]
    peArray_9_4.io.ifmIn <= peArray_8_4.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_9_4.io.weightIn <= peArray_9_3.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[9][4] <= peArray_9_4.io.parp @[SystolicArray.scala 32:32]
    peArray_9_5.io.ifmIn <= peArray_8_5.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_9_5.io.weightIn <= peArray_9_4.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[9][5] <= peArray_9_5.io.parp @[SystolicArray.scala 32:32]
    peArray_9_6.io.ifmIn <= peArray_8_6.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_9_6.io.weightIn <= peArray_9_5.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[9][6] <= peArray_9_6.io.parp @[SystolicArray.scala 32:32]
    peArray_9_7.io.ifmIn <= peArray_8_7.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_9_7.io.weightIn <= peArray_9_6.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[9][7] <= peArray_9_7.io.parp @[SystolicArray.scala 32:32]
    peArray_9_8.io.ifmIn <= peArray_8_8.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_9_8.io.weightIn <= peArray_9_7.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[9][8] <= peArray_9_8.io.parp @[SystolicArray.scala 32:32]
    peArray_9_9.io.ifmIn <= peArray_8_9.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_9_9.io.weightIn <= peArray_9_8.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[9][9] <= peArray_9_9.io.parp @[SystolicArray.scala 32:32]
    peArray_9_10.io.ifmIn <= peArray_8_10.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_9_10.io.weightIn <= peArray_9_9.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[9][10] <= peArray_9_10.io.parp @[SystolicArray.scala 32:32]
    peArray_9_11.io.ifmIn <= peArray_8_11.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_9_11.io.weightIn <= peArray_9_10.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[9][11] <= peArray_9_11.io.parp @[SystolicArray.scala 32:32]
    peArray_10_0.io.ifmIn <= peArray_9_0.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_10_0.io.weightIn <= io.gridWeightIn[10] @[SystolicArray.scala 26:39]
    io.gridParpOut[10][0] <= peArray_10_0.io.parp @[SystolicArray.scala 32:32]
    peArray_10_1.io.ifmIn <= peArray_9_1.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_10_1.io.weightIn <= peArray_10_0.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[10][1] <= peArray_10_1.io.parp @[SystolicArray.scala 32:32]
    peArray_10_2.io.ifmIn <= peArray_9_2.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_10_2.io.weightIn <= peArray_10_1.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[10][2] <= peArray_10_2.io.parp @[SystolicArray.scala 32:32]
    peArray_10_3.io.ifmIn <= peArray_9_3.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_10_3.io.weightIn <= peArray_10_2.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[10][3] <= peArray_10_3.io.parp @[SystolicArray.scala 32:32]
    peArray_10_4.io.ifmIn <= peArray_9_4.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_10_4.io.weightIn <= peArray_10_3.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[10][4] <= peArray_10_4.io.parp @[SystolicArray.scala 32:32]
    peArray_10_5.io.ifmIn <= peArray_9_5.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_10_5.io.weightIn <= peArray_10_4.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[10][5] <= peArray_10_5.io.parp @[SystolicArray.scala 32:32]
    peArray_10_6.io.ifmIn <= peArray_9_6.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_10_6.io.weightIn <= peArray_10_5.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[10][6] <= peArray_10_6.io.parp @[SystolicArray.scala 32:32]
    peArray_10_7.io.ifmIn <= peArray_9_7.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_10_7.io.weightIn <= peArray_10_6.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[10][7] <= peArray_10_7.io.parp @[SystolicArray.scala 32:32]
    peArray_10_8.io.ifmIn <= peArray_9_8.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_10_8.io.weightIn <= peArray_10_7.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[10][8] <= peArray_10_8.io.parp @[SystolicArray.scala 32:32]
    peArray_10_9.io.ifmIn <= peArray_9_9.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_10_9.io.weightIn <= peArray_10_8.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[10][9] <= peArray_10_9.io.parp @[SystolicArray.scala 32:32]
    peArray_10_10.io.ifmIn <= peArray_9_10.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_10_10.io.weightIn <= peArray_10_9.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[10][10] <= peArray_10_10.io.parp @[SystolicArray.scala 32:32]
    peArray_10_11.io.ifmIn <= peArray_9_11.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_10_11.io.weightIn <= peArray_10_10.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[10][11] <= peArray_10_11.io.parp @[SystolicArray.scala 32:32]
    peArray_11_0.io.ifmIn <= peArray_10_0.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_11_0.io.weightIn <= io.gridWeightIn[11] @[SystolicArray.scala 26:39]
    io.gridParpOut[11][0] <= peArray_11_0.io.parp @[SystolicArray.scala 32:32]
    peArray_11_1.io.ifmIn <= peArray_10_1.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_11_1.io.weightIn <= peArray_11_0.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[11][1] <= peArray_11_1.io.parp @[SystolicArray.scala 32:32]
    peArray_11_2.io.ifmIn <= peArray_10_2.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_11_2.io.weightIn <= peArray_11_1.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[11][2] <= peArray_11_2.io.parp @[SystolicArray.scala 32:32]
    peArray_11_3.io.ifmIn <= peArray_10_3.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_11_3.io.weightIn <= peArray_11_2.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[11][3] <= peArray_11_3.io.parp @[SystolicArray.scala 32:32]
    peArray_11_4.io.ifmIn <= peArray_10_4.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_11_4.io.weightIn <= peArray_11_3.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[11][4] <= peArray_11_4.io.parp @[SystolicArray.scala 32:32]
    peArray_11_5.io.ifmIn <= peArray_10_5.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_11_5.io.weightIn <= peArray_11_4.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[11][5] <= peArray_11_5.io.parp @[SystolicArray.scala 32:32]
    peArray_11_6.io.ifmIn <= peArray_10_6.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_11_6.io.weightIn <= peArray_11_5.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[11][6] <= peArray_11_6.io.parp @[SystolicArray.scala 32:32]
    peArray_11_7.io.ifmIn <= peArray_10_7.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_11_7.io.weightIn <= peArray_11_6.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[11][7] <= peArray_11_7.io.parp @[SystolicArray.scala 32:32]
    peArray_11_8.io.ifmIn <= peArray_10_8.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_11_8.io.weightIn <= peArray_11_7.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[11][8] <= peArray_11_8.io.parp @[SystolicArray.scala 32:32]
    peArray_11_9.io.ifmIn <= peArray_10_9.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_11_9.io.weightIn <= peArray_11_8.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[11][9] <= peArray_11_9.io.parp @[SystolicArray.scala 32:32]
    peArray_11_10.io.ifmIn <= peArray_10_10.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_11_10.io.weightIn <= peArray_11_9.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[11][10] <= peArray_11_10.io.parp @[SystolicArray.scala 32:32]
    peArray_11_11.io.ifmIn <= peArray_10_11.io.ifmOut @[SystolicArray.scala 22:36]
    peArray_11_11.io.weightIn <= peArray_11_10.io.weightOut @[SystolicArray.scala 28:39]
    io.gridParpOut[11][11] <= peArray_11_11.io.parp @[SystolicArray.scala 32:32]

