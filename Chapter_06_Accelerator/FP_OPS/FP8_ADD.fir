circuit FP8_ADD :
  module FP8_ADD :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip inputA : UInt<8>, flip inputB : UInt<8>, output : UInt<8>}

    node signA = bits(io.inputA, 7, 7) @[FP8_ADD.scala 12:18]
    node expA = bits(io.inputA, 6, 2) @[FP8_ADD.scala 13:22]
    node sigA = bits(io.inputA, 1, 0) @[FP8_ADD.scala 14:25]
    node signB = bits(io.inputB, 7, 7) @[FP8_ADD.scala 12:18]
    node expB = bits(io.inputB, 6, 2) @[FP8_ADD.scala 13:22]
    node sigB = bits(io.inputB, 1, 0) @[FP8_ADD.scala 14:25]
    node _infFlagA_T = eq(expA, UInt<5>("h1f")) @[FP8_ADD.scala 23:23]
    node _infFlagA_T_1 = eq(sigA, UInt<1>("h0")) @[FP8_ADD.scala 23:46]
    node infFlagA = and(_infFlagA_T, _infFlagA_T_1) @[FP8_ADD.scala 23:38]
    node _infFlagB_T = eq(expB, UInt<5>("h1f")) @[FP8_ADD.scala 24:23]
    node _infFlagB_T_1 = eq(sigB, UInt<1>("h0")) @[FP8_ADD.scala 24:46]
    node infFlagB = and(_infFlagB_T, _infFlagB_T_1) @[FP8_ADD.scala 24:38]
    node _zeroFlagA_T = eq(expA, UInt<1>("h0")) @[FP8_ADD.scala 27:24]
    node _zeroFlagA_T_1 = eq(sigA, UInt<1>("h0")) @[FP8_ADD.scala 27:47]
    node zeroFlagA = and(_zeroFlagA_T, _zeroFlagA_T_1) @[FP8_ADD.scala 27:39]
    node _zeroFlagB_T = eq(expB, UInt<1>("h0")) @[FP8_ADD.scala 28:24]
    node _zeroFlagB_T_1 = eq(sigB, UInt<1>("h0")) @[FP8_ADD.scala 28:47]
    node zeroFlagB = and(_zeroFlagB_T, _zeroFlagB_T_1) @[FP8_ADD.scala 28:39]
    node _nanFlagA_T = eq(expA, UInt<5>("h1f")) @[FP8_ADD.scala 31:23]
    node _nanFlagA_T_1 = neq(sigA, UInt<1>("h0")) @[FP8_ADD.scala 31:46]
    node nanFlagA = and(_nanFlagA_T, _nanFlagA_T_1) @[FP8_ADD.scala 31:38]
    node _nanFlagB_T = eq(expB, UInt<5>("h1f")) @[FP8_ADD.scala 32:23]
    node _nanFlagB_T_1 = neq(sigB, UInt<1>("h0")) @[FP8_ADD.scala 32:46]
    node nanFlagB = and(_nanFlagB_T, _nanFlagB_T_1) @[FP8_ADD.scala 32:38]
    node _subFlagA_T = eq(expA, UInt<1>("h0")) @[FP8_ADD.scala 35:23]
    node _subFlagA_T_1 = neq(sigA, UInt<1>("h0")) @[FP8_ADD.scala 35:46]
    node subFlagA = and(_subFlagA_T, _subFlagA_T_1) @[FP8_ADD.scala 35:38]
    node _subFlagB_T = eq(expB, UInt<1>("h0")) @[FP8_ADD.scala 36:23]
    node _subFlagB_T_1 = neq(sigB, UInt<1>("h0")) @[FP8_ADD.scala 36:46]
    node subFlagB = and(_subFlagB_T, _subFlagB_T_1) @[FP8_ADD.scala 36:38]
    node _T = and(zeroFlagA, zeroFlagB) @[FP8_ADD.scala 38:19]
    when _T : @[FP8_ADD.scala 38:32]
      io.output <= UInt<1>("h0") @[FP8_ADD.scala 40:15]
    else :
      node _T_1 = or(infFlagA, infFlagB) @[FP8_ADD.scala 41:23]
      when _T_1 : @[FP8_ADD.scala 41:35]
        node _T_2 = and(infFlagA, infFlagB) @[FP8_ADD.scala 43:20]
        node _T_3 = neq(signA, signB) @[FP8_ADD.scala 43:42]
        node _T_4 = and(_T_2, _T_3) @[FP8_ADD.scala 43:32]
        when _T_4 : @[FP8_ADD.scala 43:53]
          io.output <= UInt<7>("h7f") @[FP8_ADD.scala 44:17]
        else :
          node _io_output_T = mux(infFlagA, io.inputA, io.inputB) @[FP8_ADD.scala 46:23]
          io.output <= _io_output_T @[FP8_ADD.scala 46:17]
      else :
        node _T_5 = or(nanFlagA, nanFlagB) @[FP8_ADD.scala 48:23]
        when _T_5 : @[FP8_ADD.scala 48:35]
          io.output <= UInt<7>("h7f") @[FP8_ADD.scala 49:15]
        else :
          node _T_6 = and(subFlagA, subFlagB) @[FP8_ADD.scala 52:19]
          when _T_6 : @[FP8_ADD.scala 52:31]
            io.output <= UInt<1>("h0") @[FP8_ADD.scala 54:17]
          else :
            node _T_7 = eq(subFlagA, UInt<1>("h0")) @[FP8_ADD.scala 55:16]
            node _T_8 = eq(subFlagB, UInt<1>("h0")) @[FP8_ADD.scala 55:29]
            node _T_9 = and(_T_7, _T_8) @[FP8_ADD.scala 55:26]
            when _T_9 : @[FP8_ADD.scala 55:39]
              io.output <= UInt<1>("h0") @[FP8_ADD.scala 57:17]
            else :
              io.output <= UInt<1>("h0") @[FP8_ADD.scala 60:17]


