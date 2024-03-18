FIRRTL version 1.2.0
circuit Arbiter :
  module Arbiter :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip fifo_valid : UInt<1>, fifo_ready : UInt<1>, flip fifo_data : UInt<16>, pe0_valid : UInt<1>, flip pe0_ready : UInt<1>, pe0_data : UInt<16>, pe1_valid : UInt<1>, flip pe1_ready : UInt<1>, pe1_data : UInt<16>} @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 5:14]

    node _io_fifo_ready_T = or(io.pe0_ready, io.pe1_ready) @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 22:33]
    io.fifo_ready <= _io_fifo_ready_T @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 22:17]
    node _io_pe0_valid_T = and(io.fifo_valid, io.pe0_ready) @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 23:33]
    io.pe0_valid <= _io_pe0_valid_T @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 23:16]
    node _io_pe1_valid_T = and(io.fifo_valid, io.pe1_ready) @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 24:33]
    node _io_pe1_valid_T_1 = eq(io.pe0_ready, UInt<1>("h0")) @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 24:52]
    node _io_pe1_valid_T_2 = and(_io_pe1_valid_T, _io_pe1_valid_T_1) @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 24:49]
    io.pe1_valid <= _io_pe1_valid_T_2 @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 24:16]
    io.pe0_data <= io.fifo_data @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 25:15]
    io.pe1_data <= io.fifo_data @[IdeaProjects/BootCamp/BC_module_example/src/main/scala/Arbiter.scala 26:15]

