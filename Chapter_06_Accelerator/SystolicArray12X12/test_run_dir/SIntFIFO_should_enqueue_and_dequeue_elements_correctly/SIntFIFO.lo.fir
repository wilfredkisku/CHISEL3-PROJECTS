FIRRTL version 1.1.0
circuit SIntFIFO :
  module Queue :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1>
    input io_enq_valid : UInt<1>
    input io_enq_bits : SInt<8>
    input io_deq_ready : UInt<1>
    output io_deq_valid : UInt<1>
    output io_deq_bits : SInt<8>
    output io_count : UInt<5>

    mem ram : @[Decoupled.scala 273:95]
      data-type => SInt<8>
      depth => 24
      read-latency => 0
      write-latency => 1
      reader => io_deq_bits_MPORT
      writer => MPORT
      read-under-write => undefined
    reg enq_ptr_value : UInt<5>, clock with :
      reset => (UInt<1>("h0"), enq_ptr_value) @[Counter.scala 61:40]
    reg deq_ptr_value : UInt<5>, clock with :
      reset => (UInt<1>("h0"), deq_ptr_value) @[Counter.scala 61:40]
    reg maybe_full : UInt<1>, clock with :
      reset => (UInt<1>("h0"), maybe_full) @[Decoupled.scala 276:27]
    node ptr_match = eq(enq_ptr_value, deq_ptr_value) @[Decoupled.scala 277:33]
    node _empty_T = eq(maybe_full, UInt<1>("h0")) @[Decoupled.scala 278:28]
    node empty = and(ptr_match, _empty_T) @[Decoupled.scala 278:25]
    node full = and(ptr_match, maybe_full) @[Decoupled.scala 279:24]
    node _do_enq_T = and(io_enq_ready, io_enq_valid) @[Decoupled.scala 51:35]
    node _do_deq_T = and(io_deq_ready, io_deq_valid) @[Decoupled.scala 51:35]
    node wrap = eq(enq_ptr_value, UInt<5>("h17")) @[Counter.scala 73:24]
    node _value_T = add(enq_ptr_value, UInt<1>("h1")) @[Counter.scala 77:24]
    node _value_T_1 = tail(_value_T, 1) @[Counter.scala 77:24]
    node _GEN_0 = mux(wrap, UInt<1>("h0"), _value_T_1) @[Counter.scala 77:15 87:{20,28}]
    node do_enq = _do_enq_T @[Decoupled.scala 280:{27,27}]
    node _GEN_1 = validif(do_enq, enq_ptr_value) @[Decoupled.scala 286:16 287:8]
    node _GEN_2 = validif(do_enq, clock) @[Decoupled.scala 286:16 287:8]
    node _GEN_3 = mux(do_enq, UInt<1>("h1"), UInt<1>("h0")) @[Decoupled.scala 286:16 287:8 273:95]
    node _GEN_4 = validif(do_enq, UInt<1>("h1")) @[Decoupled.scala 286:16 287:24]
    node _GEN_5 = validif(do_enq, io_enq_bits) @[Decoupled.scala 286:16 287:24]
    node _GEN_6 = mux(do_enq, _GEN_0, enq_ptr_value) @[Decoupled.scala 286:16 Counter.scala 61:40]
    node wrap_1 = eq(deq_ptr_value, UInt<5>("h17")) @[Counter.scala 73:24]
    node _value_T_2 = add(deq_ptr_value, UInt<1>("h1")) @[Counter.scala 77:24]
    node _value_T_3 = tail(_value_T_2, 1) @[Counter.scala 77:24]
    node _GEN_7 = mux(wrap_1, UInt<1>("h0"), _value_T_3) @[Counter.scala 77:15 87:{20,28}]
    node do_deq = _do_deq_T @[Decoupled.scala 281:{27,27}]
    node _GEN_8 = mux(do_deq, _GEN_7, deq_ptr_value) @[Decoupled.scala 290:16 Counter.scala 61:40]
    node _T = neq(do_enq, do_deq) @[Decoupled.scala 293:15]
    node _GEN_9 = mux(_T, do_enq, maybe_full) @[Decoupled.scala 293:27 294:16 276:27]
    node _GEN_10 = mux(UInt<1>("h0"), UInt<1>("h0"), _GEN_6) @[Decoupled.scala 296:15 Counter.scala 98:11]
    node _GEN_11 = mux(UInt<1>("h0"), UInt<1>("h0"), _GEN_8) @[Decoupled.scala 296:15 Counter.scala 98:11]
    node _GEN_12 = mux(UInt<1>("h0"), UInt<1>("h0"), _GEN_9) @[Decoupled.scala 296:15 299:16]
    node _io_deq_valid_T = eq(empty, UInt<1>("h0")) @[Decoupled.scala 302:19]
    node _io_enq_ready_T = eq(full, UInt<1>("h0")) @[Decoupled.scala 303:19]
    node _ptr_diff_T = sub(enq_ptr_value, deq_ptr_value) @[Decoupled.scala 326:32]
    node ptr_diff = tail(_ptr_diff_T, 1) @[Decoupled.scala 326:32]
    node _io_count_T = mux(maybe_full, UInt<5>("h18"), UInt<1>("h0")) @[Decoupled.scala 333:10]
    node _io_count_T_1 = gt(deq_ptr_value, enq_ptr_value) @[Decoupled.scala 334:25]
    node _io_count_T_2 = add(UInt<5>("h18"), ptr_diff) @[Decoupled.scala 334:57]
    node _io_count_T_3 = tail(_io_count_T_2, 1) @[Decoupled.scala 334:57]
    node _io_count_T_4 = mux(_io_count_T_1, _io_count_T_3, ptr_diff) @[Decoupled.scala 334:10]
    node _io_count_T_5 = mux(ptr_match, _io_count_T, _io_count_T_4) @[Decoupled.scala 331:20]
    io_enq_ready <= _io_enq_ready_T @[Decoupled.scala 303:16]
    io_deq_valid <= _io_deq_valid_T @[Decoupled.scala 302:16]
    io_deq_bits <= ram.io_deq_bits_MPORT.data @[Decoupled.scala 310:17]
    io_count <= _io_count_T_5 @[Decoupled.scala 331:14]
    ram.io_deq_bits_MPORT.addr <= deq_ptr_value @[Decoupled.scala 310:23]
    ram.io_deq_bits_MPORT.en <= UInt<1>("h1") @[Decoupled.scala 310:23]
    ram.io_deq_bits_MPORT.clk <= clock @[Decoupled.scala 310:23]
    ram.MPORT.addr <= _GEN_1
    ram.MPORT.en <= _GEN_3
    ram.MPORT.clk <= _GEN_2
    ram.MPORT.data <= _GEN_5
    ram.MPORT.mask <= _GEN_4
    enq_ptr_value <= mux(reset, UInt<5>("h0"), _GEN_10) @[Counter.scala 61:{40,40}]
    deq_ptr_value <= mux(reset, UInt<5>("h0"), _GEN_11) @[Counter.scala 61:{40,40}]
    maybe_full <= mux(reset, UInt<1>("h0"), _GEN_12) @[Decoupled.scala 276:{27,27}]

  module SIntFIFO :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1>
    input io_enq_valid : UInt<1>
    input io_enq_bits : SInt<8>
    input io_deq_ready : UInt<1>
    output io_deq_valid : UInt<1>
    output io_deq_bits : SInt<8>

    inst fifo of Queue @[Decoupled.scala 375:21]
    io_enq_ready <= fifo.io_enq_ready @[Decoupled.scala 379:17]
    io_deq_valid <= fifo.io_deq_valid @[SIntFIFO.scala 14:10]
    io_deq_bits <= fifo.io_deq_bits @[SIntFIFO.scala 14:10]
    fifo.clock <= clock
    fifo.reset <= reset
    fifo.io_enq_valid <= io_enq_valid @[Decoupled.scala 377:22]
    fifo.io_enq_bits <= io_enq_bits @[Decoupled.scala 378:21]
    fifo.io_deq_ready <= io_deq_ready @[SIntFIFO.scala 14:10]
