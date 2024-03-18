FIRRTL version 1.2.0
circuit MAC :
  module MAC :
    input clock : Clock
    input reset : UInt<1>
    input io_in_a : UInt<4> @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 5:14]
    input io_in_b : UInt<4> @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 5:14]
    input io_in_c : UInt<4> @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 5:14]
    output io_out : UInt<8> @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 5:14]

    node _io_out_T = mul(io_in_a, io_in_b) @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 11:22]
    node _io_out_T_1 = add(_io_out_T, io_in_c) @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 11:33]
    node _io_out_T_2 = tail(_io_out_T_1, 1) @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 11:33]
    io_out <= _io_out_T_2 @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 11:10]
