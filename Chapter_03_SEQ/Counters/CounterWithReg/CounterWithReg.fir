FIRRTL version 1.2.0
circuit CounterWithReg :
  module CounterWithReg :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip en : UInt<1>, out : UInt<3>} @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 5:14]

    reg count : UInt<3>, clock with :
      reset => (UInt<1>("h0"), count) @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 10:18]
    node _NextVal_T = lt(count, UInt<3>("h7")) @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 11:27]
    node _NextVal_T_1 = add(count, UInt<1>("h1")) @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 11:45]
    node _NextVal_T_2 = tail(_NextVal_T_1, 1) @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 11:45]
    node NextVal = mux(_NextVal_T, _NextVal_T_2, UInt<1>("h0")) @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 11:20]
    node applyEn = mux(io.en, NextVal, count) @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 12:20]
    node _count_T = bits(reset, 0, 0) @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 14:22]
    node _count_T_1 = mux(_count_T, UInt<1>("h0"), applyEn) @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 14:15]
    count <= _count_T_1 @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 14:9]
    io.out <= count @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 15:10]

