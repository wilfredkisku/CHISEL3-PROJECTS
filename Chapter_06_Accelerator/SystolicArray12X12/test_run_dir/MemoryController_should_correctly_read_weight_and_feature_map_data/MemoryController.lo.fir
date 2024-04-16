FIRRTL version 1.1.0
circuit MemoryController :
  module MemoryController :
    input clock : Clock
    input reset : UInt<1>
    input io_readEnable : UInt<1>
    input io_weightAddr : UInt<10>
    input io_featureMapAddr : UInt<10>
    output io_weightDataOut : UInt<8>
    output io_featureMapDataOut : UInt<8>
    output io_readDone : UInt<1>

    mem weightMemory : @[MemoryController.scala 15:25]
      data-type => UInt<8>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => weightDataReg_MPORT
      read-under-write => undefined
    mem featureMapMemory : @[MemoryController.scala 16:29]
      data-type => UInt<8>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => featureMapDataReg_MPORT
      read-under-write => undefined
    reg state : UInt<2>, clock with :
      reset => (UInt<1>("h0"), state) @[MemoryController.scala 20:22]
    reg weightDataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), weightDataReg) @[MemoryController.scala 23:26]
    reg featureMapDataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), featureMapDataReg) @[MemoryController.scala 24:30]
    node _T = eq(UInt<2>("h0"), state) @[MemoryController.scala 31:17]
    node _GEN_0 = mux(io_readEnable, UInt<2>("h1"), state) @[MemoryController.scala 33:27 34:15 20:22]
    node _T_1 = eq(UInt<2>("h1"), state) @[MemoryController.scala 31:17]
    node _T_2 = eq(UInt<2>("h2"), state) @[MemoryController.scala 31:17]
    node _T_3 = eq(UInt<2>("h3"), state) @[MemoryController.scala 31:17]
    node _T_4 = eq(io_readEnable, UInt<1>("h0")) @[MemoryController.scala 47:12]
    node _GEN_1 = mux(_T_4, UInt<2>("h0"), state) @[MemoryController.scala 47:28 48:15 20:22]
    node _GEN_2 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 29:15 31:17 46:19]
    node _GEN_3 = mux(_T_3, _GEN_1, state) @[MemoryController.scala 31:17 20:22]
    node _GEN_4 = validif(_T_2, io_featureMapAddr) @[MemoryController.scala 31:17 42:49]
    node _GEN_5 = validif(_T_2, clock) @[MemoryController.scala 31:17 42:49]
    node _GEN_6 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 31:17 16:29 42:49]
    node _GEN_7 = mux(_T_2, featureMapMemory.featureMapDataReg_MPORT.data, featureMapDataReg) @[MemoryController.scala 31:17 42:25 24:30]
    node _GEN_8 = mux(_T_2, UInt<2>("h3"), _GEN_3) @[MemoryController.scala 31:17 43:13]
    node _GEN_9 = mux(_T_2, UInt<1>("h0"), _GEN_2) @[MemoryController.scala 29:15 31:17]
    node _GEN_10 = validif(_T_1, io_weightAddr) @[MemoryController.scala 31:17 38:41]
    node _GEN_11 = validif(_T_1, clock) @[MemoryController.scala 31:17 38:41]
    node _GEN_12 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[MemoryController.scala 31:17 15:25 38:41]
    node _GEN_13 = mux(_T_1, weightMemory.weightDataReg_MPORT.data, weightDataReg) @[MemoryController.scala 31:17 38:21 23:26]
    node _GEN_14 = mux(_T_1, UInt<2>("h2"), _GEN_8) @[MemoryController.scala 31:17 39:13]
    node _GEN_15 = validif(eq(_T_1, UInt<1>("h0")), _GEN_4) @[MemoryController.scala 31:17]
    node _GEN_16 = validif(eq(_T_1, UInt<1>("h0")), _GEN_5) @[MemoryController.scala 31:17]
    node _GEN_17 = mux(_T_1, UInt<1>("h0"), _GEN_6) @[MemoryController.scala 31:17 16:29]
    node _GEN_18 = mux(_T_1, featureMapDataReg, _GEN_7) @[MemoryController.scala 31:17 24:30]
    node _GEN_19 = mux(_T_1, UInt<1>("h0"), _GEN_9) @[MemoryController.scala 29:15 31:17]
    node _GEN_20 = mux(_T, _GEN_0, _GEN_14) @[MemoryController.scala 31:17]
    node _GEN_21 = validif(eq(_T, UInt<1>("h0")), _GEN_10) @[MemoryController.scala 31:17]
    node _GEN_22 = validif(eq(_T, UInt<1>("h0")), _GEN_11) @[MemoryController.scala 31:17]
    node _GEN_23 = mux(_T, UInt<1>("h0"), _GEN_12) @[MemoryController.scala 31:17 15:25]
    node _GEN_24 = mux(_T, weightDataReg, _GEN_13) @[MemoryController.scala 31:17 23:26]
    node _GEN_25 = validif(eq(_T, UInt<1>("h0")), _GEN_15) @[MemoryController.scala 31:17]
    node _GEN_26 = validif(eq(_T, UInt<1>("h0")), _GEN_16) @[MemoryController.scala 31:17]
    node _GEN_27 = mux(_T, UInt<1>("h0"), _GEN_17) @[MemoryController.scala 31:17 16:29]
    node _GEN_28 = mux(_T, featureMapDataReg, _GEN_18) @[MemoryController.scala 31:17 24:30]
    node _GEN_29 = mux(_T, UInt<1>("h0"), _GEN_19) @[MemoryController.scala 29:15 31:17]
    io_weightDataOut <= weightDataReg @[MemoryController.scala 27:20]
    io_featureMapDataOut <= featureMapDataReg @[MemoryController.scala 28:24]
    io_readDone <= _GEN_29
    weightMemory.weightDataReg_MPORT.addr <= _GEN_21
    weightMemory.weightDataReg_MPORT.en <= _GEN_23
    weightMemory.weightDataReg_MPORT.clk <= _GEN_22
    featureMapMemory.featureMapDataReg_MPORT.addr <= _GEN_25
    featureMapMemory.featureMapDataReg_MPORT.en <= _GEN_27
    featureMapMemory.featureMapDataReg_MPORT.clk <= _GEN_26
    state <= mux(reset, UInt<2>("h0"), _GEN_20) @[MemoryController.scala 20:{22,22}]
    weightDataReg <= _GEN_24
    featureMapDataReg <= _GEN_28
