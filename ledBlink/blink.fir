circuit blink :
  module blink :
    input clock : Clock
    input reset : UInt<1>
    output io : { led : UInt<1>}

    reg cntReg : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[blink.scala 9:31]
    reg blkReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[blink.scala 10:31]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[blink.scala 12:20]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[blink.scala 12:20]
    cntReg <= _cntReg_T_1 @[blink.scala 12:10]
    node _T = eq(cntReg, UInt<26>("h2faf07f")) @[blink.scala 13:15]
    when _T : @[blink.scala 13:28]
      cntReg <= UInt<1>("h0") @[blink.scala 14:12]
      node _blkReg_T = not(blkReg) @[blink.scala 15:15]
      blkReg <= _blkReg_T @[blink.scala 15:12]
    io.led <= blkReg @[blink.scala 17:10]

