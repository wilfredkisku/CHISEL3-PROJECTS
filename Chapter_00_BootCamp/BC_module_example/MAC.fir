FIRRTL version 1.2.0
circuit MAC :
  module MAC :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip in_a : UInt<4>, flip in_b : UInt<4>, flip in_c : UInt<4>, out : UInt<8>} @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 5:14]

    node _io_out_T = mul(io.in_a, io.in_b) @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 11:22]
    node _io_out_T_1 = add(_io_out_T, io.in_c) @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 11:33]
    node _io_out_T_2 = tail(_io_out_T_1, 1) @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 11:33]
    io.out <= _io_out_T_2 @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/MAC.scala 11:10]

