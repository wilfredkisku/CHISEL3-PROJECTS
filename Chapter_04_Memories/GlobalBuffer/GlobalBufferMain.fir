circuit GlobalBufferMain :
  module GlobalBuffer :
    input clock : Clock
    input reset : Reset
    output io : { flip dataIn : UInt<8>, flip writeEnable : UInt<1>, flip address : UInt<18>, dataOut : UInt<8>}

    cmem mem : UInt<8> [262144] @[GlobalBufferMain.scala 15:16]
    infer mport io_dataOut_MPORT = mem[io.address], clock @[GlobalBufferMain.scala 18:28]
    reg io_dataOut_REG : UInt, clock with :
      reset => (UInt<1>("h0"), io_dataOut_REG) @[GlobalBufferMain.scala 18:24]
    io_dataOut_REG <= io_dataOut_MPORT @[GlobalBufferMain.scala 18:24]
    io.dataOut <= io_dataOut_REG @[GlobalBufferMain.scala 18:14]
    when io.writeEnable : @[GlobalBufferMain.scala 21:24]
      infer mport MPORT = mem[io.address], clock @[GlobalBufferMain.scala 22:8]
      MPORT <= io.dataIn @[GlobalBufferMain.scala 22:21]


  module GlobalBufferMain :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip dataIn : UInt<8>, flip writeEnable : UInt<1>, flip address : UInt<18>, dataOut : UInt<8>}

    inst globalBuffer of GlobalBuffer @[GlobalBufferMain.scala 35:28]
    globalBuffer.clock <= clock
    globalBuffer.reset <= reset
    globalBuffer.io.dataIn <= io.dataIn @[GlobalBufferMain.scala 37:26]
    globalBuffer.io.writeEnable <= io.writeEnable @[GlobalBufferMain.scala 38:31]
    globalBuffer.io.address <= io.address @[GlobalBufferMain.scala 39:27]
    io.dataOut <= globalBuffer.io.dataOut @[GlobalBufferMain.scala 40:14]

