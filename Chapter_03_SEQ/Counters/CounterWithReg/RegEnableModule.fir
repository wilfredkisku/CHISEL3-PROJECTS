FIRRTL version 1.2.0
circuit RegEnableModule :
  module RegEnableModule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip en : UInt<1>, out : UInt<3>} @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 6:14]

    node _io_out_T = lt(io.out, UInt<3>("h7")) @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 11:34]
    node _io_out_T_1 = add(io.out, UInt<1>("h1")) @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 11:53]
    node _io_out_T_2 = tail(_io_out_T_1, 1) @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 11:53]
    node _io_out_T_3 = mux(_io_out_T, _io_out_T_2, UInt<1>("h0")) @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 11:26]
    reg io_out_r : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 11:22]
    when io.en : @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 11:22]
      io_out_r <= _io_out_T_3 @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 11:22]
    io.out <= io_out_r @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 11:10]

