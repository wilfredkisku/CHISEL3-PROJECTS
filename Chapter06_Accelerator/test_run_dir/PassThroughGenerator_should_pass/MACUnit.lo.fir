FIRRTL version 1.1.0
circuit MACUnit :
  module SignedMultiplier :
    input clock : Clock
    input reset : UInt<1>
    input io_a : SInt<8>
    input io_b : SInt<8>
    output io_product : SInt<16>

    node _io_product_T = mul(io_a, io_b) @[SignedMultipler.scala 10:22]
    io_product <= _io_product_T @[SignedMultipler.scala 10:14]

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

  module MACUnit :
    input clock : Clock
    input reset : UInt<1>
    input io_inputA : SInt<8>
    input io_inputB : SInt<8>
    input io_weight : SInt<8>
    output io_output : SInt<32>

    inst multiplier of SignedMultiplier @[MACUnit.scala 11:26]
    inst adder of SignedAdder @[MACUnit.scala 12:21]
    io_output <= pad(adder.io_sum, 32) @[MACUnit.scala 20:13]
    multiplier.clock <= clock
    multiplier.reset <= reset
    multiplier.io_a <= io_inputA @[MACUnit.scala 14:19]
    multiplier.io_b <= io_weight @[MACUnit.scala 15:19]
    adder.clock <= clock
    adder.reset <= reset
    adder.io_a <= asSInt(bits(multiplier.io_product, 7, 0)) @[MACUnit.scala 17:14]
    adder.io_b <= io_inputB @[MACUnit.scala 18:14]
