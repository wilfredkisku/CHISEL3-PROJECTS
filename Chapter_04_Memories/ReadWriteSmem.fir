FIRRTL version 1.2.0
circuit ReadWriteSmem :
  module ReadWriteSmem :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip enable : UInt<1>, flip write : UInt<1>, flip addr : UInt<10>, flip dataIn : UInt<32>, dataOut : UInt<32>} @[IdeaProjects/MermoriesExample/src/main/scala/ReadWriteSmem.scala 6:14]

    smem mem : UInt<32> [1024] @[IdeaProjects/MermoriesExample/src/main/scala/ReadWriteSmem.scala 14:24]
    write mport MPORT = mem[io.addr], clock
    MPORT <= io.dataIn
    wire _io_dataOut_WIRE : UInt @[IdeaProjects/MermoriesExample/src/main/scala/ReadWriteSmem.scala 17:25]
    _io_dataOut_WIRE is invalid @[IdeaProjects/MermoriesExample/src/main/scala/ReadWriteSmem.scala 17:25]
    when io.enable : @[IdeaProjects/MermoriesExample/src/main/scala/ReadWriteSmem.scala 17:25]
      _io_dataOut_WIRE <= io.addr @[IdeaProjects/MermoriesExample/src/main/scala/ReadWriteSmem.scala 17:25]
      node _io_dataOut_T = or(_io_dataOut_WIRE, UInt<10>("h0")) @[IdeaProjects/MermoriesExample/src/main/scala/ReadWriteSmem.scala 17:25]
      node _io_dataOut_T_1 = bits(_io_dataOut_T, 9, 0) @[IdeaProjects/MermoriesExample/src/main/scala/ReadWriteSmem.scala 17:25]
      read mport io_dataOut_MPORT = mem[_io_dataOut_T_1], clock @[IdeaProjects/MermoriesExample/src/main/scala/ReadWriteSmem.scala 17:25]
    io.dataOut <= io_dataOut_MPORT @[IdeaProjects/MermoriesExample/src/main/scala/ReadWriteSmem.scala 17:14]

