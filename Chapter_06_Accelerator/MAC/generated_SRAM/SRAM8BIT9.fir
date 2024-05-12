circuit SRAM8BIT9 :
  module SRAM8BIT9 :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip addr : UInt<4>, flip dataIn : UInt<8>, dataOut : UInt<8>, flip writeEnable : UInt<1>, flip readEnable : UInt<1>}

    cmem mem : UInt<8> [9] @[SRAM8BIT9.scala 14:16]
    when io.writeEnable : @[SRAM8BIT9.scala 17:24]
      write mport MPORT = mem[io.addr], clock
      MPORT <= io.dataIn
    io.dataOut <= UInt<1>("h0") @[SRAM8BIT9.scala 22:14]
    when io.readEnable : @[SRAM8BIT9.scala 25:23]
      read mport io_dataOut_MPORT = mem[io.addr], clock @[SRAM8BIT9.scala 26:27]
      io.dataOut <= io_dataOut_MPORT @[SRAM8BIT9.scala 26:16]


