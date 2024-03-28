FIRRTL version 1.2.0
circuit RegisterInitModule :
  module RegisterInitModule :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<12>, out : UInt<12>} @[IdeaProjects/stateRegisters/src/main/scala/RegisterInitModule.scala 7:14]

    reg register : UInt, clock with :
      reset => (reset, UInt<1>("h0")) @[IdeaProjects/stateRegisters/src/main/scala/RegisterInitModule.scala 12:25]
    node _register_T = add(io.in, UInt<1>("h1")) @[IdeaProjects/stateRegisters/src/main/scala/RegisterInitModule.scala 13:21]
    node _register_T_1 = tail(_register_T, 1) @[IdeaProjects/stateRegisters/src/main/scala/RegisterInitModule.scala 13:21]
    register <= _register_T_1 @[IdeaProjects/stateRegisters/src/main/scala/RegisterInitModule.scala 13:12]
    io.out <= register @[IdeaProjects/stateRegisters/src/main/scala/RegisterInitModule.scala 14:10]

