circuit GCDModule :
  module GCDModule :
    input clock : Clock
    input reset : UInt<1>
    input input : { flip ready : UInt<1>, valid : UInt<1>, bits : { value1 : UInt<8>, value2 : UInt<8>}}
    output output : { flip ready : UInt<1>, valid : UInt<1>, bits : { value1 : UInt<8>, value2 : UInt<8>, gcd : UInt<8>}}

    reg xInitial : UInt, clock with :
      reset => (UInt<1>("h0"), xInitial) @[GCDModule.scala 20:21]
    reg yInitial : UInt, clock with :
      reset => (UInt<1>("h0"), yInitial) @[GCDModule.scala 21:21]
    reg x : UInt, clock with :
      reset => (UInt<1>("h0"), x) @[GCDModule.scala 23:24]
    reg y : UInt, clock with :
      reset => (UInt<1>("h0"), y) @[GCDModule.scala 24:24]
    reg busy : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[GCDModule.scala 25:28]
    reg resultValid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[GCDModule.scala 26:28]
    node _input_ready_T = eq(busy, UInt<1>("h0")) @[GCDModule.scala 29:18]
    input.ready <= _input_ready_T @[GCDModule.scala 29:15]
    output.valid <= resultValid @[GCDModule.scala 30:16]
    output.bits.gcd is invalid @[GCDModule.scala 31:15]
    output.bits.value2 is invalid @[GCDModule.scala 31:15]
    output.bits.value1 is invalid @[GCDModule.scala 31:15]
    when busy : @[GCDModule.scala 33:14]
      node _T = gt(x, y) @[GCDModule.scala 34:12]
      when _T : @[GCDModule.scala 34:15]
        node _x_T = sub(x, y) @[GCDModule.scala 35:12]
        node _x_T_1 = tail(_x_T, 1) @[GCDModule.scala 35:12]
        x <= _x_T_1 @[GCDModule.scala 35:7]
      else :
        node _y_T = sub(y, x) @[GCDModule.scala 37:12]
        node _y_T_1 = tail(_y_T, 1) @[GCDModule.scala 37:12]
        y <= _y_T_1 @[GCDModule.scala 37:7]
      node _T_1 = eq(y, UInt<1>("h0")) @[GCDModule.scala 39:12]
      when _T_1 : @[GCDModule.scala 39:20]
        output.bits.value1 <= xInitial @[GCDModule.scala 40:26]
        output.bits.value2 <= yInitial @[GCDModule.scala 41:26]
        output.bits.gcd <= x @[GCDModule.scala 42:23]
        output.valid <= UInt<1>("h1") @[GCDModule.scala 43:20]
        node _busy_T = eq(output.ready, UInt<1>("h0")) @[GCDModule.scala 44:15]
        busy <= _busy_T @[GCDModule.scala 44:12]
    else :
      when input.valid : @[GCDModule.scala 48:22]
        input.ready <= UInt<1>("h1") @[Decoupled.scala 82:20]
        x <= input.bits.value1 @[GCDModule.scala 51:9]
        y <= input.bits.value2 @[GCDModule.scala 52:9]
        xInitial <= input.bits.value1 @[GCDModule.scala 53:16]
        yInitial <= input.bits.value2 @[GCDModule.scala 54:16]
        busy <= UInt<1>("h1") @[GCDModule.scala 55:12]
        resultValid <= UInt<1>("h0") @[GCDModule.scala 56:19]


