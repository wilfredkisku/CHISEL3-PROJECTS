circuit myWhenAbs :
  module myWhenAbs :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip x : SInt<8>, absX : SInt<8>}

    io.absX <= io.x @[myWhenAbs.scala 9:11]
    node _T = lt(io.x, asSInt(UInt<1>("h0"))) @[myWhenAbs.scala 10:14]
    when _T : @[myWhenAbs.scala 10:21]
      node _io_absX_T = sub(asSInt(UInt<1>("h0")), io.x) @[myWhenAbs.scala 11:16]
      node _io_absX_T_1 = tail(_io_absX_T, 1) @[myWhenAbs.scala 11:16]
      node _io_absX_T_2 = asSInt(_io_absX_T_1) @[myWhenAbs.scala 11:16]
      io.absX <= _io_absX_T_2 @[myWhenAbs.scala 11:13]


