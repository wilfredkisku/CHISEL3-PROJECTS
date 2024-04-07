FIRRTL version 1.2.0
circuit QueueModule :
  module Queue :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<9>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<9>}, count : UInt<8>} @[src/main/scala/chisel3/util/Decoupled.scala 273:14]

    cmem ram : UInt<9> [200] @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
    reg enq_ptr_value : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    reg deq_ptr_value : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/chisel3/util/Counter.scala 61:40]
    reg maybe_full : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/chisel3/util/Decoupled.scala 277:27]
    node ptr_match = eq(enq_ptr_value, deq_ptr_value) @[src/main/scala/chisel3/util/Decoupled.scala 278:33]
    node _empty_T = eq(maybe_full, UInt<1>("h0")) @[src/main/scala/chisel3/util/Decoupled.scala 279:28]
    node empty = and(ptr_match, _empty_T) @[src/main/scala/chisel3/util/Decoupled.scala 279:25]
    node full = and(ptr_match, maybe_full) @[src/main/scala/chisel3/util/Decoupled.scala 280:24]
    node _do_enq_T = and(io.enq.ready, io.enq.valid) @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
    wire do_enq : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 281:27]
    do_enq <= _do_enq_T @[src/main/scala/chisel3/util/Decoupled.scala 281:27]
    node _do_deq_T = and(io.deq.ready, io.deq.valid) @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
    wire do_deq : UInt<1> @[src/main/scala/chisel3/util/Decoupled.scala 282:27]
    do_deq <= _do_deq_T @[src/main/scala/chisel3/util/Decoupled.scala 282:27]
    when do_enq : @[src/main/scala/chisel3/util/Decoupled.scala 287:16]
      infer mport MPORT = ram[enq_ptr_value], clock @[src/main/scala/chisel3/util/Decoupled.scala 288:8]
      MPORT <= io.enq.bits @[src/main/scala/chisel3/util/Decoupled.scala 288:24]
      node wrap = eq(enq_ptr_value, UInt<8>("hc7")) @[src/main/scala/chisel3/util/Counter.scala 73:24]
      node _value_T = add(enq_ptr_value, UInt<1>("h1")) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      node _value_T_1 = tail(_value_T, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      enq_ptr_value <= _value_T_1 @[src/main/scala/chisel3/util/Counter.scala 77:15]
      when wrap : @[src/main/scala/chisel3/util/Counter.scala 87:20]
        enq_ptr_value <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 87:28]
    when do_deq : @[src/main/scala/chisel3/util/Decoupled.scala 291:16]
      node wrap_1 = eq(deq_ptr_value, UInt<8>("hc7")) @[src/main/scala/chisel3/util/Counter.scala 73:24]
      node _value_T_2 = add(deq_ptr_value, UInt<1>("h1")) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      node _value_T_3 = tail(_value_T_2, 1) @[src/main/scala/chisel3/util/Counter.scala 77:24]
      deq_ptr_value <= _value_T_3 @[src/main/scala/chisel3/util/Counter.scala 77:15]
      when wrap_1 : @[src/main/scala/chisel3/util/Counter.scala 87:20]
        deq_ptr_value <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 87:28]
    node _T = neq(do_enq, do_deq) @[src/main/scala/chisel3/util/Decoupled.scala 294:15]
    when _T : @[src/main/scala/chisel3/util/Decoupled.scala 294:27]
      maybe_full <= do_enq @[src/main/scala/chisel3/util/Decoupled.scala 295:16]
    when UInt<1>("h0") : @[src/main/scala/chisel3/util/Decoupled.scala 297:15]
      enq_ptr_value <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 98:11]
      deq_ptr_value <= UInt<1>("h0") @[src/main/scala/chisel3/util/Counter.scala 98:11]
      maybe_full <= UInt<1>("h0") @[src/main/scala/chisel3/util/Decoupled.scala 300:16]
    node _io_deq_valid_T = eq(empty, UInt<1>("h0")) @[src/main/scala/chisel3/util/Decoupled.scala 303:19]
    io.deq.valid <= _io_deq_valid_T @[src/main/scala/chisel3/util/Decoupled.scala 303:16]
    node _io_enq_ready_T = eq(full, UInt<1>("h0")) @[src/main/scala/chisel3/util/Decoupled.scala 304:19]
    io.enq.ready <= _io_enq_ready_T @[src/main/scala/chisel3/util/Decoupled.scala 304:16]
    infer mport io_deq_bits_MPORT = ram[deq_ptr_value], clock @[src/main/scala/chisel3/util/Decoupled.scala 311:23]
    io.deq.bits <= io_deq_bits_MPORT @[src/main/scala/chisel3/util/Decoupled.scala 311:17]
    node _ptr_diff_T = sub(enq_ptr_value, deq_ptr_value) @[src/main/scala/chisel3/util/Decoupled.scala 327:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[src/main/scala/chisel3/util/Decoupled.scala 327:32]
    node _io_count_T = mux(maybe_full, UInt<8>("hc8"), UInt<1>("h0")) @[src/main/scala/chisel3/util/Decoupled.scala 334:10]
    node _io_count_T_1 = gt(deq_ptr_value, enq_ptr_value) @[src/main/scala/chisel3/util/Decoupled.scala 335:25]
    node _io_count_T_2 = add(UInt<8>("hc8"), ptr_diff) @[src/main/scala/chisel3/util/Decoupled.scala 335:57]
    node _io_count_T_3 = tail(_io_count_T_2, 1) @[src/main/scala/chisel3/util/Decoupled.scala 335:57]
    node _io_count_T_4 = mux(_io_count_T_1, _io_count_T_3, ptr_diff) @[src/main/scala/chisel3/util/Decoupled.scala 335:10]
    node _io_count_T_5 = mux(ptr_match, _io_count_T, _io_count_T_4) @[src/main/scala/chisel3/util/Decoupled.scala 332:20]
    io.count <= _io_count_T_5 @[src/main/scala/chisel3/util/Decoupled.scala 332:14]

  module QueueModule :
    input clock : Clock
    input reset : UInt<1>
    input in : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<9>} @[IdeaProjects/BootCamp/QueueModule/src/main/scala/DequeueModule.scala 7:14]
    output out : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<9>} @[IdeaProjects/BootCamp/QueueModule/src/main/scala/DequeueModule.scala 8:15]

    inst out_q of Queue @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
    out_q.clock <= clock
    out_q.reset <= reset
    out_q.io.enq.valid <= in.valid @[src/main/scala/chisel3/util/Decoupled.scala 378:22]
    out_q.io.enq.bits <= in.bits @[src/main/scala/chisel3/util/Decoupled.scala 379:21]
    in.ready <= out_q.io.enq.ready @[src/main/scala/chisel3/util/Decoupled.scala 380:17]
    out.bits <= out_q.io.deq.bits @[IdeaProjects/BootCamp/QueueModule/src/main/scala/DequeueModule.scala 9:7]
    out.valid <= out_q.io.deq.valid @[IdeaProjects/BootCamp/QueueModule/src/main/scala/DequeueModule.scala 9:7]
    out_q.io.deq.ready <= out.ready @[IdeaProjects/BootCamp/QueueModule/src/main/scala/DequeueModule.scala 9:7]

