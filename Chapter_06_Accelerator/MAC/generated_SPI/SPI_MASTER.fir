circuit SPI_MASTER :
  module SPI_MASTER :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip start : UInt<1>, flip masterData : UInt<8>, flip miso : UInt<1>, mosi : UInt<1>, sclk : UInt<1>, cs : UInt<1>}

    reg state : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[SPI_MASTER.scala 16:22]
    reg bitCounter : UInt<3>, clock with :
      reset => (reset, UInt<3>("h0")) @[SPI_MASTER.scala 17:27]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[SPI_MASTER.scala 18:20]
    reg sclkReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[SPI_MASTER.scala 19:24]
    io.cs <= UInt<1>("h1") @[SPI_MASTER.scala 21:9]
    node _io_mosi_T = bits(dataReg, 7, 7) @[SPI_MASTER.scala 22:21]
    io.mosi <= _io_mosi_T @[SPI_MASTER.scala 22:11]
    node _io_sclk_T = asUInt(clock) @[SPI_MASTER.scala 24:26]
    node _io_sclk_T_1 = bits(_io_sclk_T, 0, 0) @[SPI_MASTER.scala 24:26]
    node _io_sclk_T_2 = dshr(_io_sclk_T_1, UInt<1>("h0")) @[SPI_MASTER.scala 24:28]
    node _io_sclk_T_3 = bits(_io_sclk_T_2, 0, 0) @[SPI_MASTER.scala 24:28]
    io.sclk <= _io_sclk_T_3 @[SPI_MASTER.scala 24:11]
    node _T = eq(UInt<1>("h0"), state) @[SPI_MASTER.scala 26:17]
    when _T : @[SPI_MASTER.scala 26:17]
      when io.start : @[SPI_MASTER.scala 28:22]
        dataReg <= io.masterData @[SPI_MASTER.scala 29:17]
        state <= UInt<1>("h1") @[SPI_MASTER.scala 30:15]
        io.cs <= UInt<1>("h0") @[SPI_MASTER.scala 31:15]
        bitCounter <= UInt<1>("h0") @[SPI_MASTER.scala 32:20]
    else :
      node _T_1 = eq(UInt<1>("h1"), state) @[SPI_MASTER.scala 26:17]
      when _T_1 : @[SPI_MASTER.scala 26:17]
        node _T_2 = eq(bitCounter, UInt<3>("h7")) @[SPI_MASTER.scala 36:23]
        when _T_2 : @[SPI_MASTER.scala 36:32]
          state <= UInt<1>("h0") @[SPI_MASTER.scala 37:15]
          io.cs <= UInt<1>("h1") @[SPI_MASTER.scala 38:15]
        else :
          node _sclkReg_T = eq(sclkReg, UInt<1>("h0")) @[SPI_MASTER.scala 40:20]
          sclkReg <= _sclkReg_T @[SPI_MASTER.scala 40:17]
          when sclkReg : @[SPI_MASTER.scala 41:23]
            node _dataReg_T = bits(dataReg, 6, 0) @[SPI_MASTER.scala 42:33]
            node _dataReg_T_1 = cat(_dataReg_T, io.miso) @[Cat.scala 33:92]
            dataReg <= _dataReg_T_1 @[SPI_MASTER.scala 42:19]
            node _bitCounter_T = add(bitCounter, UInt<1>("h1")) @[SPI_MASTER.scala 43:36]
            node _bitCounter_T_1 = tail(_bitCounter_T, 1) @[SPI_MASTER.scala 43:36]
            bitCounter <= _bitCounter_T_1 @[SPI_MASTER.scala 43:22]


