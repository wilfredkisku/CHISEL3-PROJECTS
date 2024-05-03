circuit FP16AdderExtended :
  module FP16AdderExtended :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<16>, flip b : UInt<16>, result : UInt<16>}

    node signA = bits(io.a, 15, 15) @[FloatingPointAdd.scala 13:18]
    node expA = bits(io.a, 14, 10) @[FloatingPointAdd.scala 14:22]
    node sigA = bits(io.a, 9, 0) @[FloatingPointAdd.scala 15:25]
    node signB = bits(io.b, 15, 15) @[FloatingPointAdd.scala 13:18]
    node expB = bits(io.b, 14, 10) @[FloatingPointAdd.scala 14:22]
    node sigB = bits(io.b, 9, 0) @[FloatingPointAdd.scala 15:25]
    node _zeroFlagA_T = eq(expA, UInt<1>("h0")) @[FloatingPointAdd.scala 23:24]
    node _zeroFlagA_T_1 = eq(sigA, UInt<1>("h0")) @[FloatingPointAdd.scala 23:40]
    node zeroFlagA = and(_zeroFlagA_T, _zeroFlagA_T_1) @[FloatingPointAdd.scala 23:32]
    node _zeroFlagB_T = eq(expB, UInt<1>("h0")) @[FloatingPointAdd.scala 24:24]
    node _zeroFlagB_T_1 = eq(sigB, UInt<1>("h0")) @[FloatingPointAdd.scala 24:40]
    node zeroFlagB = and(_zeroFlagB_T, _zeroFlagB_T_1) @[FloatingPointAdd.scala 24:32]
    node _infFlagA_T = eq(expA, UInt<5>("h1f")) @[FloatingPointAdd.scala 25:23]
    node _infFlagA_T_1 = eq(sigA, UInt<1>("h0")) @[FloatingPointAdd.scala 25:46]
    node infFlagA = and(_infFlagA_T, _infFlagA_T_1) @[FloatingPointAdd.scala 25:38]
    node _infFlagB_T = eq(expB, UInt<5>("h1f")) @[FloatingPointAdd.scala 26:23]
    node _infFlagB_T_1 = eq(sigB, UInt<1>("h0")) @[FloatingPointAdd.scala 26:46]
    node infFlagB = and(_infFlagB_T, _infFlagB_T_1) @[FloatingPointAdd.scala 26:38]
    node _T = eq(zeroFlagB, UInt<1>("h0")) @[FloatingPointAdd.scala 29:21]
    node _T_1 = and(zeroFlagA, _T) @[FloatingPointAdd.scala 29:18]
    when _T_1 : @[FloatingPointAdd.scala 29:33]
      io.result <= io.b @[FloatingPointAdd.scala 31:15]
    else :
      node _T_2 = eq(zeroFlagA, UInt<1>("h0")) @[FloatingPointAdd.scala 32:14]
      node _T_3 = and(_T_2, zeroFlagB) @[FloatingPointAdd.scala 32:25]
      when _T_3 : @[FloatingPointAdd.scala 32:39]
        io.result <= io.a @[FloatingPointAdd.scala 34:15]
      else :
        node _T_4 = and(zeroFlagA, zeroFlagB) @[FloatingPointAdd.scala 35:24]
        when _T_4 : @[FloatingPointAdd.scala 35:38]
          io.result <= io.a @[FloatingPointAdd.scala 37:15]
        else :
          node _T_5 = or(infFlagA, infFlagB) @[FloatingPointAdd.scala 38:23]
          when _T_5 : @[FloatingPointAdd.scala 38:36]
            node _T_6 = and(infFlagA, infFlagB) @[FloatingPointAdd.scala 40:19]
            node _T_7 = neq(signA, signB) @[FloatingPointAdd.scala 40:41]
            node _T_8 = and(_T_6, _T_7) @[FloatingPointAdd.scala 40:31]
            when _T_8 : @[FloatingPointAdd.scala 40:53]
              io.result <= UInt<16>("hffff") @[FloatingPointAdd.scala 42:17]
            else :
              node _io_result_T = mux(infFlagA, io.a, io.b) @[FloatingPointAdd.scala 46:23]
              io.result <= _io_result_T @[FloatingPointAdd.scala 46:17]
          else :
            io.result <= UInt<1>("h0") @[FloatingPointAdd.scala 54:15]


