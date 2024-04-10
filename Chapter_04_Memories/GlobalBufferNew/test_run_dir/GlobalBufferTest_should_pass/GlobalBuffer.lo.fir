FIRRTL version 1.1.0
circuit GlobalBuffer :
  module GlobalBuffer :
    input clock : Clock
    input reset : UInt<1>
    input io_enableA : UInt<1>
    input io_writeA : UInt<1>
    input io_addrA : UInt<8>
    input io_dataInA : UInt<8>
    output io_dataOutA : UInt<8>

    mem mem : @[GlobalBufferModule.scala 22:24]
      data-type => UInt<8>
      depth => 256
      read-latency => 1
      write-latency => 1
      readwriter => rdwrPort
      read-under-write => undefined
    node _GEN_0 = validif(io_writeA, io_dataInA) @[GlobalBufferModule.scala 27:{22,33}]
    node _GEN_1 = mux(io_writeA, UInt<1>("h1"), UInt<1>("h0")) @[GlobalBufferModule.scala 27:22 26:23 27:33]
    node _GEN_2 = validif(eq(io_writeA, UInt<1>("h0")), mem.rdwrPort.rdata) @[GlobalBufferModule.scala 27:22 28:35]
    node _GEN_3 = validif(io_enableA, io_addrA) @[GlobalBufferModule.scala 25:20 26:23]
    node _GEN_4 = validif(io_enableA, clock) @[GlobalBufferModule.scala 25:20 26:23]
    node _GEN_5 = mux(io_enableA, UInt<1>("h1"), UInt<1>("h0")) @[GlobalBufferModule.scala 25:20 26:23 22:24]
    node _GEN_6 = validif(io_enableA, _GEN_1) @[GlobalBufferModule.scala 25:20]
    node _GEN_7 = validif(io_enableA, _GEN_0) @[GlobalBufferModule.scala 25:20]
    node _GEN_8 = mux(io_enableA, _GEN_1, UInt<1>("h0")) @[GlobalBufferModule.scala 25:20 22:24]
    node _GEN_9 = validif(io_enableA, _GEN_2) @[GlobalBufferModule.scala 25:20]
    io_dataOutA <= _GEN_9
    mem.rdwrPort.addr <= _GEN_3
    mem.rdwrPort.en <= _GEN_5
    mem.rdwrPort.clk <= _GEN_4
    mem.rdwrPort.wmode <= _GEN_8
    mem.rdwrPort.wdata <= _GEN_7
    mem.rdwrPort.wmask <= _GEN_6
