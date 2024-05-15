circuit FIFO16BIT :
  module FIFO16BIT :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip wr_en : UInt<1>, flip rd_en : UInt<1>, flip data_in : UInt<16>, data_out : UInt<16>, full : UInt<1>, empty : UInt<1>, valid : UInt<1>}

    reg fifo : UInt<16>[3], clock with :
      reset => (UInt<1>("h0"), fifo) @[FIFO16BIT.scala 14:17]
    reg count : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[FIFO16BIT.scala 15:22]
    reg read_ptr : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[FIFO16BIT.scala 16:25]
    reg write_ptr : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[FIFO16BIT.scala 17:26]
    node _io_empty_T = eq(count, UInt<1>("h0")) @[FIFO16BIT.scala 19:22]
    io.empty <= _io_empty_T @[FIFO16BIT.scala 19:12]
    node _io_full_T = eq(count, UInt<2>("h3")) @[FIFO16BIT.scala 20:21]
    io.full <= _io_full_T @[FIFO16BIT.scala 20:11]
    node _io_valid_T = eq(io.empty, UInt<1>("h0")) @[FIFO16BIT.scala 21:15]
    io.valid <= _io_valid_T @[FIFO16BIT.scala 21:12]
    io.data_out <= UInt<1>("h0") @[FIFO16BIT.scala 22:15]
    node _T = eq(io.full, UInt<1>("h0")) @[FIFO16BIT.scala 24:20]
    node _T_1 = and(io.wr_en, _T) @[FIFO16BIT.scala 24:17]
    when _T_1 : @[FIFO16BIT.scala 24:30]
      fifo[write_ptr] <= io.data_in @[FIFO16BIT.scala 25:21]
      node _write_ptr_T = eq(write_ptr, UInt<2>("h2")) @[FIFO16BIT.scala 26:32]
      node _write_ptr_T_1 = add(write_ptr, UInt<1>("h1")) @[FIFO16BIT.scala 26:56]
      node _write_ptr_T_2 = tail(_write_ptr_T_1, 1) @[FIFO16BIT.scala 26:56]
      node _write_ptr_T_3 = mux(_write_ptr_T, UInt<1>("h0"), _write_ptr_T_2) @[FIFO16BIT.scala 26:21]
      write_ptr <= _write_ptr_T_3 @[FIFO16BIT.scala 26:15]
      node _count_T = add(count, UInt<1>("h1")) @[FIFO16BIT.scala 27:20]
      node _count_T_1 = tail(_count_T, 1) @[FIFO16BIT.scala 27:20]
      count <= _count_T_1 @[FIFO16BIT.scala 27:11]
    node _T_2 = eq(io.empty, UInt<1>("h0")) @[FIFO16BIT.scala 30:20]
    node _T_3 = and(io.rd_en, _T_2) @[FIFO16BIT.scala 30:17]
    when _T_3 : @[FIFO16BIT.scala 30:31]
      io.data_out <= fifo[read_ptr] @[FIFO16BIT.scala 31:17]
      node _read_ptr_T = eq(read_ptr, UInt<2>("h2")) @[FIFO16BIT.scala 32:30]
      node _read_ptr_T_1 = add(read_ptr, UInt<1>("h1")) @[FIFO16BIT.scala 32:53]
      node _read_ptr_T_2 = tail(_read_ptr_T_1, 1) @[FIFO16BIT.scala 32:53]
      node _read_ptr_T_3 = mux(_read_ptr_T, UInt<1>("h0"), _read_ptr_T_2) @[FIFO16BIT.scala 32:20]
      read_ptr <= _read_ptr_T_3 @[FIFO16BIT.scala 32:14]
      node _count_T_2 = sub(count, UInt<1>("h1")) @[FIFO16BIT.scala 33:20]
      node _count_T_3 = tail(_count_T_2, 1) @[FIFO16BIT.scala 33:20]
      count <= _count_T_3 @[FIFO16BIT.scala 33:11]


