circuit GlobalBuffer :
  module GlobalBuffer :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip writeEnable : UInt<1>, flip readEnable : UInt<1>, flip writeAddr : UInt<10>, flip readAddr : UInt<10>, flip writeData : UInt<8>, readData : UInt<8>}

    smem memory : UInt<8> [1024] @[GlobalBuffer.scala 15:27]
    when io.writeEnable : @[GlobalBuffer.scala 17:24]
      write mport MPORT = memory[io.writeAddr], clock
      MPORT <= io.writeData
    io.readData is invalid @[GlobalBuffer.scala 21:15]
    when io.readEnable : @[GlobalBuffer.scala 22:23]
      wire _io_readData_WIRE : UInt @[GlobalBuffer.scala 23:31]
      _io_readData_WIRE is invalid @[GlobalBuffer.scala 23:31]
      when io.readEnable : @[GlobalBuffer.scala 23:31]
        _io_readData_WIRE <= io.readAddr @[GlobalBuffer.scala 23:31]
        node _io_readData_T = or(_io_readData_WIRE, UInt<10>("h0")) @[GlobalBuffer.scala 23:31]
        node _io_readData_T_1 = bits(_io_readData_T, 9, 0) @[GlobalBuffer.scala 23:31]
        read mport io_readData_MPORT = memory[_io_readData_T_1], clock @[GlobalBuffer.scala 23:31]
      io.readData <= io_readData_MPORT @[GlobalBuffer.scala 23:17]


