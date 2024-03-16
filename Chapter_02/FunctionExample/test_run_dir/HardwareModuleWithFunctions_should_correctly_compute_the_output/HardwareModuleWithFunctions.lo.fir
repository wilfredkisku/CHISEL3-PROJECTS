FIRRTL version 1.2.0
circuit HardwareModuleWithFunctions :
  module HardwareModuleWithFunctions :
    input clock : Clock
    input reset : UInt<1>
    input io_inputA : UInt<4> @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 5:14]
    input io_inputB : UInt<4> @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 5:14]
    output io_output : UInt<4> @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 5:14]
    input io_condition : UInt<1> @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 5:14]

    node _sum_T = add(io_inputA, io_inputB) @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 14:7]
    node sum = tail(_sum_T, 1) @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 14:7]
    node shiftedResult = shl(sum, 2) @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 19:11]
    node selectedResult = mux(io_condition, sum, shiftedResult) @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 24:8]
    node finalResult = mul(selectedResult, UInt<2>("h3")) @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 29:21]
    io_output <= bits(finalResult, 3, 0) @[IdeaProjects/FunctionExample/src/main/scala/HardwareModuleWithFunctions.scala 41:13]
