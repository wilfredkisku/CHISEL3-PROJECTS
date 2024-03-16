FIRRTL version 1.2.0
circuit RomModule :
  module RomModule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip address : UInt<8>, dataOut : UInt<32>} @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 4:14]

    wire rom : UInt<25>[6] @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 24:20]
    rom[0] <= UInt<1>("h0") @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 24:20]
    rom[1] <= UInt<17>("h10000") @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 24:20]
    rom[2] <= UInt<17>("h10010") @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 24:20]
    rom[3] <= UInt<25>("h1010100") @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 24:20]
    rom[4] <= UInt<25>("h1010110") @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 24:20]
    rom[5] <= UInt<17>("h10011") @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 24:20]
    node _io_dataOut_T = bits(io.address, 2, 0)
    io.dataOut <= rom[_io_dataOut_T] @[IdeaProjects/MermoriesExample/src/main/scala/RomModule.scala 27:14]

