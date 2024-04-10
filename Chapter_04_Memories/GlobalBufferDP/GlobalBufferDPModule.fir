circuit GlobalBufferDPModule :
  module GlobalBufferDPModule :
    input clock : Clock
    input reset : UInt<1>
    output io : { rdWrPortA : { flip enableA : UInt<1>, flip writeA : UInt<1>, flip addrA : UInt<10>, flip dataInA : UInt<8>, dataOutA : UInt<8>}, rdWrPortB : { flip enableB : UInt<1>, flip writeB : UInt<1>, flip addrB : UInt<10>, flip dataInB : UInt<8>, dataOutB : UInt<8>}}

    smem mem : UInt<8> [1024] @[GlobalBufferDPModule.scala 24:24]
    io.rdWrPortA.dataOutA is invalid @[GlobalBufferDPModule.scala 26:25]
    io.rdWrPortB.dataOutB is invalid @[GlobalBufferDPModule.scala 27:25]
    when io.rdWrPortB.enableB : @[GlobalBufferDPModule.scala 29:30]
      infer mport rdwrPortB = mem[io.rdWrPortB.addrB], clock @[GlobalBufferDPModule.scala 30:24]
      when io.rdWrPortB.writeB : @[GlobalBufferDPModule.scala 31:32]
        rdwrPortB <= io.rdWrPortB.dataInB @[GlobalBufferDPModule.scala 32:17]
      else :
        io.rdWrPortB.dataOutB <= rdwrPortB @[GlobalBufferDPModule.scala 34:29]
    when io.rdWrPortA.enableA : @[GlobalBufferDPModule.scala 38:30]
      infer mport rdwrPortA = mem[io.rdWrPortA.addrA], clock @[GlobalBufferDPModule.scala 39:24]
      when io.rdWrPortA.writeA : @[GlobalBufferDPModule.scala 40:32]
        rdwrPortA <= io.rdWrPortA.dataInA @[GlobalBufferDPModule.scala 41:17]
      else :
        io.rdWrPortA.dataOutA <= rdwrPortA @[GlobalBufferDPModule.scala 43:29]


