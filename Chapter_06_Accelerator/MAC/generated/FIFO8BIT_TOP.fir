circuit FIFO8BIT_TOP :
  module FIFO8BIT :
    input clock : Clock
    input reset : Reset
    output io : { flip wr_en : UInt<1>, flip rd_en : UInt<1>, flip data_in : UInt<8>, data_out : UInt<8>, full : UInt<1>, empty : UInt<1>, valid : UInt<1>}

    reg fifo : UInt<8>[3], clock with :
      reset => (UInt<1>("h0"), fifo) @[FIFO8BIT.scala 15:17]
    reg count : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[FIFO8BIT.scala 16:22]
    reg read_ptr : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[FIFO8BIT.scala 17:25]
    reg write_ptr : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[FIFO8BIT.scala 18:26]
    node _io_empty_T = eq(count, UInt<1>("h0")) @[FIFO8BIT.scala 20:22]
    io.empty <= _io_empty_T @[FIFO8BIT.scala 20:12]
    node _io_full_T = eq(count, UInt<2>("h3")) @[FIFO8BIT.scala 21:21]
    io.full <= _io_full_T @[FIFO8BIT.scala 21:11]
    node _io_valid_T = eq(io.empty, UInt<1>("h0")) @[FIFO8BIT.scala 22:15]
    io.valid <= _io_valid_T @[FIFO8BIT.scala 22:12]
    io.data_out <= UInt<1>("h0") @[FIFO8BIT.scala 23:15]
    node _T = eq(io.full, UInt<1>("h0")) @[FIFO8BIT.scala 25:20]
    node _T_1 = and(io.wr_en, _T) @[FIFO8BIT.scala 25:17]
    when _T_1 : @[FIFO8BIT.scala 25:30]
      fifo[write_ptr] <= io.data_in @[FIFO8BIT.scala 26:21]
      node _write_ptr_T = eq(write_ptr, UInt<2>("h2")) @[FIFO8BIT.scala 27:32]
      node _write_ptr_T_1 = add(write_ptr, UInt<1>("h1")) @[FIFO8BIT.scala 27:56]
      node _write_ptr_T_2 = tail(_write_ptr_T_1, 1) @[FIFO8BIT.scala 27:56]
      node _write_ptr_T_3 = mux(_write_ptr_T, UInt<1>("h0"), _write_ptr_T_2) @[FIFO8BIT.scala 27:21]
      write_ptr <= _write_ptr_T_3 @[FIFO8BIT.scala 27:15]
      node _count_T = add(count, UInt<1>("h1")) @[FIFO8BIT.scala 28:20]
      node _count_T_1 = tail(_count_T, 1) @[FIFO8BIT.scala 28:20]
      count <= _count_T_1 @[FIFO8BIT.scala 28:11]
    node _T_2 = eq(io.empty, UInt<1>("h0")) @[FIFO8BIT.scala 31:20]
    node _T_3 = and(io.rd_en, _T_2) @[FIFO8BIT.scala 31:17]
    when _T_3 : @[FIFO8BIT.scala 31:31]
      io.data_out <= fifo[read_ptr] @[FIFO8BIT.scala 32:17]
      node _read_ptr_T = eq(read_ptr, UInt<2>("h2")) @[FIFO8BIT.scala 33:30]
      node _read_ptr_T_1 = add(read_ptr, UInt<1>("h1")) @[FIFO8BIT.scala 33:53]
      node _read_ptr_T_2 = tail(_read_ptr_T_1, 1) @[FIFO8BIT.scala 33:53]
      node _read_ptr_T_3 = mux(_read_ptr_T, UInt<1>("h0"), _read_ptr_T_2) @[FIFO8BIT.scala 33:20]
      read_ptr <= _read_ptr_T_3 @[FIFO8BIT.scala 33:14]
      node _count_T_2 = sub(count, UInt<1>("h1")) @[FIFO8BIT.scala 34:20]
      node _count_T_3 = tail(_count_T_2, 1) @[FIFO8BIT.scala 34:20]
      count <= _count_T_3 @[FIFO8BIT.scala 34:11]


  module FIFO8BIT_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip wr_en : UInt<1>, flip rd_en : UInt<1>, flip data_in : UInt<8>, data_out : UInt<8>, full : UInt<1>, empty : UInt<1>, valid : UInt<1>}

    reg fifo : UInt<8>[3], clock with :
      reset => (UInt<1>("h0"), fifo) @[FIFO8BIT.scala 15:17]
    reg count : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[FIFO8BIT.scala 16:22]
    reg read_ptr : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[FIFO8BIT.scala 17:25]
    reg write_ptr : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[FIFO8BIT.scala 18:26]
    node _io_empty_T = eq(count, UInt<1>("h0")) @[FIFO8BIT.scala 20:22]
    io.empty <= _io_empty_T @[FIFO8BIT.scala 20:12]
    node _io_full_T = eq(count, UInt<2>("h3")) @[FIFO8BIT.scala 21:21]
    io.full <= _io_full_T @[FIFO8BIT.scala 21:11]
    node _io_valid_T = eq(io.empty, UInt<1>("h0")) @[FIFO8BIT.scala 22:15]
    io.valid <= _io_valid_T @[FIFO8BIT.scala 22:12]
    io.data_out <= UInt<1>("h0") @[FIFO8BIT.scala 23:15]
    node _T = eq(io.full, UInt<1>("h0")) @[FIFO8BIT.scala 25:20]
    node _T_1 = and(io.wr_en, _T) @[FIFO8BIT.scala 25:17]
    when _T_1 : @[FIFO8BIT.scala 25:30]
      fifo[write_ptr] <= io.data_in @[FIFO8BIT.scala 26:21]
      node _write_ptr_T = eq(write_ptr, UInt<2>("h2")) @[FIFO8BIT.scala 27:32]
      node _write_ptr_T_1 = add(write_ptr, UInt<1>("h1")) @[FIFO8BIT.scala 27:56]
      node _write_ptr_T_2 = tail(_write_ptr_T_1, 1) @[FIFO8BIT.scala 27:56]
      node _write_ptr_T_3 = mux(_write_ptr_T, UInt<1>("h0"), _write_ptr_T_2) @[FIFO8BIT.scala 27:21]
      write_ptr <= _write_ptr_T_3 @[FIFO8BIT.scala 27:15]
      node _count_T = add(count, UInt<1>("h1")) @[FIFO8BIT.scala 28:20]
      node _count_T_1 = tail(_count_T, 1) @[FIFO8BIT.scala 28:20]
      count <= _count_T_1 @[FIFO8BIT.scala 28:11]
    node _T_2 = eq(io.empty, UInt<1>("h0")) @[FIFO8BIT.scala 31:20]
    node _T_3 = and(io.rd_en, _T_2) @[FIFO8BIT.scala 31:17]
    when _T_3 : @[FIFO8BIT.scala 31:31]
      io.data_out <= fifo[read_ptr] @[FIFO8BIT.scala 32:17]
      node _read_ptr_T = eq(read_ptr, UInt<2>("h2")) @[FIFO8BIT.scala 33:30]
      node _read_ptr_T_1 = add(read_ptr, UInt<1>("h1")) @[FIFO8BIT.scala 33:53]
      node _read_ptr_T_2 = tail(_read_ptr_T_1, 1) @[FIFO8BIT.scala 33:53]
      node _read_ptr_T_3 = mux(_read_ptr_T, UInt<1>("h0"), _read_ptr_T_2) @[FIFO8BIT.scala 33:20]
      read_ptr <= _read_ptr_T_3 @[FIFO8BIT.scala 33:14]
      node _count_T_2 = sub(count, UInt<1>("h1")) @[FIFO8BIT.scala 34:20]
      node _count_T_3 = tail(_count_T_2, 1) @[FIFO8BIT.scala 34:20]
      count <= _count_T_3 @[FIFO8BIT.scala 34:11]


  module FIFO8BIT_TOP :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip wr_en : UInt<2>, flip rd_en : UInt<2>, flip data_in_1 : UInt<8>, flip data_in_2 : UInt<8>, data_out_1 : UInt<8>, data_out_2 : UInt<8>, full : UInt<1>[2], empty : UInt<1>[2]}

    inst fifo1 of FIFO8BIT @[FIFO8BIT_TOP.scala 18:21]
    fifo1.clock <= clock
    fifo1.reset <= reset
    node _fifo1_io_wr_en_T = bits(io.wr_en, 0, 0) @[FIFO8BIT_TOP.scala 19:29]
    fifo1.io.wr_en <= _fifo1_io_wr_en_T @[FIFO8BIT_TOP.scala 19:18]
    node _fifo1_io_rd_en_T = bits(io.rd_en, 0, 0) @[FIFO8BIT_TOP.scala 20:29]
    fifo1.io.rd_en <= _fifo1_io_rd_en_T @[FIFO8BIT_TOP.scala 20:18]
    fifo1.io.data_in <= io.data_in_1 @[FIFO8BIT_TOP.scala 21:20]
    io.data_out_1 <= fifo1.io.data_out @[FIFO8BIT_TOP.scala 22:17]
    io.full[0] <= fifo1.io.full @[FIFO8BIT_TOP.scala 23:14]
    io.empty[0] <= fifo1.io.empty @[FIFO8BIT_TOP.scala 24:15]
    inst fifo2 of FIFO8BIT_1 @[FIFO8BIT_TOP.scala 27:21]
    fifo2.clock <= clock
    fifo2.reset <= reset
    node _fifo2_io_wr_en_T = bits(io.wr_en, 1, 1) @[FIFO8BIT_TOP.scala 28:29]
    fifo2.io.wr_en <= _fifo2_io_wr_en_T @[FIFO8BIT_TOP.scala 28:18]
    node _fifo2_io_rd_en_T = bits(io.rd_en, 1, 1) @[FIFO8BIT_TOP.scala 29:29]
    fifo2.io.rd_en <= _fifo2_io_rd_en_T @[FIFO8BIT_TOP.scala 29:18]
    fifo2.io.data_in <= io.data_in_2 @[FIFO8BIT_TOP.scala 30:20]
    io.data_out_2 <= fifo2.io.data_out @[FIFO8BIT_TOP.scala 31:17]
    io.full[1] <= fifo2.io.full @[FIFO8BIT_TOP.scala 32:14]
    io.empty[1] <= fifo2.io.empty @[FIFO8BIT_TOP.scala 33:15]

