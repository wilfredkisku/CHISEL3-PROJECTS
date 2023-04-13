circuit counter_top :
  module counter_top :
    input clock : Clock
    input reset : UInt<1>
    output io : { count : UInt<8>}

    reg cntReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[counter_top.scala 11:23]
    reg blkReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[counter_top.scala 12:23]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[counter_top.scala 14:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[counter_top.scala 14:20]
    cntReg <= _cntReg_T_1 @[counter_top.scala 14:10]
    node _T = eq(cntReg, UInt<25>("h17d783f")) @[counter_top.scala 15:15]
    when _T : @[counter_top.scala 15:27]
      cntReg <= UInt<1>("h0") @[counter_top.scala 16:12]
      node _T_1 = eq(blkReg, UInt<4>("h8")) @[counter_top.scala 17:18]
      when _T_1 : @[counter_top.scala 18:7]
        blkReg <= UInt<1>("h0") @[counter_top.scala 19:16]
      else :
        node _blkReg_T = add(blkReg, UInt<1>("h1")) @[counter_top.scala 23:26]
        node _blkReg_T_1 = tail(_blkReg_T, 1) @[counter_top.scala 23:26]
        blkReg <= _blkReg_T_1 @[counter_top.scala 23:16]
    io.count <= blkReg @[counter_top.scala 26:12]

