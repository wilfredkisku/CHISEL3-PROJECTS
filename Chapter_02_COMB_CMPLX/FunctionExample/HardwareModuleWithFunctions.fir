FIRRTL version 1.2.0
circuit HardwareModuleWithFunctions :
  module HardwareModuleWithFunctions :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip inputA : UInt<4>, flip inputB : UInt<4>, output : UInt<5>, flip condition : UInt<1>} @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 5:14]

    node _sum_T = add(io.inputA, io.inputB) @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 14:7]
    node sum = tail(_sum_T, 1) @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 14:7]
    node shiftedResult = shl(sum, 2) @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 19:11]
    node selectedResult = mux(io.condition, sum, shiftedResult) @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 24:8]
    node finalResult = mul(selectedResult, UInt<2>("h3")) @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 29:21]
    io.output <= finalResult @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 41:13]

