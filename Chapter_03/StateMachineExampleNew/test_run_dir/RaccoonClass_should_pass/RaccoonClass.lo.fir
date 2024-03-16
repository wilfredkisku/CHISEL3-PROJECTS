FIRRTL version 1.1.0
circuit RaccoonClass :
  module RaccoonClass :
    input clock : Clock
    input reset : UInt<1>
    input io_noise : UInt<1>
    input io_trash : UInt<1>
    input io_food : UInt<1>
    output io_action : UInt<2>

    reg state : UInt<2>, clock with :
      reset => (UInt<1>("h0"), state) @[RacoonClass.scala 16:22]
    node _T = eq(state, UInt<1>("h0")) @[RacoonClass.scala 17:15]
    node _T_1 = eq(io_noise, UInt<1>("h0")) @[RacoonClass.scala 18:11]
    node _GEN_0 = mux(_T_1, UInt<1>("h1"), state) @[RacoonClass.scala 16:22 18:{22,30}]
    node _T_2 = eq(state, UInt<1>("h1")) @[RacoonClass.scala 19:22]
    node _GEN_1 = mux(io_trash, UInt<2>("h2"), state) @[RacoonClass.scala 16:22 21:{28,36}]
    node _GEN_2 = mux(io_noise, UInt<1>("h0"), _GEN_1) @[RacoonClass.scala 20:{21,29}]
    node _T_3 = eq(state, UInt<2>("h2")) @[RacoonClass.scala 22:22]
    node _GEN_3 = mux(io_food, UInt<2>("h3"), state) @[RacoonClass.scala 16:22 24:{27,35}]
    node _GEN_4 = mux(io_noise, UInt<1>("h0"), _GEN_3) @[RacoonClass.scala 23:{21,29}]
    node _T_4 = eq(state, UInt<2>("h3")) @[RacoonClass.scala 25:22]
    node _T_5 = eq(io_food, UInt<1>("h0")) @[RacoonClass.scala 27:18]
    node _GEN_5 = mux(_T_5, UInt<1>("h1"), state) @[RacoonClass.scala 16:22 27:{28,36}]
    node _GEN_6 = mux(io_noise, UInt<1>("h0"), _GEN_5) @[RacoonClass.scala 26:{21,29}]
    node _GEN_7 = mux(_T_4, _GEN_6, state) @[RacoonClass.scala 16:22 25:42]
    node _GEN_8 = mux(_T_3, _GEN_4, _GEN_7) @[RacoonClass.scala 22:46]
    node _GEN_9 = mux(_T_2, _GEN_2, _GEN_8) @[RacoonClass.scala 19:45]
    node _GEN_10 = mux(_T, _GEN_0, _GEN_9) @[RacoonClass.scala 17:36]
    io_action <= state @[RacoonClass.scala 29:13]
    state <= mux(reset, UInt<1>("h0"), _GEN_10) @[RacoonClass.scala 16:{22,22}]
