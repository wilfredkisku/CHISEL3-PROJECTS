circuit fp32Class :
  module fp32Class :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip fpnumA : UInt<32>, flip fpnumB : UInt<32>, fpSum : UInt<32>}

    node fpnumAsign = bits(io.fpnumA, 31, 31) @[fp32Class.scala 13:29]
    node fpnumAexp = bits(io.fpnumA, 30, 23) @[fp32Class.scala 14:28]
    node fpnumAman = bits(io.fpnumA, 22, 0) @[fp32Class.scala 15:28]
    node fpnumBsign = bits(io.fpnumB, 31, 31) @[fp32Class.scala 18:29]
    node fpnumBexp = bits(io.fpnumB, 30, 23) @[fp32Class.scala 19:28]
    node fpnumBman = bits(io.fpnumB, 22, 0) @[fp32Class.scala 20:28]
    wire sum : UInt<32> @[fp32Class.scala 22:17]
    node _sum_T = add(fpnumAman, fpnumBman) @[fp32Class.scala 25:20]
    sum <= _sum_T @[fp32Class.scala 25:7]
    io.fpSum <= sum @[fp32Class.scala 26:12]

