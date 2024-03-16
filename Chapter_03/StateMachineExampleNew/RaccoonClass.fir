circuit RaccoonClass :
  module RaccoonClass :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip noise : UInt<1>, flip trash : UInt<1>, flip food : UInt<1>, action : UInt<2>}

    reg state : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[RacoonClass.scala 16:22]
    node _T = eq(state, UInt<1>("h0")) @[RacoonClass.scala 17:15]
    when _T : @[RacoonClass.scala 17:36]
      node _T_1 = eq(io.noise, UInt<1>("h0")) @[RacoonClass.scala 18:11]
      when _T_1 : @[RacoonClass.scala 18:22]
        state <= UInt<1>("h1") @[RacoonClass.scala 18:30]
    else :
      node _T_2 = eq(state, UInt<1>("h1")) @[RacoonClass.scala 19:22]
      when _T_2 : @[RacoonClass.scala 19:45]
        when io.noise : @[RacoonClass.scala 20:21]
          state <= UInt<1>("h0") @[RacoonClass.scala 20:29]
        else :
          when io.trash : @[RacoonClass.scala 21:28]
            state <= UInt<2>("h2") @[RacoonClass.scala 21:36]
      else :
        node _T_3 = eq(state, UInt<2>("h2")) @[RacoonClass.scala 22:22]
        when _T_3 : @[RacoonClass.scala 22:46]
          when io.noise : @[RacoonClass.scala 23:21]
            state <= UInt<1>("h0") @[RacoonClass.scala 23:29]
          else :
            when io.food : @[RacoonClass.scala 24:27]
              state <= UInt<2>("h3") @[RacoonClass.scala 24:35]
        else :
          node _T_4 = eq(state, UInt<2>("h3")) @[RacoonClass.scala 25:22]
          when _T_4 : @[RacoonClass.scala 25:42]
            when io.noise : @[RacoonClass.scala 26:21]
              state <= UInt<1>("h0") @[RacoonClass.scala 26:29]
            else :
              node _T_5 = eq(io.food, UInt<1>("h0")) @[RacoonClass.scala 27:18]
              when _T_5 : @[RacoonClass.scala 27:28]
                state <= UInt<1>("h1") @[RacoonClass.scala 27:36]
    io.action <= state @[RacoonClass.scala 29:13]

