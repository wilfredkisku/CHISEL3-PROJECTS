circuit FP16Add :
  module FP16Add :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<16>, flip b : UInt<16>, result : UInt<16>}

    node signA = bits(io.a, 15, 15) @[FP16Add.scala 13:18]
    node expA = bits(io.a, 14, 10) @[FP16Add.scala 14:22]
    node sigA = bits(io.a, 9, 0) @[FP16Add.scala 15:25]
    node signB = bits(io.b, 15, 15) @[FP16Add.scala 13:18]
    node expB = bits(io.b, 14, 10) @[FP16Add.scala 14:22]
    node sigB = bits(io.b, 9, 0) @[FP16Add.scala 15:25]
    node _zeroFlagA_T = eq(expA, UInt<1>("h0")) @[FP16Add.scala 38:24]
    node _zeroFlagA_T_1 = eq(sigA, UInt<1>("h0")) @[FP16Add.scala 38:40]
    node zeroFlagA = and(_zeroFlagA_T, _zeroFlagA_T_1) @[FP16Add.scala 38:32]
    node _zeroFlagB_T = eq(expB, UInt<1>("h0")) @[FP16Add.scala 39:24]
    node _zeroFlagB_T_1 = eq(sigB, UInt<1>("h0")) @[FP16Add.scala 39:40]
    node zeroFlagB = and(_zeroFlagB_T, _zeroFlagB_T_1) @[FP16Add.scala 39:32]
    node _infFlagA_T = eq(expA, UInt<5>("h1f")) @[FP16Add.scala 44:23]
    node _infFlagA_T_1 = eq(sigA, UInt<1>("h0")) @[FP16Add.scala 44:46]
    node infFlagA = and(_infFlagA_T, _infFlagA_T_1) @[FP16Add.scala 44:38]
    node _infFlagB_T = eq(expB, UInt<5>("h1f")) @[FP16Add.scala 45:23]
    node _infFlagB_T_1 = eq(sigB, UInt<1>("h0")) @[FP16Add.scala 45:46]
    node infFlagB = and(_infFlagB_T, _infFlagB_T_1) @[FP16Add.scala 45:38]
    node _subNormA_T = eq(expA, UInt<1>("h0")) @[FP16Add.scala 47:23]
    node _subNormA_T_1 = neq(sigA, UInt<1>("h0")) @[FP16Add.scala 47:39]
    node subNormA = and(_subNormA_T, _subNormA_T_1) @[FP16Add.scala 47:31]
    node _subNormB_T = eq(expB, UInt<1>("h0")) @[FP16Add.scala 48:23]
    node _subNormB_T_1 = neq(sigB, UInt<1>("h0")) @[FP16Add.scala 48:39]
    node subNormB = and(_subNormB_T, _subNormB_T_1) @[FP16Add.scala 48:31]
    wire diff : UInt<5> @[FP16Add.scala 50:18]
    wire overflow : UInt<12> @[FP16Add.scala 51:22]
    overflow <= UInt<1>("h0") @[FP16Add.scala 52:12]
    diff <= UInt<1>("h0") @[FP16Add.scala 53:8]
    node _T = and(zeroFlagA, zeroFlagB) @[FP16Add.scala 55:18]
    when _T : @[FP16Add.scala 55:32]
      io.result <= UInt<1>("h0") @[FP16Add.scala 57:17]
    else :
      node _T_1 = eq(zeroFlagA, UInt<1>("h0")) @[FP16Add.scala 59:16]
      node _T_2 = and(_T_1, zeroFlagB) @[FP16Add.scala 59:27]
      when _T_2 : @[FP16Add.scala 59:40]
        io.result <= io.a @[FP16Add.scala 61:17]
      else :
        node _T_3 = eq(zeroFlagB, UInt<1>("h0")) @[FP16Add.scala 62:30]
        node _T_4 = and(zeroFlagA, _T_3) @[FP16Add.scala 62:27]
        when _T_4 : @[FP16Add.scala 62:41]
          io.result <= io.b @[FP16Add.scala 64:17]
        else :
          node _T_5 = or(infFlagA, infFlagB) @[FP16Add.scala 65:26]
          when _T_5 : @[FP16Add.scala 65:38]
            node _T_6 = and(infFlagA, infFlagB) @[FP16Add.scala 67:21]
            node _T_7 = neq(signA, signB) @[FP16Add.scala 67:43]
            node _T_8 = and(_T_6, _T_7) @[FP16Add.scala 67:33]
            when _T_8 : @[FP16Add.scala 67:54]
              io.result <= UInt<15>("h7fff") @[FP16Add.scala 69:19]
            else :
              node _io_result_T = mux(infFlagA, io.a, io.b) @[FP16Add.scala 73:25]
              io.result <= _io_result_T @[FP16Add.scala 73:19]
          else :
            node _T_9 = eq(sigA, UInt<5>("h1f")) @[FP16Add.scala 75:24]
            node _T_10 = eq(expA, UInt<10>("h3ff")) @[FP16Add.scala 75:49]
            node _T_11 = and(_T_9, _T_10) @[FP16Add.scala 75:40]
            node _T_12 = eq(sigB, UInt<5>("h1f")) @[FP16Add.scala 75:81]
            node _T_13 = eq(expB, UInt<10>("h3ff")) @[FP16Add.scala 75:106]
            node _T_14 = and(_T_12, _T_13) @[FP16Add.scala 75:97]
            node _T_15 = or(_T_11, _T_14) @[FP16Add.scala 75:71]
            when _T_15 : @[FP16Add.scala 75:128]
              io.result <= UInt<15>("h7fff") @[FP16Add.scala 76:17]
            else :
              node _T_16 = eq(subNormA, UInt<1>("h0")) @[FP16Add.scala 80:11]
              node _T_17 = eq(subNormB, UInt<1>("h0")) @[FP16Add.scala 80:24]
              node _T_18 = and(_T_16, _T_17) @[FP16Add.scala 80:21]
              when _T_18 : @[FP16Add.scala 80:34]
                node _T_19 = eq(expA, expB) @[FP16Add.scala 83:19]
                when _T_19 : @[FP16Add.scala 83:29]
                  node _T_20 = eq(signA, UInt<1>("h0")) @[FP16Add.scala 86:22]
                  node _T_21 = eq(signB, UInt<1>("h0")) @[FP16Add.scala 86:39]
                  node _T_22 = and(_T_20, _T_21) @[FP16Add.scala 86:30]
                  when _T_22 : @[FP16Add.scala 86:47]
                    node _io_result_T_1 = cat(UInt<1>("h1"), sigA) @[Cat.scala 33:92]
                    node _io_result_T_2 = cat(UInt<1>("h1"), sigB) @[Cat.scala 33:92]
                    node _io_result_T_3 = add(_io_result_T_1, _io_result_T_2) @[FP16Add.scala 89:46]
                    node _io_result_T_4 = bits(_io_result_T_3, 11, 11) @[FP16Add.scala 89:64]
                    node _io_result_T_5 = eq(_io_result_T_4, UInt<1>("h1")) @[FP16Add.scala 89:69]
                    node _io_result_T_6 = add(expA, UInt<1>("h1")) @[FP16Add.scala 89:94]
                    node _io_result_T_7 = tail(_io_result_T_6, 1) @[FP16Add.scala 89:94]
                    node _io_result_T_8 = cat(UInt<1>("h1"), sigA) @[Cat.scala 33:92]
                    node _io_result_T_9 = cat(UInt<1>("h1"), sigB) @[Cat.scala 33:92]
                    node _io_result_T_10 = add(_io_result_T_8, _io_result_T_9) @[FP16Add.scala 89:117]
                    node _io_result_T_11 = bits(_io_result_T_10, 10, 1) @[FP16Add.scala 89:135]
                    node io_result_hi = cat(signA, _io_result_T_7) @[Cat.scala 33:92]
                    node _io_result_T_12 = cat(io_result_hi, _io_result_T_11) @[Cat.scala 33:92]
                    node _io_result_T_13 = cat(UInt<1>("h1"), sigA) @[Cat.scala 33:92]
                    node _io_result_T_14 = cat(UInt<1>("h1"), sigB) @[Cat.scala 33:92]
                    node _io_result_T_15 = add(_io_result_T_13, _io_result_T_14) @[FP16Add.scala 89:178]
                    node _io_result_T_16 = bits(_io_result_T_15, 9, 0) @[FP16Add.scala 89:196]
                    node io_result_hi_1 = cat(signA, expA) @[Cat.scala 33:92]
                    node _io_result_T_17 = cat(io_result_hi_1, _io_result_T_16) @[Cat.scala 33:92]
                    node _io_result_T_18 = mux(_io_result_T_5, _io_result_T_12, _io_result_T_17) @[FP16Add.scala 89:29]
                    io.result <= _io_result_T_18 @[FP16Add.scala 89:23]
                  else :
                    node _T_23 = eq(signA, UInt<1>("h1")) @[FP16Add.scala 90:28]
                    node _T_24 = eq(signB, UInt<1>("h0")) @[FP16Add.scala 90:45]
                    node _T_25 = and(_T_23, _T_24) @[FP16Add.scala 90:36]
                    when _T_25 : @[FP16Add.scala 90:53]
                      node _io_result_T_19 = geq(sigB, sigA) @[FP16Add.scala 92:35]
                      node _io_result_T_20 = cat(UInt<1>("h1"), sigB) @[Cat.scala 33:92]
                      node _io_result_T_21 = cat(UInt<1>("h1"), sigA) @[Cat.scala 33:92]
                      node _io_result_T_22 = sub(_io_result_T_20, _io_result_T_21) @[FP16Add.scala 92:75]
                      node _io_result_T_23 = tail(_io_result_T_22, 1) @[FP16Add.scala 92:75]
                      node _io_result_T_24 = bits(_io_result_T_23, 9, 0) @[FP16Add.scala 92:92]
                      node io_result_hi_2 = cat(UInt<1>("h0"), expB) @[Cat.scala 33:92]
                      node _io_result_T_25 = cat(io_result_hi_2, _io_result_T_24) @[Cat.scala 33:92]
                      node _io_result_T_26 = cat(UInt<1>("h1"), sigA) @[Cat.scala 33:92]
                      node _io_result_T_27 = cat(UInt<1>("h1"), sigB) @[Cat.scala 33:92]
                      node _io_result_T_28 = sub(_io_result_T_26, _io_result_T_27) @[FP16Add.scala 92:131]
                      node _io_result_T_29 = tail(_io_result_T_28, 1) @[FP16Add.scala 92:131]
                      node _io_result_T_30 = bits(_io_result_T_29, 9, 0) @[FP16Add.scala 92:148]
                      node io_result_hi_3 = cat(UInt<1>("h1"), expA) @[Cat.scala 33:92]
                      node _io_result_T_31 = cat(io_result_hi_3, _io_result_T_30) @[Cat.scala 33:92]
                      node _io_result_T_32 = mux(_io_result_T_19, _io_result_T_25, _io_result_T_31) @[FP16Add.scala 92:29]
                      io.result <= _io_result_T_32 @[FP16Add.scala 92:23]
                    else :
                      node _T_26 = eq(signA, UInt<1>("h0")) @[FP16Add.scala 93:28]
                      node _T_27 = eq(signB, UInt<1>("h1")) @[FP16Add.scala 93:45]
                      node _T_28 = and(_T_26, _T_27) @[FP16Add.scala 93:36]
                      when _T_28 : @[FP16Add.scala 93:53]
                        node _io_result_T_33 = geq(sigB, sigA) @[FP16Add.scala 94:35]
                        node _io_result_T_34 = cat(UInt<1>("h1"), sigB) @[Cat.scala 33:92]
                        node _io_result_T_35 = cat(UInt<1>("h1"), sigA) @[Cat.scala 33:92]
                        node _io_result_T_36 = sub(_io_result_T_34, _io_result_T_35) @[FP16Add.scala 94:75]
                        node _io_result_T_37 = tail(_io_result_T_36, 1) @[FP16Add.scala 94:75]
                        node _io_result_T_38 = bits(_io_result_T_37, 9, 0) @[FP16Add.scala 94:92]
                        node io_result_hi_4 = cat(UInt<1>("h1"), expB) @[Cat.scala 33:92]
                        node _io_result_T_39 = cat(io_result_hi_4, _io_result_T_38) @[Cat.scala 33:92]
                        node _io_result_T_40 = cat(UInt<1>("h1"), sigA) @[Cat.scala 33:92]
                        node _io_result_T_41 = cat(UInt<1>("h1"), sigB) @[Cat.scala 33:92]
                        node _io_result_T_42 = sub(_io_result_T_40, _io_result_T_41) @[FP16Add.scala 94:131]
                        node _io_result_T_43 = tail(_io_result_T_42, 1) @[FP16Add.scala 94:131]
                        node _io_result_T_44 = bits(_io_result_T_43, 9, 0) @[FP16Add.scala 94:148]
                        node io_result_hi_5 = cat(UInt<1>("h0"), expA) @[Cat.scala 33:92]
                        node _io_result_T_45 = cat(io_result_hi_5, _io_result_T_44) @[Cat.scala 33:92]
                        node _io_result_T_46 = mux(_io_result_T_33, _io_result_T_39, _io_result_T_45) @[FP16Add.scala 94:29]
                        io.result <= _io_result_T_46 @[FP16Add.scala 94:23]
                      else :
                        node _io_result_T_47 = cat(UInt<1>("h1"), sigA) @[Cat.scala 33:92]
                        node _io_result_T_48 = cat(UInt<1>("h1"), sigB) @[Cat.scala 33:92]
                        node _io_result_T_49 = add(_io_result_T_47, _io_result_T_48) @[FP16Add.scala 96:46]
                        node _io_result_T_50 = bits(_io_result_T_49, 11, 11) @[FP16Add.scala 96:64]
                        node _io_result_T_51 = eq(_io_result_T_50, UInt<1>("h1")) @[FP16Add.scala 96:69]
                        node _io_result_T_52 = add(expA, UInt<1>("h1")) @[FP16Add.scala 96:94]
                        node _io_result_T_53 = tail(_io_result_T_52, 1) @[FP16Add.scala 96:94]
                        node _io_result_T_54 = cat(UInt<1>("h1"), sigA) @[Cat.scala 33:92]
                        node _io_result_T_55 = cat(UInt<1>("h1"), sigB) @[Cat.scala 33:92]
                        node _io_result_T_56 = add(_io_result_T_54, _io_result_T_55) @[FP16Add.scala 96:117]
                        node _io_result_T_57 = bits(_io_result_T_56, 10, 1) @[FP16Add.scala 96:135]
                        node io_result_hi_6 = cat(signA, _io_result_T_53) @[Cat.scala 33:92]
                        node _io_result_T_58 = cat(io_result_hi_6, _io_result_T_57) @[Cat.scala 33:92]
                        node _io_result_T_59 = cat(UInt<1>("h1"), sigA) @[Cat.scala 33:92]
                        node _io_result_T_60 = cat(UInt<1>("h1"), sigB) @[Cat.scala 33:92]
                        node _io_result_T_61 = add(_io_result_T_59, _io_result_T_60) @[FP16Add.scala 96:178]
                        node _io_result_T_62 = bits(_io_result_T_61, 9, 0) @[FP16Add.scala 96:196]
                        node io_result_hi_7 = cat(signA, expA) @[Cat.scala 33:92]
                        node _io_result_T_63 = cat(io_result_hi_7, _io_result_T_62) @[Cat.scala 33:92]
                        node _io_result_T_64 = mux(_io_result_T_51, _io_result_T_58, _io_result_T_63) @[FP16Add.scala 96:29]
                        io.result <= _io_result_T_64 @[FP16Add.scala 96:23]
                else :
                  node _T_29 = gt(expA, expB) @[FP16Add.scala 98:25]
                  when _T_29 : @[FP16Add.scala 98:33]
                    node _T_30 = eq(signA, UInt<1>("h0")) @[FP16Add.scala 105:26]
                    when _T_30 : @[FP16Add.scala 105:34]
                      node _io_result_T_65 = eq(signB, UInt<1>("h0")) @[FP16Add.scala 106:44]
                      node _io_result_T_66 = cat(UInt<1>("h1"), sigA) @[Cat.scala 33:92]
                      node _io_result_T_67 = sub(expA, expB) @[FP16Add.scala 106:107]
                      node _io_result_T_68 = tail(_io_result_T_67, 1) @[FP16Add.scala 106:107]
                      node _io_result_T_69 = dshr(sigB, _io_result_T_68) @[FP16Add.scala 106:99]
                      node _io_result_T_70 = cat(UInt<1>("h0"), _io_result_T_69) @[Cat.scala 33:92]
                      node _io_result_T_71 = add(_io_result_T_66, _io_result_T_70) @[FP16Add.scala 106:83]
                      node _io_result_T_72 = tail(_io_result_T_71, 1) @[FP16Add.scala 106:83]
                      node io_result_hi_8 = cat(UInt<1>("h0"), expA) @[Cat.scala 33:92]
                      node _io_result_T_73 = cat(io_result_hi_8, _io_result_T_72) @[Cat.scala 33:92]
                      node _io_result_T_74 = cat(UInt<1>("h1"), sigA) @[Cat.scala 33:92]
                      node _io_result_T_75 = sub(expA, expB) @[FP16Add.scala 106:171]
                      node _io_result_T_76 = tail(_io_result_T_75, 1) @[FP16Add.scala 106:171]
                      node _io_result_T_77 = dshr(sigB, _io_result_T_76) @[FP16Add.scala 106:163]
                      node _io_result_T_78 = cat(UInt<1>("h1"), _io_result_T_77) @[Cat.scala 33:92]
                      node _io_result_T_79 = sub(_io_result_T_74, _io_result_T_78) @[FP16Add.scala 106:147]
                      node _io_result_T_80 = tail(_io_result_T_79, 1) @[FP16Add.scala 106:147]
                      node io_result_hi_9 = cat(UInt<1>("h0"), expA) @[Cat.scala 33:92]
                      node _io_result_T_81 = cat(io_result_hi_9, _io_result_T_80) @[Cat.scala 33:92]
                      node _io_result_T_82 = mux(_io_result_T_65, _io_result_T_73, _io_result_T_81) @[FP16Add.scala 106:37]
                      io.result <= _io_result_T_82 @[FP16Add.scala 106:31]
                    else :
                      node _io_result_T_83 = eq(signB, UInt<1>("h0")) @[FP16Add.scala 108:40]
                      node _io_result_T_84 = cat(UInt<1>("h1"), sigA) @[Cat.scala 33:92]
                      node _io_result_T_85 = sub(expA, expB) @[FP16Add.scala 108:103]
                      node _io_result_T_86 = tail(_io_result_T_85, 1) @[FP16Add.scala 108:103]
                      node _io_result_T_87 = dshr(sigB, _io_result_T_86) @[FP16Add.scala 108:95]
                      node _io_result_T_88 = cat(UInt<1>("h0"), _io_result_T_87) @[Cat.scala 33:92]
                      node _io_result_T_89 = sub(_io_result_T_84, _io_result_T_88) @[FP16Add.scala 108:79]
                      node _io_result_T_90 = tail(_io_result_T_89, 1) @[FP16Add.scala 108:79]
                      node io_result_hi_10 = cat(UInt<1>("h1"), expA) @[Cat.scala 33:92]
                      node _io_result_T_91 = cat(io_result_hi_10, _io_result_T_90) @[Cat.scala 33:92]
                      node _io_result_T_92 = cat(UInt<1>("h1"), sigA) @[Cat.scala 33:92]
                      node _io_result_T_93 = sub(expA, expB) @[FP16Add.scala 108:167]
                      node _io_result_T_94 = tail(_io_result_T_93, 1) @[FP16Add.scala 108:167]
                      node _io_result_T_95 = dshr(sigB, _io_result_T_94) @[FP16Add.scala 108:159]
                      node _io_result_T_96 = cat(UInt<1>("h1"), _io_result_T_95) @[Cat.scala 33:92]
                      node _io_result_T_97 = add(_io_result_T_92, _io_result_T_96) @[FP16Add.scala 108:143]
                      node _io_result_T_98 = tail(_io_result_T_97, 1) @[FP16Add.scala 108:143]
                      node io_result_hi_11 = cat(UInt<1>("h1"), expA) @[Cat.scala 33:92]
                      node _io_result_T_99 = cat(io_result_hi_11, _io_result_T_98) @[Cat.scala 33:92]
                      node _io_result_T_100 = mux(_io_result_T_83, _io_result_T_91, _io_result_T_99) @[FP16Add.scala 108:33]
                      io.result <= _io_result_T_100 @[FP16Add.scala 108:27]
                  else :
                    node _T_31 = eq(signB, UInt<1>("h0")) @[FP16Add.scala 113:22]
                    when _T_31 : @[FP16Add.scala 113:30]
                      node _io_result_T_101 = eq(signA, UInt<1>("h0")) @[FP16Add.scala 114:36]
                      node _io_result_T_102 = cat(UInt<1>("h1"), sigB) @[Cat.scala 33:92]
                      node _io_result_T_103 = sub(expB, expA) @[FP16Add.scala 114:99]
                      node _io_result_T_104 = tail(_io_result_T_103, 1) @[FP16Add.scala 114:99]
                      node _io_result_T_105 = dshr(sigA, _io_result_T_104) @[FP16Add.scala 114:91]
                      node _io_result_T_106 = cat(UInt<1>("h0"), _io_result_T_105) @[Cat.scala 33:92]
                      node _io_result_T_107 = add(_io_result_T_102, _io_result_T_106) @[FP16Add.scala 114:75]
                      node _io_result_T_108 = tail(_io_result_T_107, 1) @[FP16Add.scala 114:75]
                      node io_result_hi_12 = cat(UInt<1>("h0"), expB) @[Cat.scala 33:92]
                      node _io_result_T_109 = cat(io_result_hi_12, _io_result_T_108) @[Cat.scala 33:92]
                      node _io_result_T_110 = cat(UInt<1>("h1"), sigB) @[Cat.scala 33:92]
                      node _io_result_T_111 = sub(expB, expA) @[FP16Add.scala 114:163]
                      node _io_result_T_112 = tail(_io_result_T_111, 1) @[FP16Add.scala 114:163]
                      node _io_result_T_113 = dshr(sigA, _io_result_T_112) @[FP16Add.scala 114:155]
                      node _io_result_T_114 = cat(UInt<1>("h1"), _io_result_T_113) @[Cat.scala 33:92]
                      node _io_result_T_115 = sub(_io_result_T_110, _io_result_T_114) @[FP16Add.scala 114:139]
                      node _io_result_T_116 = tail(_io_result_T_115, 1) @[FP16Add.scala 114:139]
                      node io_result_hi_13 = cat(UInt<1>("h0"), expB) @[Cat.scala 33:92]
                      node _io_result_T_117 = cat(io_result_hi_13, _io_result_T_116) @[Cat.scala 33:92]
                      node _io_result_T_118 = mux(_io_result_T_101, _io_result_T_109, _io_result_T_117) @[FP16Add.scala 114:29]
                      io.result <= _io_result_T_118 @[FP16Add.scala 114:23]
                    else :
                      node _io_result_T_119 = eq(signA, UInt<1>("h0")) @[FP16Add.scala 116:36]
                      node _io_result_T_120 = cat(UInt<1>("h1"), sigB) @[Cat.scala 33:92]
                      node _io_result_T_121 = sub(expB, expA) @[FP16Add.scala 116:99]
                      node _io_result_T_122 = tail(_io_result_T_121, 1) @[FP16Add.scala 116:99]
                      node _io_result_T_123 = dshr(sigA, _io_result_T_122) @[FP16Add.scala 116:91]
                      node _io_result_T_124 = cat(UInt<1>("h0"), _io_result_T_123) @[Cat.scala 33:92]
                      node _io_result_T_125 = sub(_io_result_T_120, _io_result_T_124) @[FP16Add.scala 116:75]
                      node _io_result_T_126 = tail(_io_result_T_125, 1) @[FP16Add.scala 116:75]
                      node io_result_hi_14 = cat(UInt<1>("h1"), expB) @[Cat.scala 33:92]
                      node _io_result_T_127 = cat(io_result_hi_14, _io_result_T_126) @[Cat.scala 33:92]
                      node _io_result_T_128 = cat(UInt<1>("h1"), sigB) @[Cat.scala 33:92]
                      node _io_result_T_129 = sub(expB, expA) @[FP16Add.scala 116:163]
                      node _io_result_T_130 = tail(_io_result_T_129, 1) @[FP16Add.scala 116:163]
                      node _io_result_T_131 = dshr(sigA, _io_result_T_130) @[FP16Add.scala 116:155]
                      node _io_result_T_132 = cat(UInt<1>("h1"), _io_result_T_131) @[Cat.scala 33:92]
                      node _io_result_T_133 = add(_io_result_T_128, _io_result_T_132) @[FP16Add.scala 116:139]
                      node _io_result_T_134 = tail(_io_result_T_133, 1) @[FP16Add.scala 116:139]
                      node io_result_hi_15 = cat(UInt<1>("h1"), expB) @[Cat.scala 33:92]
                      node _io_result_T_135 = cat(io_result_hi_15, _io_result_T_134) @[Cat.scala 33:92]
                      node _io_result_T_136 = mux(_io_result_T_119, _io_result_T_127, _io_result_T_135) @[FP16Add.scala 116:29]
                      io.result <= _io_result_T_136 @[FP16Add.scala 116:23]
              else :
                node _T_32 = and(subNormA, subNormB) @[FP16Add.scala 121:26]
                when _T_32 : @[FP16Add.scala 121:38]
                  node _T_33 = lt(sigA, sigB) @[FP16Add.scala 123:19]
                  when _T_33 : @[FP16Add.scala 123:26]
                    node _T_34 = eq(signB, UInt<1>("h1")) @[FP16Add.scala 124:22]
                    when _T_34 : @[FP16Add.scala 124:30]
                      node _io_result_T_137 = eq(signA, UInt<1>("h1")) @[FP16Add.scala 125:36]
                      node _io_result_T_138 = cat(UInt<1>("h0"), sigB) @[Cat.scala 33:92]
                      node _io_result_T_139 = cat(UInt<1>("h0"), sigA) @[Cat.scala 33:92]
                      node _io_result_T_140 = add(_io_result_T_138, _io_result_T_139) @[FP16Add.scala 125:75]
                      node _io_result_T_141 = tail(_io_result_T_140, 1) @[FP16Add.scala 125:75]
                      node io_result_hi_16 = cat(UInt<1>("h1"), expB) @[Cat.scala 33:92]
                      node _io_result_T_142 = cat(io_result_hi_16, _io_result_T_141) @[Cat.scala 33:92]
                      node _io_result_T_143 = cat(UInt<1>("h0"), sigB) @[Cat.scala 33:92]
                      node _io_result_T_144 = cat(UInt<1>("h0"), sigA) @[Cat.scala 33:92]
                      node _io_result_T_145 = sub(_io_result_T_143, _io_result_T_144) @[FP16Add.scala 125:124]
                      node _io_result_T_146 = tail(_io_result_T_145, 1) @[FP16Add.scala 125:124]
                      node io_result_hi_17 = cat(UInt<1>("h1"), expB) @[Cat.scala 33:92]
                      node _io_result_T_147 = cat(io_result_hi_17, _io_result_T_146) @[Cat.scala 33:92]
                      node _io_result_T_148 = mux(_io_result_T_137, _io_result_T_142, _io_result_T_147) @[FP16Add.scala 125:29]
                      io.result <= _io_result_T_148 @[FP16Add.scala 125:23]
                    else :
                      node _io_result_T_149 = eq(signA, UInt<1>("h1")) @[FP16Add.scala 128:38]
                      node _io_result_T_150 = cat(UInt<1>("h0"), sigB) @[Cat.scala 33:92]
                      node _io_result_T_151 = cat(UInt<1>("h0"), sigA) @[Cat.scala 33:92]
                      node _io_result_T_152 = sub(_io_result_T_150, _io_result_T_151) @[FP16Add.scala 128:77]
                      node _io_result_T_153 = tail(_io_result_T_152, 1) @[FP16Add.scala 128:77]
                      node io_result_hi_18 = cat(UInt<1>("h0"), expB) @[Cat.scala 33:92]
                      node _io_result_T_154 = cat(io_result_hi_18, _io_result_T_153) @[Cat.scala 33:92]
                      node _io_result_T_155 = cat(UInt<1>("h0"), sigB) @[Cat.scala 33:92]
                      node _io_result_T_156 = cat(UInt<1>("h0"), sigA) @[Cat.scala 33:92]
                      node _io_result_T_157 = add(_io_result_T_155, _io_result_T_156) @[FP16Add.scala 128:126]
                      node _io_result_T_158 = tail(_io_result_T_157, 1) @[FP16Add.scala 128:126]
                      node io_result_hi_19 = cat(UInt<1>("h0"), expB) @[Cat.scala 33:92]
                      node _io_result_T_159 = cat(io_result_hi_19, _io_result_T_158) @[Cat.scala 33:92]
                      node _io_result_T_160 = mux(_io_result_T_149, _io_result_T_154, _io_result_T_159) @[FP16Add.scala 128:31]
                      io.result <= _io_result_T_160 @[FP16Add.scala 128:25]
                  else :
                    node _T_35 = eq(signA, UInt<1>("h1")) @[FP16Add.scala 132:22]
                    when _T_35 : @[FP16Add.scala 132:30]
                      node _io_result_T_161 = eq(signB, UInt<1>("h1")) @[FP16Add.scala 133:36]
                      node _io_result_T_162 = cat(UInt<1>("h0"), sigA) @[Cat.scala 33:92]
                      node _io_result_T_163 = cat(UInt<1>("h0"), sigB) @[Cat.scala 33:92]
                      node _io_result_T_164 = add(_io_result_T_162, _io_result_T_163) @[FP16Add.scala 133:75]
                      node _io_result_T_165 = tail(_io_result_T_164, 1) @[FP16Add.scala 133:75]
                      node io_result_hi_20 = cat(UInt<1>("h1"), expA) @[Cat.scala 33:92]
                      node _io_result_T_166 = cat(io_result_hi_20, _io_result_T_165) @[Cat.scala 33:92]
                      node _io_result_T_167 = cat(UInt<1>("h0"), sigA) @[Cat.scala 33:92]
                      node _io_result_T_168 = cat(UInt<1>("h0"), sigB) @[Cat.scala 33:92]
                      node _io_result_T_169 = sub(_io_result_T_167, _io_result_T_168) @[FP16Add.scala 133:124]
                      node _io_result_T_170 = tail(_io_result_T_169, 1) @[FP16Add.scala 133:124]
                      node io_result_hi_21 = cat(UInt<1>("h1"), expA) @[Cat.scala 33:92]
                      node _io_result_T_171 = cat(io_result_hi_21, _io_result_T_170) @[Cat.scala 33:92]
                      node _io_result_T_172 = mux(_io_result_T_161, _io_result_T_166, _io_result_T_171) @[FP16Add.scala 133:29]
                      io.result <= _io_result_T_172 @[FP16Add.scala 133:23]
                    else :
                      node _io_result_T_173 = eq(signB, UInt<1>("h1")) @[FP16Add.scala 136:38]
                      node _io_result_T_174 = cat(UInt<1>("h0"), sigA) @[Cat.scala 33:92]
                      node _io_result_T_175 = cat(UInt<1>("h0"), sigB) @[Cat.scala 33:92]
                      node _io_result_T_176 = sub(_io_result_T_174, _io_result_T_175) @[FP16Add.scala 136:77]
                      node _io_result_T_177 = tail(_io_result_T_176, 1) @[FP16Add.scala 136:77]
                      node io_result_hi_22 = cat(UInt<1>("h0"), expA) @[Cat.scala 33:92]
                      node _io_result_T_178 = cat(io_result_hi_22, _io_result_T_177) @[Cat.scala 33:92]
                      node _io_result_T_179 = cat(UInt<1>("h0"), sigA) @[Cat.scala 33:92]
                      node _io_result_T_180 = cat(UInt<1>("h0"), sigB) @[Cat.scala 33:92]
                      node _io_result_T_181 = add(_io_result_T_179, _io_result_T_180) @[FP16Add.scala 136:126]
                      node _io_result_T_182 = tail(_io_result_T_181, 1) @[FP16Add.scala 136:126]
                      node io_result_hi_23 = cat(UInt<1>("h0"), expA) @[Cat.scala 33:92]
                      node _io_result_T_183 = cat(io_result_hi_23, _io_result_T_182) @[Cat.scala 33:92]
                      node _io_result_T_184 = mux(_io_result_T_173, _io_result_T_178, _io_result_T_183) @[FP16Add.scala 136:31]
                      io.result <= _io_result_T_184 @[FP16Add.scala 136:25]
                else :
                  io.result <= UInt<1>("h0") @[FP16Add.scala 142:19]


