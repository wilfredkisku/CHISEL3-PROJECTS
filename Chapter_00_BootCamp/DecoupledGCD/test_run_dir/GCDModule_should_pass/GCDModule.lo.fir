FIRRTL version 1.1.0
circuit GCDModule :
  module GCDModule :
    input clock : Clock
    input reset : UInt<1>
    output input_ready : UInt<1>
    input input_valid : UInt<1>
    input input_bits_value1 : UInt<16>
    input input_bits_value2 : UInt<16>
    input output_ready : UInt<1>
    output output_valid : UInt<1>
    output output_bits_value1 : UInt<16>
    output output_bits_value2 : UInt<16>
    output output_bits_gcd : UInt<16>

    reg xInitial : UInt<16>, clock with :
      reset => (UInt<1>("h0"), xInitial) @[GCDModule.scala 20:21]
    reg yInitial : UInt<16>, clock with :
      reset => (UInt<1>("h0"), yInitial) @[GCDModule.scala 21:21]
    reg x : UInt<16>, clock with :
      reset => (UInt<1>("h0"), x) @[GCDModule.scala 23:24]
    reg y : UInt<16>, clock with :
      reset => (UInt<1>("h0"), y) @[GCDModule.scala 24:24]
    reg busy : UInt<1>, clock with :
      reset => (UInt<1>("h0"), busy) @[GCDModule.scala 25:28]
    reg resultValid : UInt<1>, clock with :
      reset => (UInt<1>("h0"), resultValid) @[GCDModule.scala 26:28]
    node _input_ready_T = eq(busy, UInt<1>("h0")) @[GCDModule.scala 29:18]
    node _T = gt(x, y) @[GCDModule.scala 34:12]
    node _x_T = sub(x, y) @[GCDModule.scala 35:12]
    node _x_T_1 = tail(_x_T, 1) @[GCDModule.scala 35:12]
    node _y_T = sub(y, x) @[GCDModule.scala 37:12]
    node _y_T_1 = tail(_y_T, 1) @[GCDModule.scala 37:12]
    node _GEN_0 = mux(_T, _x_T_1, x) @[GCDModule.scala 34:15 23:24 35:7]
    node _GEN_1 = mux(_T, y, _y_T_1) @[GCDModule.scala 34:15 24:24 37:7]
    node _T_1 = eq(y, UInt<1>("h0")) @[GCDModule.scala 39:12]
    node _busy_T = eq(output_ready, UInt<1>("h0")) @[GCDModule.scala 44:15]
    node _GEN_2 = validif(_T_1, xInitial) @[GCDModule.scala 39:20 40:26]
    node _GEN_3 = validif(_T_1, yInitial) @[GCDModule.scala 39:20 41:26]
    node _GEN_4 = validif(_T_1, x) @[GCDModule.scala 39:20 42:23]
    node _GEN_5 = mux(_T_1, UInt<1>("h1"), resultValid) @[GCDModule.scala 30:16 39:20 43:20]
    node _GEN_6 = mux(_T_1, _busy_T, busy) @[GCDModule.scala 39:20 44:12 25:28]
    node _GEN_7 = mux(input_valid, UInt<1>("h1"), _input_ready_T) @[GCDModule.scala 48:22 Decoupled.scala 82:20 GCDModule.scala 29:15]
    node _GEN_8 = mux(input_valid, input_bits_value1, x) @[GCDModule.scala 48:22 23:24 51:9]
    node _GEN_9 = mux(input_valid, input_bits_value2, y) @[GCDModule.scala 48:22 24:24 52:9]
    node _GEN_10 = mux(input_valid, input_bits_value1, xInitial) @[GCDModule.scala 48:22 53:16 20:21]
    node _GEN_11 = mux(input_valid, input_bits_value2, yInitial) @[GCDModule.scala 48:22 54:16 21:21]
    node _GEN_12 = mux(input_valid, UInt<1>("h1"), busy) @[GCDModule.scala 48:22 55:12 25:28]
    node _GEN_13 = mux(input_valid, UInt<1>("h0"), resultValid) @[GCDModule.scala 48:22 56:19 26:28]
    node _GEN_14 = mux(busy, _GEN_0, _GEN_8) @[GCDModule.scala 33:14]
    node _GEN_15 = mux(busy, _GEN_1, _GEN_9) @[GCDModule.scala 33:14]
    node _GEN_16 = validif(busy, _GEN_2) @[GCDModule.scala 33:14]
    node _GEN_17 = validif(busy, _GEN_3) @[GCDModule.scala 33:14]
    node _GEN_18 = validif(busy, _GEN_4) @[GCDModule.scala 33:14]
    node _GEN_19 = mux(busy, _GEN_5, resultValid) @[GCDModule.scala 33:14 30:16]
    node _GEN_20 = mux(busy, _GEN_6, _GEN_12) @[GCDModule.scala 33:14]
    node _GEN_21 = mux(busy, _input_ready_T, _GEN_7) @[GCDModule.scala 33:14 29:15]
    node _GEN_22 = mux(busy, xInitial, _GEN_10) @[GCDModule.scala 33:14 20:21]
    node _GEN_23 = mux(busy, yInitial, _GEN_11) @[GCDModule.scala 33:14 21:21]
    node _GEN_24 = mux(busy, resultValid, _GEN_13) @[GCDModule.scala 33:14 26:28]
    input_ready <= _GEN_21
    output_valid <= _GEN_19
    output_bits_value1 <= _GEN_16
    output_bits_value2 <= _GEN_17
    output_bits_gcd <= _GEN_18
    xInitial <= _GEN_22
    yInitial <= _GEN_23
    x <= _GEN_14
    y <= _GEN_15
    busy <= mux(reset, UInt<1>("h0"), _GEN_20) @[GCDModule.scala 25:{28,28}]
    resultValid <= mux(reset, UInt<1>("h0"), _GEN_24) @[GCDModule.scala 26:{28,28}]
