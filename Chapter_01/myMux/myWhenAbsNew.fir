circuit myWhenAbsNew :
  module myWhenAbsNew :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip x : SInt<8>, absX : SInt<8>}

    node _io_absX_T = gt(io.x, asSInt(UInt<1>("h0"))) @[myWhenAbsNew.scala 9:23]
    node _io_absX_T_1 = sub(asSInt(UInt<1>("h0")), io.x) @[myWhenAbsNew.scala 9:36]
    node _io_absX_T_2 = tail(_io_absX_T_1, 1) @[myWhenAbsNew.scala 9:36]
    node _io_absX_T_3 = asSInt(_io_absX_T_2) @[myWhenAbsNew.scala 9:36]
    node _io_absX_T_4 = mux(_io_absX_T, io.x, _io_absX_T_3) @[myWhenAbsNew.scala 9:17]
    io.absX <= _io_absX_T_4 @[myWhenAbsNew.scala 9:11]

