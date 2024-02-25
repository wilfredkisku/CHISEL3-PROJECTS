circuit signedConversion :
  module signedConversion :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip sign : UInt<1>, flip mag : UInt<8>, twos : UInt<9>}

    when io.sign : @[signedConversion.scala 11:18]
      node _io_twos_T = not(io.mag) @[signedConversion.scala 12:25]
      node _io_twos_T_1 = cat(UInt<1>("h1"), _io_twos_T) @[Cat.scala 33:92]
      node _io_twos_T_2 = add(_io_twos_T_1, UInt<1>("h1")) @[signedConversion.scala 12:34]
      io.twos <= _io_twos_T_2 @[signedConversion.scala 12:13]
    else :
      io.twos <= io.mag @[signedConversion.scala 14:13]


