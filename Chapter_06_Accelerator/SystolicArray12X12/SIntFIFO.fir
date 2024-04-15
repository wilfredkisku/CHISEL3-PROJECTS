circuit SIntFIFO :
  module Queue :
    input clock : Clock
    input reset : Reset
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : SInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : SInt<8>}, count : UInt<5>}

    cmem ram : SInt<8> [24] @[Decoupled.scala 273:95]
    reg enq_ptr_value : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[Counter.scala 61:40]
    reg deq_ptr_value : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[Counter.scala 61:40]
    reg maybe_full : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Decoupled.scala 276:27]
    node ptr_match = eq(enq_ptr_value, deq_ptr_value) @[Decoupled.scala 277:33]
    node _empty_T = eq(maybe_full, UInt<1>("h0")) @[Decoupled.scala 278:28]
    node empty = and(ptr_match, _empty_T) @[Decoupled.scala 278:25]
    node full = and(ptr_match, maybe_full) @[Decoupled.scala 279:24]
    node _do_enq_T = and(io.enq.ready, io.enq.valid) @[Decoupled.scala 51:35]
    wire do_enq : UInt<1> @[Decoupled.scala 280:27]
    do_enq <= _do_enq_T @[Decoupled.scala 280:27]
    node _do_deq_T = and(io.deq.ready, io.deq.valid) @[Decoupled.scala 51:35]
    wire do_deq : UInt<1> @[Decoupled.scala 281:27]
    do_deq <= _do_deq_T @[Decoupled.scala 281:27]
    when do_enq : @[Decoupled.scala 286:16]
      infer mport MPORT = ram[enq_ptr_value], clock @[Decoupled.scala 287:8]
      MPORT <= io.enq.bits @[Decoupled.scala 287:24]
      node wrap = eq(enq_ptr_value, UInt<5>("h17")) @[Counter.scala 73:24]
      node _value_T = add(enq_ptr_value, UInt<1>("h1")) @[Counter.scala 77:24]
      node _value_T_1 = tail(_value_T, 1) @[Counter.scala 77:24]
      enq_ptr_value <= _value_T_1 @[Counter.scala 77:15]
      when wrap : @[Counter.scala 87:20]
        enq_ptr_value <= UInt<1>("h0") @[Counter.scala 87:28]
    when do_deq : @[Decoupled.scala 290:16]
      node wrap_1 = eq(deq_ptr_value, UInt<5>("h17")) @[Counter.scala 73:24]
      node _value_T_2 = add(deq_ptr_value, UInt<1>("h1")) @[Counter.scala 77:24]
      node _value_T_3 = tail(_value_T_2, 1) @[Counter.scala 77:24]
      deq_ptr_value <= _value_T_3 @[Counter.scala 77:15]
      when wrap_1 : @[Counter.scala 87:20]
        deq_ptr_value <= UInt<1>("h0") @[Counter.scala 87:28]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 293:15]
    when _T : @[Decoupled.scala 293:27]
      maybe_full <= do_enq @[Decoupled.scala 294:16]
    when UInt<1>("h0") : @[Decoupled.scala 296:15]
      enq_ptr_value <= UInt<1>("h0") @[Counter.scala 98:11]
      deq_ptr_value <= UInt<1>("h0") @[Counter.scala 98:11]
      maybe_full <= UInt<1>("h0") @[Decoupled.scala 299:16]
    node _io_deq_valid_T = eq(empty, UInt<1>("h0")) @[Decoupled.scala 302:19]
    io.deq.valid <= _io_deq_valid_T @[Decoupled.scala 302:16]
    node _io_enq_ready_T = eq(full, UInt<1>("h0")) @[Decoupled.scala 303:19]
    io.enq.ready <= _io_enq_ready_T @[Decoupled.scala 303:16]
    infer mport io_deq_bits_MPORT = ram[deq_ptr_value], clock @[Decoupled.scala 310:23]
    io.deq.bits <= io_deq_bits_MPORT @[Decoupled.scala 310:17]
    node _ptr_diff_T = sub(enq_ptr_value, deq_ptr_value) @[Decoupled.scala 326:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 326:32]
    node _io_count_T = mux(maybe_full, UInt<5>("h18"), UInt<1>("h0")) @[Decoupled.scala 333:10]
    node _io_count_T_1 = gt(deq_ptr_value, enq_ptr_value) @[Decoupled.scala 334:25]
    node _io_count_T_2 = add(UInt<5>("h18"), ptr_diff) @[Decoupled.scala 334:57]
    node _io_count_T_3 = tail(_io_count_T_2, 1) @[Decoupled.scala 334:57]
    node _io_count_T_4 = mux(_io_count_T_1, _io_count_T_3, ptr_diff) @[Decoupled.scala 334:10]
    node _io_count_T_5 = mux(ptr_match, _io_count_T, _io_count_T_4) @[Decoupled.scala 331:20]
    io.count <= _io_count_T_5 @[Decoupled.scala 331:14]

  module SIntFIFO :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip enq : { flip ready : UInt<1>, valid : UInt<1>, bits : SInt<8>}, deq : { flip ready : UInt<1>, valid : UInt<1>, bits : SInt<8>}}

    inst fifo of Queue @[Decoupled.scala 375:21]
    fifo.clock <= clock
    fifo.reset <= reset
    fifo.io.enq.valid <= io.enq.valid @[Decoupled.scala 377:22]
    fifo.io.enq.bits <= io.enq.bits @[Decoupled.scala 378:21]
    io.enq.ready <= fifo.io.enq.ready @[Decoupled.scala 379:17]
    io.deq.bits <= fifo.io.deq.bits @[SIntFIFO.scala 14:10]
    io.deq.valid <= fifo.io.deq.valid @[SIntFIFO.scala 14:10]
    fifo.io.deq.ready <= io.deq.ready @[SIntFIFO.scala 14:10]

