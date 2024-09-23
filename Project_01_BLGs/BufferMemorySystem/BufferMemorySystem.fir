circuit BufferMemorySystem :
  module BufferMemorySystem :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip enable : UInt<1>, flip write : UInt<1>, flip addr : UInt<4>, flip adcValues : UInt<8>[128], dataOut : UInt<8>[128]}

    reg counter : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[BufferMemorySystem.scala 14:24]
    smem mem : UInt<8>[128] [16] @[BufferMemorySystem.scala 16:24]
    node _T = lt(counter, UInt<5>("h10")) @[BufferMemorySystem.scala 18:31]
    node _T_1 = and(io.enable, _T) @[BufferMemorySystem.scala 18:20]
    when _T_1 : @[BufferMemorySystem.scala 18:39]
      node _counter_T = add(counter, UInt<1>("h1")) @[BufferMemorySystem.scala 19:24]
      node _counter_T_1 = tail(_counter_T, 1) @[BufferMemorySystem.scala 19:24]
      counter <= _counter_T_1 @[BufferMemorySystem.scala 19:13]
    write mport MPORT = mem[counter], clock
    MPORT <= io.adcValues
    wire _WIRE : UInt @[BufferMemorySystem.scala 24:25]
    _WIRE is invalid @[BufferMemorySystem.scala 24:25]
    when io.enable : @[BufferMemorySystem.scala 24:25]
      _WIRE <= io.addr @[BufferMemorySystem.scala 24:25]
      node _T_2 = or(_WIRE, UInt<4>("h0")) @[BufferMemorySystem.scala 24:25]
      node _T_3 = bits(_T_2, 3, 0) @[BufferMemorySystem.scala 24:25]
      read mport MPORT_1 = mem[_T_3], clock @[BufferMemorySystem.scala 24:25]
    io.dataOut <= MPORT_1 @[BufferMemorySystem.scala 24:14]

