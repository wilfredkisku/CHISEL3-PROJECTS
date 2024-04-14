circuit InitializedMemory :
  module InitializedMemory :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip writeEnable : UInt<1>, flip writeAddr : UInt<8>, flip writeData : UInt<8>, flip readAddr : UInt<8>, flip readEnable : UInt<1>, readData : UInt<8>}

    smem memory : UInt<8> [256] @[Memory.scala 16:27]
    when io.writeEnable : @[Memory.scala 23:24]
      write mport MPORT = memory[io.writeAddr], clock
      MPORT <= io.writeData
    wire _io_readData_WIRE : UInt @[Memory.scala 26:29]
    _io_readData_WIRE is invalid @[Memory.scala 26:29]
    when io.readEnable : @[Memory.scala 26:29]
      _io_readData_WIRE <= io.readAddr @[Memory.scala 26:29]
      node _io_readData_T = or(_io_readData_WIRE, UInt<8>("h0")) @[Memory.scala 26:29]
      node _io_readData_T_1 = bits(_io_readData_T, 7, 0) @[Memory.scala 26:29]
      read mport io_readData_MPORT = memory[_io_readData_T_1], clock @[Memory.scala 26:29]
    io.readData <= io_readData_MPORT @[Memory.scala 26:15]

