FIRRTL version 1.1.0
circuit SignedAdder :
  module SignedAdder :
    input clock : Clock
    input reset : UInt<1>
    input io_a : SInt<8>
    input io_b : SInt<8>
    output io_sum : SInt<8>
    output io_carryOut : UInt<1>
    output io_overflow : UInt<1>

    node _sum_T = add(io_a, io_b) @[SignedAdder.scala 13:18]
    node _sum_T_1 = tail(_sum_T, 1) @[SignedAdder.scala 13:18]
    node sum = asSInt(_sum_T_1) @[SignedAdder.scala 13:18]
    node carryOut = bits(sum, 7, 7) @[SignedAdder.scala 14:21]
    node _overflow_T = bits(io_a, 7, 7) @[SignedAdder.scala 15:23]
    node _overflow_T_1 = bits(io_b, 7, 7) @[SignedAdder.scala 15:33]
    node _overflow_T_2 = xor(_overflow_T, _overflow_T_1) @[SignedAdder.scala 15:27]
    node _overflow_T_3 = bits(io_a, 7, 7) @[SignedAdder.scala 15:45]
    node _overflow_T_4 = bits(sum, 7, 7) @[SignedAdder.scala 15:54]
    node _overflow_T_5 = xor(_overflow_T_3, _overflow_T_4) @[SignedAdder.scala 15:49]
    node overflow = and(_overflow_T_2, _overflow_T_5) @[SignedAdder.scala 15:38]
    io_sum <= sum @[SignedAdder.scala 17:10]
    io_carryOut <= carryOut @[SignedAdder.scala 18:15]
    io_overflow <= overflow @[SignedAdder.scala 19:15]
