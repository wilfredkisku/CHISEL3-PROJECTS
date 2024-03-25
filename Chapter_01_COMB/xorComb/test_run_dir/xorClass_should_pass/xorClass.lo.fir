FIRRTL version 1.1.0
circuit xorClass :
  module xorClass :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<1>
    input io_b : UInt<1>
    output io_c : UInt<1>

    node _io_c_T = xor(io_a, io_b) @[xorClass.scala 12:16]
    io_c <= _io_c_T @[xorClass.scala 12:8]
