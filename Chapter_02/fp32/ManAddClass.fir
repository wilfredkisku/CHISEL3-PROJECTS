circuit ManAddClass :
  module ManAddClass :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip manA : UInt<23>, flip manB : UInt<23>, flip exp : UInt<8>, manOut : UInt<23>, expOut : UInt<8>}

    wire operandA : UInt<24> @[ManAddClass.scala 13:22]
    wire operandB : UInt<24> @[ManAddClass.scala 14:22]
    wire operandOut : UInt<24> @[ManAddClass.scala 15:24]
    node _operandA_T = cat(UInt<1>("h1"), io.manA) @[Cat.scala 33:92]
    operandA <= _operandA_T @[ManAddClass.scala 19:11]
    node _operandB_T = cat(UInt<1>("h1"), io.manB) @[Cat.scala 33:92]
    operandB <= _operandB_T @[ManAddClass.scala 20:12]
    io.expOut <= io.exp @[ManAddClass.scala 21:13]
    node _operandOut_T = add(operandA, operandB) @[ManAddClass.scala 23:26]
    node _operandOut_T_1 = tail(_operandOut_T, 1) @[ManAddClass.scala 23:26]
    operandOut <= _operandOut_T_1 @[ManAddClass.scala 23:14]
    node _T = bits(operandOut, 23, 23) @[ManAddClass.scala 25:18]
    node _T_1 = eq(_T, UInt<1>("h1")) @[ManAddClass.scala 25:23]
    when _T_1 : @[ManAddClass.scala 26:5]
      node _io_manOut_T = dshr(operandOut, UInt<1>("h1")) @[ManAddClass.scala 27:30]
      node _io_manOut_T_1 = bits(_io_manOut_T, 22, 0) @[ManAddClass.scala 27:37]
      io.manOut <= _io_manOut_T_1 @[ManAddClass.scala 27:15]
      node _io_expOut_T = add(io.exp, UInt<1>("h1")) @[ManAddClass.scala 28:25]
      node _io_expOut_T_1 = tail(_io_expOut_T, 1) @[ManAddClass.scala 28:25]
      io.expOut <= _io_expOut_T_1 @[ManAddClass.scala 28:15]
    else :
      node _io_manOut_T_2 = dshr(operandOut, UInt<1>("h1")) @[ManAddClass.scala 32:32]
      node _io_manOut_T_3 = bits(_io_manOut_T_2, 22, 0) @[ManAddClass.scala 32:39]
      io.manOut <= _io_manOut_T_3 @[ManAddClass.scala 32:17]


