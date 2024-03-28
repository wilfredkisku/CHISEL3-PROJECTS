FIRRTL version 1.2.0
circuit CounterWithRegInit :
  module CounterWithRegInit :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip en : UInt<1>, out : UInt<5>} @[IdeaProjects/CounterManual/src/main/scala/CounterWithRegInit.scala 5:14]

    reg count : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[IdeaProjects/CounterManual/src/main/scala/CounterWithRegInit.scala 10:22]
    node _nextVal_T = lt(count, UInt<5>("h11")) @[IdeaProjects/CounterManual/src/main/scala/CounterWithRegInit.scala 11:27]
    node _nextVal_T_1 = add(count, UInt<1>("h1")) @[IdeaProjects/CounterManual/src/main/scala/CounterWithRegInit.scala 11:45]
    node _nextVal_T_2 = tail(_nextVal_T_1, 1) @[IdeaProjects/CounterManual/src/main/scala/CounterWithRegInit.scala 11:45]
    node nextVal = mux(_nextVal_T, _nextVal_T_2, UInt<1>("h0")) @[IdeaProjects/CounterManual/src/main/scala/CounterWithRegInit.scala 11:20]
    node _count_T = mux(io.en, nextVal, count) @[IdeaProjects/CounterManual/src/main/scala/CounterWithRegInit.scala 12:15]
    count <= _count_T @[IdeaProjects/CounterManual/src/main/scala/CounterWithRegInit.scala 12:9]
    io.out <= count @[IdeaProjects/CounterManual/src/main/scala/CounterWithRegInit.scala 13:10]

