circuit MemoryController :
  module MemoryController :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip readEnable : UInt<1>, flip weightAddr : UInt<10>, flip featureMapAddr : UInt<10>, weightDataOut : UInt<8>, featureMapDataOut : UInt<8>, readDone : UInt<1>}

    cmem weightMemory : UInt<8> [1024] @[MemoryController.scala 15:25]
    cmem featureMapMemory : UInt<8> [1024] @[MemoryController.scala 16:29]
    reg state : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[MemoryController.scala 20:22]
    reg weightDataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), weightDataReg) @[MemoryController.scala 23:26]
    reg featureMapDataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), featureMapDataReg) @[MemoryController.scala 24:30]
    io.weightDataOut <= weightDataReg @[MemoryController.scala 27:20]
    io.featureMapDataOut <= featureMapDataReg @[MemoryController.scala 28:24]
    io.readDone <= UInt<1>("h0") @[MemoryController.scala 29:15]
    node _T = eq(UInt<2>("h0"), state) @[MemoryController.scala 31:17]
    when _T : @[MemoryController.scala 31:17]
      when io.readEnable : @[MemoryController.scala 33:27]
        state <= UInt<2>("h1") @[MemoryController.scala 34:15]
    else :
      node _T_1 = eq(UInt<2>("h1"), state) @[MemoryController.scala 31:17]
      when _T_1 : @[MemoryController.scala 31:17]
        read mport weightDataReg_MPORT = weightMemory[io.weightAddr], clock @[MemoryController.scala 38:41]
        weightDataReg <= weightDataReg_MPORT @[MemoryController.scala 38:21]
        state <= UInt<2>("h2") @[MemoryController.scala 39:13]
      else :
        node _T_2 = eq(UInt<2>("h2"), state) @[MemoryController.scala 31:17]
        when _T_2 : @[MemoryController.scala 31:17]
          read mport featureMapDataReg_MPORT = featureMapMemory[io.featureMapAddr], clock @[MemoryController.scala 42:49]
          featureMapDataReg <= featureMapDataReg_MPORT @[MemoryController.scala 42:25]
          state <= UInt<2>("h3") @[MemoryController.scala 43:13]
        else :
          node _T_3 = eq(UInt<2>("h3"), state) @[MemoryController.scala 31:17]
          when _T_3 : @[MemoryController.scala 31:17]
            io.readDone <= UInt<1>("h1") @[MemoryController.scala 46:19]
            node _T_4 = eq(io.readEnable, UInt<1>("h0")) @[MemoryController.scala 47:12]
            when _T_4 : @[MemoryController.scala 47:28]
              state <= UInt<2>("h0") @[MemoryController.scala 48:15]


