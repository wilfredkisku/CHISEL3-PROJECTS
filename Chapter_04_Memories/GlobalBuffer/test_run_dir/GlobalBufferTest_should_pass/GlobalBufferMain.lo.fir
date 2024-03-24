FIRRTL version 1.1.0
circuit GlobalBufferMain :
  module GlobalBuffer :
    input clock : Clock
    input reset : UInt<1>
    input io_dataIn : UInt<8>
    input io_writeEnable : UInt<1>
    input io_address : UInt<18>
    output io_dataOut : UInt<8>

    mem mem : @[GlobalBufferMain.scala 15:16]
      data-type => UInt<8>
      depth => 262144
      read-latency => 0
      write-latency => 1
      reader => io_dataOut_MPORT
      writer => MPORT
      read-under-write => undefined
    reg io_dataOut_REG : UInt<8>, clock with :
      reset => (UInt<1>("h0"), io_dataOut_REG) @[GlobalBufferMain.scala 18:24]
    node _GEN_0 = validif(io_writeEnable, io_address) @[GlobalBufferMain.scala 21:24 22:8]
    node _GEN_1 = validif(io_writeEnable, clock) @[GlobalBufferMain.scala 21:24 22:8]
    node _GEN_2 = mux(io_writeEnable, UInt<1>("h1"), UInt<1>("h0")) @[GlobalBufferMain.scala 15:16 21:24 22:8]
    node _GEN_3 = validif(io_writeEnable, UInt<1>("h1")) @[GlobalBufferMain.scala 21:24 22:21]
    node _GEN_4 = validif(io_writeEnable, io_dataIn) @[GlobalBufferMain.scala 21:24 22:21]
    io_dataOut <= io_dataOut_REG @[GlobalBufferMain.scala 18:14]
    mem.io_dataOut_MPORT.addr <= io_address @[GlobalBufferMain.scala 18:28]
    mem.io_dataOut_MPORT.en <= UInt<1>("h1") @[GlobalBufferMain.scala 18:28]
    mem.io_dataOut_MPORT.clk <= clock @[GlobalBufferMain.scala 18:28]
    mem.MPORT.addr <= _GEN_0
    mem.MPORT.en <= _GEN_2
    mem.MPORT.clk <= _GEN_1
    mem.MPORT.data <= _GEN_4
    mem.MPORT.mask <= _GEN_3
    io_dataOut_REG <= mem.io_dataOut_MPORT.data @[GlobalBufferMain.scala 18:24]

  module GlobalBufferMain :
    input clock : Clock
    input reset : UInt<1>
    input io_dataIn : UInt<8>
    input io_writeEnable : UInt<1>
    input io_address : UInt<18>
    output io_dataOut : UInt<8>

    inst globalBuffer of GlobalBuffer @[GlobalBufferMain.scala 35:28]
    io_dataOut <= globalBuffer.io_dataOut @[GlobalBufferMain.scala 40:14]
    globalBuffer.clock <= clock
    globalBuffer.reset <= reset
    globalBuffer.io_dataIn <= io_dataIn @[GlobalBufferMain.scala 37:26]
    globalBuffer.io_writeEnable <= io_writeEnable @[GlobalBufferMain.scala 38:31]
    globalBuffer.io_address <= io_address @[GlobalBufferMain.scala 39:27]
