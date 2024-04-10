FIRRTL version 1.1.0
circuit GlobalBuffer :
  module GlobalBuffer :
    input clock : Clock
    input reset : UInt<1>
    input io_enableA : UInt<1>
    input io_writeA : UInt<1>
    input io_addrA : UInt<10>
    input io_dataInA : UInt<16>
    output io_dataOutA : UInt<16>

    mem mem : @[GlobalBufferModule.scala 17:24]
      data-type => UInt<16>
      depth => 1024
      read-latency => 1
      write-latency => 1
      readwriter => rdwrPort
      read-under-write => undefined
    node _GEN_0 = validif(io_writeA, io_dataInA) @[GlobalBufferModule.scala 22:22 23:16]
    node _GEN_1 = mux(io_writeA, UInt<1>("h1"), UInt<1>("h0")) @[GlobalBufferModule.scala 22:22 23:16 21:23]
    node _GEN_2 = validif(eq(io_writeA, UInt<1>("h0")), mem.rdwrPort.rdata) @[GlobalBufferModule.scala 22:22 25:19]
    node _GEN_3 = validif(io_enableA, io_addrA) @[GlobalBufferModule.scala 20:20 21:23]
    node _GEN_4 = validif(io_enableA, clock) @[GlobalBufferModule.scala 20:20 21:23]
    node _GEN_5 = mux(io_enableA, UInt<1>("h1"), UInt<1>("h0")) @[GlobalBufferModule.scala 20:20 21:23 17:24]
    node _GEN_6 = validif(io_enableA, _GEN_1) @[GlobalBufferModule.scala 20:20]
    node _GEN_7 = validif(io_enableA, _GEN_0) @[GlobalBufferModule.scala 20:20]
    node _GEN_8 = mux(io_enableA, _GEN_1, UInt<1>("h0")) @[GlobalBufferModule.scala 20:20 17:24]
    node _GEN_9 = validif(io_enableA, _GEN_2) @[GlobalBufferModule.scala 20:20]
    io_dataOutA <= _GEN_9
    mem.rdwrPort.addr <= _GEN_3
    mem.rdwrPort.en <= _GEN_5
    mem.rdwrPort.clk <= _GEN_4
    mem.rdwrPort.wmode <= _GEN_8
    mem.rdwrPort.wdata <= _GEN_7
    mem.rdwrPort.wmask <= _GEN_6
