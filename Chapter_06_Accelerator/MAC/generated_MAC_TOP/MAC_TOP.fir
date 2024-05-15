circuit MAC_TOP :
  module SIGNED_ADD_W16 :
    input clock : Clock
    input reset : Reset
    output io : { flip inputA : SInt<16>, flip inputB : SInt<16>, output : SInt<17>}

    node _io_output_T = add(io.inputA, io.inputB) @[SIGNED_ADD_W16.scala 12:26]
    io.output <= _io_output_T @[SIGNED_ADD_W16.scala 12:13]

  module SIGNED_MUL :
    input clock : Clock
    input reset : Reset
    output io : { flip inputA : SInt<8>, flip inputB : SInt<8>, output : SInt<16>}

    node _io_output_T = mul(io.inputA, io.inputB) @[SIGNED_MUL.scala 12:26]
    io.output <= _io_output_T @[SIGNED_MUL.scala 12:13]

  module MAC_TOP :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip wgt : SInt<8>, flip ifm : SInt<8>, result : SInt<16>, valid : UInt<1>}

    reg count : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[MAC_TOP.scala 16:22]
    node _count_T = add(count, UInt<1>("h1")) @[MAC_TOP.scala 17:18]
    node _count_T_1 = tail(_count_T, 1) @[MAC_TOP.scala 17:18]
    count <= _count_T_1 @[MAC_TOP.scala 17:9]
    reg wgtReg : SInt<8>, clock with :
      reset => (UInt<1>("h0"), wgtReg) @[MAC_TOP.scala 20:19]
    reg ifmReg : SInt<8>, clock with :
      reset => (UInt<1>("h0"), ifmReg) @[MAC_TOP.scala 21:19]
    reg mulReg : SInt<16>, clock with :
      reset => (UInt<1>("h0"), mulReg) @[MAC_TOP.scala 24:19]
    reg sumReg : SInt<16>, clock with :
      reset => (reset, asSInt(UInt<16>("h0"))) @[MAC_TOP.scala 28:23]
    reg resultReg : SInt<16>, clock with :
      reset => (UInt<1>("h0"), resultReg) @[MAC_TOP.scala 31:22]
    inst add of SIGNED_ADD_W16 @[MAC_TOP.scala 34:19]
    add.clock <= clock
    add.reset <= reset
    inst mul of SIGNED_MUL @[MAC_TOP.scala 35:19]
    mul.clock <= clock
    mul.reset <= reset
    wgtReg <= io.wgt @[MAC_TOP.scala 41:10]
    ifmReg <= io.ifm @[MAC_TOP.scala 42:10]
    mul.io.inputA <= wgtReg @[MAC_TOP.scala 49:17]
    mul.io.inputB <= ifmReg @[MAC_TOP.scala 50:17]
    mulReg <= mul.io.output @[MAC_TOP.scala 51:10]
    add.io.inputA <= mulReg @[MAC_TOP.scala 54:17]
    add.io.inputB <= sumReg @[MAC_TOP.scala 55:17]
    io.result <= add.io.output @[MAC_TOP.scala 56:13]
    node _T = eq(count, UInt<2>("h3")) @[MAC_TOP.scala 60:14]
    when _T : @[MAC_TOP.scala 60:23]
      io.valid <= UInt<1>("h1") @[MAC_TOP.scala 61:14]
      count <= UInt<1>("h0") @[MAC_TOP.scala 62:11]
    else :
      io.valid <= UInt<1>("h0") @[MAC_TOP.scala 64:14]


