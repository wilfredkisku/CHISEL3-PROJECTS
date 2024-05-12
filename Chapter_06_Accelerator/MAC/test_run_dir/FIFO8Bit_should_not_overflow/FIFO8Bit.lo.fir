FIRRTL version 1.1.0
circuit FIFO8Bit :
  module FIFO8Bit :
    input clock : Clock
    input reset : UInt<1>
    input io_wr_en : UInt<1>
    input io_rd_en : UInt<1>
    input io_data_in : UInt<8>
    output io_data_out : UInt<8>
    output io_full : UInt<1>
    output io_empty : UInt<1>
    output io_valid : UInt<1>

    reg fifo_0 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), fifo_0) @[FIFO8BIT.scala 15:17]
    reg fifo_1 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), fifo_1) @[FIFO8BIT.scala 15:17]
    reg fifo_2 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), fifo_2) @[FIFO8BIT.scala 15:17]
    reg count : UInt<2>, clock with :
      reset => (UInt<1>("h0"), count) @[FIFO8BIT.scala 16:22]
    reg read_ptr : UInt<2>, clock with :
      reset => (UInt<1>("h0"), read_ptr) @[FIFO8BIT.scala 17:25]
    reg write_ptr : UInt<2>, clock with :
      reset => (UInt<1>("h0"), write_ptr) @[FIFO8BIT.scala 18:26]
    node _io_empty_T = eq(count, UInt<1>("h0")) @[FIFO8BIT.scala 20:22]
    node _io_full_T = eq(count, UInt<2>("h3")) @[FIFO8BIT.scala 21:21]
    node _io_valid_T = eq(io_empty, UInt<1>("h0")) @[FIFO8BIT.scala 22:15]
    node _T = eq(io_full, UInt<1>("h0")) @[FIFO8BIT.scala 25:20]
    node _T_1 = and(io_wr_en, _T) @[FIFO8BIT.scala 25:17]
    node _fifo_write_ptr = io_data_in @[FIFO8BIT.scala 26:{21,21}]
    node _GEN_0 = mux(eq(UInt<1>("h0"), write_ptr), _fifo_write_ptr, fifo_0) @[FIFO8BIT.scala 15:17 26:{21,21}]
    node _GEN_1 = mux(eq(UInt<1>("h1"), write_ptr), _fifo_write_ptr, fifo_1) @[FIFO8BIT.scala 15:17 26:{21,21}]
    node _GEN_2 = mux(eq(UInt<2>("h2"), write_ptr), _fifo_write_ptr, fifo_2) @[FIFO8BIT.scala 15:17 26:{21,21}]
    node _write_ptr_T = eq(write_ptr, UInt<2>("h2")) @[FIFO8BIT.scala 27:32]
    node _write_ptr_T_1 = add(write_ptr, UInt<1>("h1")) @[FIFO8BIT.scala 27:56]
    node _write_ptr_T_2 = tail(_write_ptr_T_1, 1) @[FIFO8BIT.scala 27:56]
    node _write_ptr_T_3 = mux(_write_ptr_T, UInt<1>("h0"), _write_ptr_T_2) @[FIFO8BIT.scala 27:21]
    node _count_T = add(count, UInt<1>("h1")) @[FIFO8BIT.scala 28:20]
    node _count_T_1 = tail(_count_T, 1) @[FIFO8BIT.scala 28:20]
    node _GEN_3 = mux(_T_1, _GEN_0, fifo_0) @[FIFO8BIT.scala 15:17 25:30]
    node _GEN_4 = mux(_T_1, _GEN_1, fifo_1) @[FIFO8BIT.scala 15:17 25:30]
    node _GEN_5 = mux(_T_1, _GEN_2, fifo_2) @[FIFO8BIT.scala 15:17 25:30]
    node _GEN_6 = mux(_T_1, _write_ptr_T_3, write_ptr) @[FIFO8BIT.scala 25:30 27:15 18:26]
    node _GEN_7 = mux(_T_1, _count_T_1, count) @[FIFO8BIT.scala 25:30 28:11 16:22]
    node _T_2 = eq(io_empty, UInt<1>("h0")) @[FIFO8BIT.scala 31:20]
    node _T_3 = and(io_rd_en, _T_2) @[FIFO8BIT.scala 31:17]
    node _GEN_8 = validif(eq(UInt<1>("h0"), read_ptr), fifo_0) @[FIFO8BIT.scala 32:{17,17}]
    node _GEN_9 = mux(eq(UInt<1>("h1"), read_ptr), fifo_1, _GEN_8) @[FIFO8BIT.scala 32:{17,17}]
    node _GEN_10 = mux(eq(UInt<2>("h2"), read_ptr), fifo_2, _GEN_9) @[FIFO8BIT.scala 32:{17,17}]
    node _read_ptr_T = eq(read_ptr, UInt<2>("h2")) @[FIFO8BIT.scala 33:30]
    node _read_ptr_T_1 = add(read_ptr, UInt<1>("h1")) @[FIFO8BIT.scala 33:53]
    node _read_ptr_T_2 = tail(_read_ptr_T_1, 1) @[FIFO8BIT.scala 33:53]
    node _read_ptr_T_3 = mux(_read_ptr_T, UInt<1>("h0"), _read_ptr_T_2) @[FIFO8BIT.scala 33:20]
    node _count_T_2 = sub(count, UInt<1>("h1")) @[FIFO8BIT.scala 34:20]
    node _count_T_3 = tail(_count_T_2, 1) @[FIFO8BIT.scala 34:20]
    node _fifo_read_ptr = _GEN_10 @[FIFO8BIT.scala 32:17]
    node _GEN_11 = mux(_T_3, _fifo_read_ptr, UInt<1>("h0")) @[FIFO8BIT.scala 23:15 31:31 32:17]
    node _GEN_12 = mux(_T_3, _read_ptr_T_3, read_ptr) @[FIFO8BIT.scala 31:31 33:14 17:25]
    node _GEN_13 = mux(_T_3, _count_T_3, _GEN_7) @[FIFO8BIT.scala 31:31 34:11]
    io_data_out <= _GEN_11
    io_full <= _io_full_T @[FIFO8BIT.scala 21:11]
    io_empty <= _io_empty_T @[FIFO8BIT.scala 20:12]
    io_valid <= _io_valid_T @[FIFO8BIT.scala 22:12]
    fifo_0 <= _GEN_3
    fifo_1 <= _GEN_4
    fifo_2 <= _GEN_5
    count <= mux(reset, UInt<2>("h0"), _GEN_13) @[FIFO8BIT.scala 16:{22,22}]
    read_ptr <= mux(reset, UInt<2>("h0"), _GEN_12) @[FIFO8BIT.scala 17:{25,25}]
    write_ptr <= mux(reset, UInt<2>("h0"), _GEN_6) @[FIFO8BIT.scala 18:{26,26}]
