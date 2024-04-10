FIRRTL version 1.1.0
circuit GlobalBufferDPModule :
  module GlobalBufferDPModule :
    input clock : Clock
    input reset : UInt<1>
    input io_rdWrPortA_enableA : UInt<1>
    input io_rdWrPortA_writeA : UInt<1>
    input io_rdWrPortA_addrA : UInt<10>
    input io_rdWrPortA_dataInA : UInt<16>
    output io_rdWrPortA_dataOutA : UInt<16>
    input io_rdWrPortB_enableB : UInt<1>
    input io_rdWrPortB_writeB : UInt<1>
    input io_rdWrPortB_addrB : UInt<10>
    input io_rdWrPortB_dataInB : UInt<16>
    output io_rdWrPortB_dataOutB : UInt<16>

    mem mem : @[GlobalBufferDPModule.scala 24:24]
      data-type => UInt<16>
      depth => 1024
      read-latency => 1
      write-latency => 1
      readwriter => rdwrPortB
      readwriter => rdwrPortA
      read-under-write => undefined
    node _GEN_0 = validif(io_rdWrPortB_writeB, io_rdWrPortB_dataInB) @[GlobalBufferDPModule.scala 31:32 32:17]
    node _GEN_1 = mux(io_rdWrPortB_writeB, UInt<1>("h1"), UInt<1>("h0")) @[GlobalBufferDPModule.scala 31:32 32:17 30:24]
    node _GEN_2 = validif(eq(io_rdWrPortB_writeB, UInt<1>("h0")), mem.rdwrPortB.rdata) @[GlobalBufferDPModule.scala 31:32 34:29]
    node _GEN_3 = validif(io_rdWrPortB_enableB, io_rdWrPortB_addrB) @[GlobalBufferDPModule.scala 29:30 30:24]
    node _GEN_4 = validif(io_rdWrPortB_enableB, clock) @[GlobalBufferDPModule.scala 29:30 30:24]
    node _GEN_5 = mux(io_rdWrPortB_enableB, UInt<1>("h1"), UInt<1>("h0")) @[GlobalBufferDPModule.scala 24:24 29:30 30:24]
    node _GEN_6 = validif(io_rdWrPortB_enableB, _GEN_1) @[GlobalBufferDPModule.scala 29:30]
    node _GEN_7 = validif(io_rdWrPortB_enableB, _GEN_0) @[GlobalBufferDPModule.scala 29:30]
    node _GEN_8 = mux(io_rdWrPortB_enableB, _GEN_1, UInt<1>("h0")) @[GlobalBufferDPModule.scala 24:24 29:30]
    node _GEN_9 = validif(io_rdWrPortB_enableB, _GEN_2) @[GlobalBufferDPModule.scala 29:30]
    node _GEN_10 = validif(io_rdWrPortA_writeA, io_rdWrPortA_dataInA) @[GlobalBufferDPModule.scala 40:32 41:17]
    node _GEN_11 = mux(io_rdWrPortA_writeA, UInt<1>("h1"), UInt<1>("h0")) @[GlobalBufferDPModule.scala 40:32 41:17 39:24]
    node _GEN_12 = validif(eq(io_rdWrPortA_writeA, UInt<1>("h0")), mem.rdwrPortA.rdata) @[GlobalBufferDPModule.scala 40:32 43:29]
    node _GEN_13 = validif(io_rdWrPortA_enableA, io_rdWrPortA_addrA) @[GlobalBufferDPModule.scala 38:30 39:24]
    node _GEN_14 = validif(io_rdWrPortA_enableA, clock) @[GlobalBufferDPModule.scala 38:30 39:24]
    node _GEN_15 = mux(io_rdWrPortA_enableA, UInt<1>("h1"), UInt<1>("h0")) @[GlobalBufferDPModule.scala 24:24 38:30 39:24]
    node _GEN_16 = validif(io_rdWrPortA_enableA, _GEN_11) @[GlobalBufferDPModule.scala 38:30]
    node _GEN_17 = validif(io_rdWrPortA_enableA, _GEN_10) @[GlobalBufferDPModule.scala 38:30]
    node _GEN_18 = mux(io_rdWrPortA_enableA, _GEN_11, UInt<1>("h0")) @[GlobalBufferDPModule.scala 24:24 38:30]
    node _GEN_19 = validif(io_rdWrPortA_enableA, _GEN_12) @[GlobalBufferDPModule.scala 38:30]
    io_rdWrPortA_dataOutA <= _GEN_19
    io_rdWrPortB_dataOutB <= _GEN_9
    mem.rdwrPortB.addr <= _GEN_3
    mem.rdwrPortB.en <= _GEN_5
    mem.rdwrPortB.clk <= _GEN_4
    mem.rdwrPortB.wmode <= _GEN_8
    mem.rdwrPortB.wdata <= _GEN_7
    mem.rdwrPortB.wmask <= _GEN_6
    mem.rdwrPortA.addr <= _GEN_13
    mem.rdwrPortA.en <= _GEN_15
    mem.rdwrPortA.clk <= _GEN_14
    mem.rdwrPortA.wmode <= _GEN_18
    mem.rdwrPortA.wdata <= _GEN_17
    mem.rdwrPortA.wmask <= _GEN_16
