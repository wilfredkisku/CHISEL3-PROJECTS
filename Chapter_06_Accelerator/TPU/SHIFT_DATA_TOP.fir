circuit SHIFT_DATA_TOP :
  module SHIFT_DATA_TOP :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip inp : UInt<8>, out : UInt<8>}

    reg reg1 : UInt, clock with :
      reset => (UInt<1>("h0"), reg1) @[SHIFT_DATA_TOP.scala 11:21]
    reg1 <= io.inp @[SHIFT_DATA_TOP.scala 11:21]
    reg reg2 : UInt, clock with :
      reset => (UInt<1>("h0"), reg2) @[SHIFT_DATA_TOP.scala 12:21]
    reg2 <= reg1 @[SHIFT_DATA_TOP.scala 12:21]
    reg reg3 : UInt, clock with :
      reset => (UInt<1>("h0"), reg3) @[SHIFT_DATA_TOP.scala 13:21]
    reg3 <= reg2 @[SHIFT_DATA_TOP.scala 13:21]
    reg reg4 : UInt, clock with :
      reset => (UInt<1>("h0"), reg4) @[SHIFT_DATA_TOP.scala 14:21]
    reg4 <= reg3 @[SHIFT_DATA_TOP.scala 14:21]
    reg reg5 : UInt, clock with :
      reset => (UInt<1>("h0"), reg5) @[SHIFT_DATA_TOP.scala 15:21]
    reg5 <= reg4 @[SHIFT_DATA_TOP.scala 15:21]
    io.out <= reg5 @[SHIFT_DATA_TOP.scala 17:10]

