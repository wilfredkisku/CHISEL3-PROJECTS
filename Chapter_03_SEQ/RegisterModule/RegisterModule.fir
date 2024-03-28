FIRRTL version 1.2.0
circuit RegisterModule :
  module RegisterModule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<12>, out : UInt<12>} @[IdeaProjects/stateRegisters/src/main/scala/RegisterModule.scala 7:14]

    reg register : UInt<12>, clock with :
      reset => (UInt<1>("h0"), register) @[IdeaProjects/stateRegisters/src/main/scala/RegisterModule.scala 12:21]
    node _register_T = add(io.in, UInt<1>("h1")) @[IdeaProjects/stateRegisters/src/main/scala/RegisterModule.scala 13:21]
    node _register_T_1 = tail(_register_T, 1) @[IdeaProjects/stateRegisters/src/main/scala/RegisterModule.scala 13:21]
    register <= _register_T_1 @[IdeaProjects/stateRegisters/src/main/scala/RegisterModule.scala 13:12]
    io.out <= register @[IdeaProjects/stateRegisters/src/main/scala/RegisterModule.scala 14:10]

