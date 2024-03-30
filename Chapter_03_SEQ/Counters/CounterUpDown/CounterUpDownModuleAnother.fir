FIRRTL version 1.2.0
circuit CounterUpDownModuleAnother :
  module CounterUpDownModuleAnother :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip en : UInt<1>, flip upDown : UInt<1>, out : UInt<3>} @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 6:14]

    reg count : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 12:22]
    node _nextValUp_T = lt(count, UInt<3>("h7")) @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 13:29]
    node _nextValUp_T_1 = add(count, UInt<1>("h1")) @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 13:47]
    node _nextValUp_T_2 = tail(_nextValUp_T_1, 1) @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 13:47]
    node nextValUp = mux(_nextValUp_T, _nextValUp_T_2, UInt<1>("h0")) @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 13:22]
    node _nextValDown_T = gt(count, UInt<1>("h0")) @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 14:31]
    node _nextValDown_T_1 = sub(count, UInt<1>("h1")) @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 14:44]
    node _nextValDown_T_2 = tail(_nextValDown_T_1, 1) @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 14:44]
    node nextValDown = mux(_nextValDown_T, _nextValDown_T_2, UInt<3>("h7")) @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 14:24]
    node _count_T = and(io.en, io.upDown) @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 16:22]
    node _count_T_1 = mux(_count_T, nextValUp, nextValDown) @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 16:15]
    count <= _count_T_1 @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 16:9]
    io.out <= count @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 25:10]

