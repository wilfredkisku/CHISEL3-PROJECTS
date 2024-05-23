FIRRTL version 1.1.0
circuit SHIFT_DATA_TOP :
  module SHIFT_DATA_TOP :
    input clock : Clock
    input reset : UInt<1>
    input io_inp : UInt<8>
    output io_out : UInt<8>

    reg reg1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg1) @[SHIFT_DATA_TOP.scala 11:21]
    reg reg2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg2) @[SHIFT_DATA_TOP.scala 12:21]
    reg reg3 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg3) @[SHIFT_DATA_TOP.scala 13:21]
    reg reg4 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg4) @[SHIFT_DATA_TOP.scala 14:21]
    reg reg5 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg5) @[SHIFT_DATA_TOP.scala 15:21]
    io_out <= reg5 @[SHIFT_DATA_TOP.scala 17:10]
    reg1 <= io_inp @[SHIFT_DATA_TOP.scala 11:21]
    reg2 <= reg1 @[SHIFT_DATA_TOP.scala 12:21]
    reg3 <= reg2 @[SHIFT_DATA_TOP.scala 13:21]
    reg4 <= reg3 @[SHIFT_DATA_TOP.scala 14:21]
    reg5 <= reg4 @[SHIFT_DATA_TOP.scala 15:21]
