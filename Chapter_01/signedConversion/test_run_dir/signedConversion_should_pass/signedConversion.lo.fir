FIRRTL version 1.1.0
circuit signedConversion :
  module signedConversion :
    input clock : Clock
    input reset : UInt<1>
    input io_sign : UInt<1>
    input io_mag : UInt<8>
    output io_twos : UInt<9>

    node _io_twos_T = not(io_mag) @[signedConversion.scala 12:25]
    node _io_twos_T_1 = cat(UInt<1>("h1"), _io_twos_T) @[Cat.scala 33:92]
    node _io_twos_T_2 = add(_io_twos_T_1, UInt<1>("h1")) @[signedConversion.scala 12:34]
    node _GEN_0 = mux(io_sign, _io_twos_T_2, io_mag) @[signedConversion.scala 11:18 12:13 14:13]
    io_twos <= bits(_GEN_0, 8, 0)
