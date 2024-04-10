circuit GlobalBuffer :
  module GlobalBuffer :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip enableA : UInt<1>, flip writeA : UInt<1>, flip addrA : UInt<10>, flip dataInA : UInt<16>, dataOutA : UInt<16>}

    smem mem : UInt<16> [1024] @[GlobalBufferModule.scala 17:24]
    io.dataOutA is invalid @[GlobalBufferModule.scala 19:15]
    when io.enableA : @[GlobalBufferModule.scala 20:20]
      infer mport rdwrPort = mem[io.addrA], clock @[GlobalBufferModule.scala 21:23]
      when io.writeA : @[GlobalBufferModule.scala 22:22]
        rdwrPort <= io.dataInA @[GlobalBufferModule.scala 23:16]
      else :
        io.dataOutA <= rdwrPort @[GlobalBufferModule.scala 25:19]


