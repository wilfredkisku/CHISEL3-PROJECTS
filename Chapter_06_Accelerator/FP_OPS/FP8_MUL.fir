circuit FP8_MUL :
  module FP8_MUL :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip inputA : UInt<8>, flip inputB : UInt<8>, output : UInt<8>}

    node signA = bits(io.inputA, 7, 7) @[FP8_MUL.scala 13:20]
    node expA = bits(io.inputA, 6, 2) @[FP8_MUL.scala 14:24]
    node sigA = bits(io.inputA, 1, 0) @[FP8_MUL.scala 15:27]
    node signB = bits(io.inputB, 7, 7) @[FP8_MUL.scala 13:20]
    node expB = bits(io.inputB, 6, 2) @[FP8_MUL.scala 14:24]
    node sigB = bits(io.inputB, 1, 0) @[FP8_MUL.scala 15:27]
    node _infFlagA_T = eq(expA, UInt<5>("h1f")) @[FP8_MUL.scala 24:25]
    node _infFlagA_T_1 = eq(sigA, UInt<1>("h0")) @[FP8_MUL.scala 24:48]
    node infFlagA = and(_infFlagA_T, _infFlagA_T_1) @[FP8_MUL.scala 24:40]
    node _infFlagB_T = eq(expB, UInt<5>("h1f")) @[FP8_MUL.scala 25:25]
    node _infFlagB_T_1 = eq(sigB, UInt<1>("h0")) @[FP8_MUL.scala 25:48]
    node infFlagB = and(_infFlagB_T, _infFlagB_T_1) @[FP8_MUL.scala 25:40]
    node _zeroFlagA_T = eq(expA, UInt<1>("h0")) @[FP8_MUL.scala 28:26]
    node _zeroFlagA_T_1 = eq(sigA, UInt<1>("h0")) @[FP8_MUL.scala 28:49]
    node zeroFlagA = and(_zeroFlagA_T, _zeroFlagA_T_1) @[FP8_MUL.scala 28:41]
    node _zeroFlagB_T = eq(expB, UInt<1>("h0")) @[FP8_MUL.scala 29:26]
    node _zeroFlagB_T_1 = eq(sigB, UInt<1>("h0")) @[FP8_MUL.scala 29:49]
    node zeroFlagB = and(_zeroFlagB_T, _zeroFlagB_T_1) @[FP8_MUL.scala 29:41]
    node _nanFlagA_T = eq(expA, UInt<5>("h1f")) @[FP8_MUL.scala 32:25]
    node _nanFlagA_T_1 = neq(sigA, UInt<1>("h0")) @[FP8_MUL.scala 32:48]
    node nanFlagA = and(_nanFlagA_T, _nanFlagA_T_1) @[FP8_MUL.scala 32:40]
    node _nanFlagB_T = eq(expB, UInt<5>("h1f")) @[FP8_MUL.scala 33:25]
    node _nanFlagB_T_1 = neq(sigB, UInt<1>("h0")) @[FP8_MUL.scala 33:48]
    node nanFlagB = and(_nanFlagB_T, _nanFlagB_T_1) @[FP8_MUL.scala 33:40]
    node _subFlagA_T = eq(expA, UInt<1>("h0")) @[FP8_MUL.scala 36:25]
    node _subFlagA_T_1 = neq(sigA, UInt<1>("h0")) @[FP8_MUL.scala 36:48]
    node subFlagA = and(_subFlagA_T, _subFlagA_T_1) @[FP8_MUL.scala 36:40]
    node _subFlagB_T = eq(expB, UInt<1>("h0")) @[FP8_MUL.scala 37:25]
    node _subFlagB_T_1 = neq(sigB, UInt<1>("h0")) @[FP8_MUL.scala 37:48]
    node subFlagB = and(_subFlagB_T, _subFlagB_T_1) @[FP8_MUL.scala 37:40]
    wire ovrChk_6 : UInt<6> @[FP8_MUL.scala 40:24]
    wire sigMul_6 : UInt<6> @[FP8_MUL.scala 41:24]
    ovrChk_6 <= UInt<1>("h0") @[FP8_MUL.scala 42:14]
    sigMul_6 <= UInt<1>("h0") @[FP8_MUL.scala 43:14]
    node _T = and(zeroFlagA, zeroFlagB) @[FP8_MUL.scala 45:19]
    when _T : @[FP8_MUL.scala 45:32]
      io.output <= UInt<1>("h0") @[FP8_MUL.scala 47:15]
    else :
      node _T_1 = or(zeroFlagA, zeroFlagB) @[FP8_MUL.scala 48:24]
      when _T_1 : @[FP8_MUL.scala 48:37]
        io.output <= UInt<1>("h0") @[FP8_MUL.scala 49:15]
      else :
        node _T_2 = or(infFlagA, infFlagB) @[FP8_MUL.scala 50:23]
        when _T_2 : @[FP8_MUL.scala 50:35]
          node _T_3 = and(infFlagA, infFlagB) @[FP8_MUL.scala 52:20]
          node _T_4 = neq(signA, signB) @[FP8_MUL.scala 52:42]
          node _T_5 = and(_T_3, _T_4) @[FP8_MUL.scala 52:32]
          when _T_5 : @[FP8_MUL.scala 52:53]
            io.output <= UInt<7>("h7f") @[FP8_MUL.scala 53:17]
          else :
            node _io_output_T = mux(infFlagA, io.inputA, io.inputB) @[FP8_MUL.scala 55:23]
            io.output <= _io_output_T @[FP8_MUL.scala 55:17]
        else :
          node _T_6 = or(nanFlagA, nanFlagB) @[FP8_MUL.scala 57:23]
          when _T_6 : @[FP8_MUL.scala 57:35]
            io.output <= UInt<7>("h7f") @[FP8_MUL.scala 58:15]
          else :
            node _ovrChk_6_T = add(expA, expB) @[FP8_MUL.scala 61:22]
            ovrChk_6 <= _ovrChk_6_T @[FP8_MUL.scala 61:14]
            node _sigMul_6_T = eq(subFlagA, UInt<1>("h0")) @[FP8_MUL.scala 62:21]
            node _sigMul_6_T_1 = cat(_sigMul_6_T, sigA) @[Cat.scala 33:92]
            node _sigMul_6_T_2 = eq(subFlagB, UInt<1>("h0")) @[FP8_MUL.scala 62:43]
            node _sigMul_6_T_3 = cat(_sigMul_6_T_2, sigB) @[Cat.scala 33:92]
            node _sigMul_6_T_4 = mul(_sigMul_6_T_1, _sigMul_6_T_3) @[FP8_MUL.scala 62:37]
            sigMul_6 <= _sigMul_6_T_4 @[FP8_MUL.scala 62:14]
            node _T_7 = gt(ovrChk_6, UInt<6>("h2d")) @[FP8_MUL.scala 63:19]
            when _T_7 : @[FP8_MUL.scala 63:26]
              node _io_output_T_1 = xor(signA, signB) @[FP8_MUL.scala 64:30]
              node _io_output_T_2 = cat(_io_output_T_1, UInt<7>("h7c")) @[Cat.scala 33:92]
              io.output <= _io_output_T_2 @[FP8_MUL.scala 64:17]
            else :
              node _T_8 = lt(ovrChk_6, UInt<4>("hf")) @[FP8_MUL.scala 65:25]
              when _T_8 : @[FP8_MUL.scala 65:32]
                io.output <= UInt<1>("h0") @[FP8_MUL.scala 66:17]
              else :
                node _io_output_T_3 = xor(signA, signB) @[FP8_MUL.scala 69:30]
                node _io_output_T_4 = sub(ovrChk_6, UInt<4>("hf")) @[FP8_MUL.scala 69:50]
                node _io_output_T_5 = tail(_io_output_T_4, 1) @[FP8_MUL.scala 69:50]
                node _io_output_T_6 = bits(_io_output_T_5, 4, 0) @[FP8_MUL.scala 69:57]
                node _io_output_T_7 = bits(sigMul_6, 5, 5) @[FP8_MUL.scala 69:73]
                node _io_output_T_8 = add(_io_output_T_6, _io_output_T_7) @[FP8_MUL.scala 69:63]
                node _io_output_T_9 = tail(_io_output_T_8, 1) @[FP8_MUL.scala 69:63]
                node _io_output_T_10 = bits(sigMul_6, 5, 5) @[FP8_MUL.scala 69:100]
                node _io_output_T_11 = dshr(sigMul_6, _io_output_T_10) @[FP8_MUL.scala 69:89]
                node _io_output_T_12 = bits(_io_output_T_11, 3, 2) @[FP8_MUL.scala 69:104]
                node io_output_hi = cat(_io_output_T_3, _io_output_T_9) @[Cat.scala 33:92]
                node _io_output_T_13 = cat(io_output_hi, _io_output_T_12) @[Cat.scala 33:92]
                io.output <= _io_output_T_13 @[FP8_MUL.scala 69:17]


