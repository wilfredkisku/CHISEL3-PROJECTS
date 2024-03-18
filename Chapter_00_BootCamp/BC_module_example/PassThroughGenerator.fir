FIRRTL version 1.2.0
circuit PassThroughGenerator :
  module PassThroughGenerator :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in : UInt<10>, out : UInt<10>} @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/PassThroughGenerator.scala 5:14]

    io.out <= io.in @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/PassThroughGenerator.scala 9:10]

