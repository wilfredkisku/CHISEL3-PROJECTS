circuit xorClass :
  module xorClass :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip a : UInt<1>, flip b : UInt<1>, c : UInt<1>}

    node _io_c_T = xor(io.a, io.b) @[xorClass.scala 12:16]
    io.c <= _io_c_T @[xorClass.scala 12:8]

