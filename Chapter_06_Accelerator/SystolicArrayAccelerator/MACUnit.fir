circuit MACUnit :
  module SignedMultiplier :
    input clock : Clock
    input reset : Reset
    output io : { flip a : SInt<8>, flip b : SInt<8>, product : SInt<16>}

    node _io_product_T = mul(io.a, io.b) @[SignedMultipler.scala 10:22]
    io.product <= _io_product_T @[SignedMultipler.scala 10:14]

  module SignedAdder :
    input clock : Clock
    input reset : Reset
    output io : { flip a : SInt<8>, flip b : SInt<8>, sum : SInt<8>, carryOut : UInt<1>, overflow : UInt<1>}

    node _sum_T = add(io.a, io.b) @[SignedAdder.scala 13:18]
    node _sum_T_1 = tail(_sum_T, 1) @[SignedAdder.scala 13:18]
    node sum = asSInt(_sum_T_1) @[SignedAdder.scala 13:18]
    node carryOut = bits(sum, 7, 7) @[SignedAdder.scala 14:21]
    node _overflow_T = bits(io.a, 7, 7) @[SignedAdder.scala 15:23]
    node _overflow_T_1 = bits(io.b, 7, 7) @[SignedAdder.scala 15:33]
    node _overflow_T_2 = xor(_overflow_T, _overflow_T_1) @[SignedAdder.scala 15:27]
    node _overflow_T_3 = bits(io.a, 7, 7) @[SignedAdder.scala 15:45]
    node _overflow_T_4 = bits(sum, 7, 7) @[SignedAdder.scala 15:54]
    node _overflow_T_5 = xor(_overflow_T_3, _overflow_T_4) @[SignedAdder.scala 15:49]
    node overflow = and(_overflow_T_2, _overflow_T_5) @[SignedAdder.scala 15:38]
    io.sum <= sum @[SignedAdder.scala 17:10]
    io.carryOut <= carryOut @[SignedAdder.scala 18:15]
    io.overflow <= overflow @[SignedAdder.scala 19:15]

  module MACUnit :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip inputA : SInt<8>, flip inputB : SInt<8>, flip weight : SInt<8>, output : SInt<16>}

    inst multiplier of SignedMultiplier @[MACUnit.scala 11:26]
    multiplier.clock <= clock
    multiplier.reset <= reset
    inst adder of SignedAdder @[MACUnit.scala 12:21]
    adder.clock <= clock
    adder.reset <= reset
    multiplier.io.a <= io.inputA @[MACUnit.scala 14:19]
    multiplier.io.b <= io.weight @[MACUnit.scala 15:19]
    adder.io.a <= multiplier.io.product @[MACUnit.scala 17:14]
    adder.io.b <= io.inputB @[MACUnit.scala 18:14]
    io.output <= adder.io.sum @[MACUnit.scala 20:13]

