module GlobalBufferAccessParallel(
  input        clock,
  input        reset,
  input  [9:0] io_readAddr,
  output [7:0] io_readData_0,
  output [7:0] io_readData_1,
  output [7:0] io_readData_2,
  output [7:0] io_readData_3,
  output [7:0] io_readData_4,
  output [7:0] io_readData_5,
  output [7:0] io_readData_6,
  output [7:0] io_readData_7,
  output [7:0] io_readData_8,
  input  [1:0] io_bankSel
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_30;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] banks_0 [0:575]; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_0_io_readData_0_MPORT_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_0_io_readData_0_MPORT_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_0_io_readData_0_MPORT_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_0_io_readData_1_MPORT_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_0_io_readData_1_MPORT_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_0_io_readData_1_MPORT_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_0_io_readData_2_MPORT_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_0_io_readData_2_MPORT_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_0_io_readData_2_MPORT_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_0_io_readData_3_MPORT_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_0_io_readData_3_MPORT_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_0_io_readData_3_MPORT_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_0_io_readData_4_MPORT_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_0_io_readData_4_MPORT_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_0_io_readData_4_MPORT_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_0_io_readData_5_MPORT_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_0_io_readData_5_MPORT_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_0_io_readData_5_MPORT_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_0_io_readData_6_MPORT_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_0_io_readData_6_MPORT_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_0_io_readData_6_MPORT_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_0_io_readData_7_MPORT_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_0_io_readData_7_MPORT_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_0_io_readData_7_MPORT_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_0_io_readData_8_MPORT_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_0_io_readData_8_MPORT_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_0_io_readData_8_MPORT_data; // @[GlobalBufferAccessParallel.scala 13:32]
  reg [7:0] banks_1 [0:575]; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_1_io_readData_0_MPORT_1_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_1_io_readData_0_MPORT_1_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_1_io_readData_0_MPORT_1_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_1_io_readData_1_MPORT_1_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_1_io_readData_1_MPORT_1_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_1_io_readData_1_MPORT_1_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_1_io_readData_2_MPORT_1_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_1_io_readData_2_MPORT_1_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_1_io_readData_2_MPORT_1_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_1_io_readData_3_MPORT_1_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_1_io_readData_3_MPORT_1_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_1_io_readData_3_MPORT_1_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_1_io_readData_4_MPORT_1_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_1_io_readData_4_MPORT_1_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_1_io_readData_4_MPORT_1_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_1_io_readData_5_MPORT_1_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_1_io_readData_5_MPORT_1_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_1_io_readData_5_MPORT_1_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_1_io_readData_6_MPORT_1_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_1_io_readData_6_MPORT_1_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_1_io_readData_6_MPORT_1_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_1_io_readData_7_MPORT_1_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_1_io_readData_7_MPORT_1_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_1_io_readData_7_MPORT_1_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_1_io_readData_8_MPORT_1_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_1_io_readData_8_MPORT_1_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_1_io_readData_8_MPORT_1_data; // @[GlobalBufferAccessParallel.scala 13:32]
  reg [7:0] banks_2 [0:575]; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_2_io_readData_0_MPORT_2_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_2_io_readData_0_MPORT_2_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_2_io_readData_0_MPORT_2_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_2_io_readData_1_MPORT_2_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_2_io_readData_1_MPORT_2_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_2_io_readData_1_MPORT_2_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_2_io_readData_2_MPORT_2_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_2_io_readData_2_MPORT_2_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_2_io_readData_2_MPORT_2_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_2_io_readData_3_MPORT_2_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_2_io_readData_3_MPORT_2_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_2_io_readData_3_MPORT_2_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_2_io_readData_4_MPORT_2_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_2_io_readData_4_MPORT_2_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_2_io_readData_4_MPORT_2_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_2_io_readData_5_MPORT_2_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_2_io_readData_5_MPORT_2_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_2_io_readData_5_MPORT_2_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_2_io_readData_6_MPORT_2_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_2_io_readData_6_MPORT_2_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_2_io_readData_6_MPORT_2_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_2_io_readData_7_MPORT_2_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_2_io_readData_7_MPORT_2_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_2_io_readData_7_MPORT_2_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_2_io_readData_8_MPORT_2_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_2_io_readData_8_MPORT_2_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_2_io_readData_8_MPORT_2_data; // @[GlobalBufferAccessParallel.scala 13:32]
  reg [7:0] banks_3 [0:575]; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_3_io_readData_0_MPORT_3_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_3_io_readData_0_MPORT_3_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_3_io_readData_0_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_3_io_readData_1_MPORT_3_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_3_io_readData_1_MPORT_3_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_3_io_readData_1_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_3_io_readData_2_MPORT_3_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_3_io_readData_2_MPORT_3_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_3_io_readData_2_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_3_io_readData_3_MPORT_3_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_3_io_readData_3_MPORT_3_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_3_io_readData_3_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_3_io_readData_4_MPORT_3_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_3_io_readData_4_MPORT_3_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_3_io_readData_4_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_3_io_readData_5_MPORT_3_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_3_io_readData_5_MPORT_3_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_3_io_readData_5_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_3_io_readData_6_MPORT_3_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_3_io_readData_6_MPORT_3_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_3_io_readData_6_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_3_io_readData_7_MPORT_3_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_3_io_readData_7_MPORT_3_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_3_io_readData_7_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  banks_3_io_readData_8_MPORT_3_en; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [9:0] banks_3_io_readData_8_MPORT_3_addr; // @[GlobalBufferAccessParallel.scala 13:32]
  wire [7:0] banks_3_io_readData_8_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 13:32]
  wire  _T = io_bankSel == 2'h0; // @[GlobalBufferAccessParallel.scala 18:23]
  wire [10:0] _io_readData_0_T = {{1'd0}, io_readAddr}; // @[GlobalBufferAccessParallel.scala 19:48]
  wire  _T_1 = io_bankSel == 2'h1; // @[GlobalBufferAccessParallel.scala 20:29]
  wire  _T_2 = io_bankSel == 2'h2; // @[GlobalBufferAccessParallel.scala 22:29]
  wire [7:0] _GEN_3 = io_bankSel == 2'h2 ? banks_2_io_readData_0_MPORT_2_data : banks_3_io_readData_0_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 22:38 23:24 25:24]
  wire  _GEN_6 = io_bankSel == 2'h2 ? 1'h0 : 1'h1; // @[GlobalBufferAccessParallel.scala 13:32 22:38 25:35]
  wire [7:0] _GEN_10 = io_bankSel == 2'h1 ? banks_1_io_readData_0_MPORT_1_data : _GEN_3; // @[GlobalBufferAccessParallel.scala 20:38 21:24]
  wire  _GEN_13 = io_bankSel == 2'h1 ? 1'h0 : _T_2; // @[GlobalBufferAccessParallel.scala 13:32 20:38]
  wire  _GEN_16 = io_bankSel == 2'h1 ? 1'h0 : _GEN_6; // @[GlobalBufferAccessParallel.scala 13:32 20:38]
  wire [7:0] _GEN_33 = io_bankSel == 2'h2 ? banks_2_io_readData_1_MPORT_2_data : banks_3_io_readData_1_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 22:38 23:24 25:24]
  wire [7:0] _GEN_40 = io_bankSel == 2'h1 ? banks_1_io_readData_1_MPORT_1_data : _GEN_33; // @[GlobalBufferAccessParallel.scala 20:38 21:24]
  wire [7:0] _GEN_63 = io_bankSel == 2'h2 ? banks_2_io_readData_2_MPORT_2_data : banks_3_io_readData_2_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 22:38 23:24 25:24]
  wire [7:0] _GEN_70 = io_bankSel == 2'h1 ? banks_1_io_readData_2_MPORT_1_data : _GEN_63; // @[GlobalBufferAccessParallel.scala 20:38 21:24]
  wire [7:0] _GEN_93 = io_bankSel == 2'h2 ? banks_2_io_readData_3_MPORT_2_data : banks_3_io_readData_3_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 22:38 23:24 25:24]
  wire [7:0] _GEN_100 = io_bankSel == 2'h1 ? banks_1_io_readData_3_MPORT_1_data : _GEN_93; // @[GlobalBufferAccessParallel.scala 20:38 21:24]
  wire [7:0] _GEN_123 = io_bankSel == 2'h2 ? banks_2_io_readData_4_MPORT_2_data : banks_3_io_readData_4_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 22:38 23:24 25:24]
  wire [7:0] _GEN_130 = io_bankSel == 2'h1 ? banks_1_io_readData_4_MPORT_1_data : _GEN_123; // @[GlobalBufferAccessParallel.scala 20:38 21:24]
  wire [7:0] _GEN_153 = io_bankSel == 2'h2 ? banks_2_io_readData_5_MPORT_2_data : banks_3_io_readData_5_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 22:38 23:24 25:24]
  wire [7:0] _GEN_160 = io_bankSel == 2'h1 ? banks_1_io_readData_5_MPORT_1_data : _GEN_153; // @[GlobalBufferAccessParallel.scala 20:38 21:24]
  wire [7:0] _GEN_183 = io_bankSel == 2'h2 ? banks_2_io_readData_6_MPORT_2_data : banks_3_io_readData_6_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 22:38 23:24 25:24]
  wire [7:0] _GEN_190 = io_bankSel == 2'h1 ? banks_1_io_readData_6_MPORT_1_data : _GEN_183; // @[GlobalBufferAccessParallel.scala 20:38 21:24]
  wire [7:0] _GEN_213 = io_bankSel == 2'h2 ? banks_2_io_readData_7_MPORT_2_data : banks_3_io_readData_7_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 22:38 23:24 25:24]
  wire [7:0] _GEN_220 = io_bankSel == 2'h1 ? banks_1_io_readData_7_MPORT_1_data : _GEN_213; // @[GlobalBufferAccessParallel.scala 20:38 21:24]
  wire [7:0] _GEN_243 = io_bankSel == 2'h2 ? banks_2_io_readData_8_MPORT_2_data : banks_3_io_readData_8_MPORT_3_data; // @[GlobalBufferAccessParallel.scala 22:38 23:24 25:24]
  wire [7:0] _GEN_250 = io_bankSel == 2'h1 ? banks_1_io_readData_8_MPORT_1_data : _GEN_243; // @[GlobalBufferAccessParallel.scala 20:38 21:24]
  assign banks_0_io_readData_0_MPORT_en = io_bankSel == 2'h0;
  assign banks_0_io_readData_0_MPORT_addr = _io_readData_0_T[9:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_0_MPORT_data = banks_0[banks_0_io_readData_0_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_0_io_readData_0_MPORT_data = banks_0_io_readData_0_MPORT_addr >= 10'h240 ? _RAND_1[7:0] :
    banks_0[banks_0_io_readData_0_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_1_MPORT_en = io_bankSel == 2'h0;
  assign banks_0_io_readData_1_MPORT_addr = io_readAddr + 10'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_1_MPORT_data = banks_0[banks_0_io_readData_1_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_0_io_readData_1_MPORT_data = banks_0_io_readData_1_MPORT_addr >= 10'h240 ? _RAND_2[7:0] :
    banks_0[banks_0_io_readData_1_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_2_MPORT_en = io_bankSel == 2'h0;
  assign banks_0_io_readData_2_MPORT_addr = io_readAddr + 10'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_2_MPORT_data = banks_0[banks_0_io_readData_2_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_0_io_readData_2_MPORT_data = banks_0_io_readData_2_MPORT_addr >= 10'h240 ? _RAND_3[7:0] :
    banks_0[banks_0_io_readData_2_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_3_MPORT_en = io_bankSel == 2'h0;
  assign banks_0_io_readData_3_MPORT_addr = io_readAddr + 10'h3;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_3_MPORT_data = banks_0[banks_0_io_readData_3_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_0_io_readData_3_MPORT_data = banks_0_io_readData_3_MPORT_addr >= 10'h240 ? _RAND_4[7:0] :
    banks_0[banks_0_io_readData_3_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_4_MPORT_en = io_bankSel == 2'h0;
  assign banks_0_io_readData_4_MPORT_addr = io_readAddr + 10'h4;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_4_MPORT_data = banks_0[banks_0_io_readData_4_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_0_io_readData_4_MPORT_data = banks_0_io_readData_4_MPORT_addr >= 10'h240 ? _RAND_5[7:0] :
    banks_0[banks_0_io_readData_4_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_5_MPORT_en = io_bankSel == 2'h0;
  assign banks_0_io_readData_5_MPORT_addr = io_readAddr + 10'h5;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_5_MPORT_data = banks_0[banks_0_io_readData_5_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_0_io_readData_5_MPORT_data = banks_0_io_readData_5_MPORT_addr >= 10'h240 ? _RAND_6[7:0] :
    banks_0[banks_0_io_readData_5_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_6_MPORT_en = io_bankSel == 2'h0;
  assign banks_0_io_readData_6_MPORT_addr = io_readAddr + 10'h6;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_6_MPORT_data = banks_0[banks_0_io_readData_6_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_0_io_readData_6_MPORT_data = banks_0_io_readData_6_MPORT_addr >= 10'h240 ? _RAND_7[7:0] :
    banks_0[banks_0_io_readData_6_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_7_MPORT_en = io_bankSel == 2'h0;
  assign banks_0_io_readData_7_MPORT_addr = io_readAddr + 10'h7;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_7_MPORT_data = banks_0[banks_0_io_readData_7_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_0_io_readData_7_MPORT_data = banks_0_io_readData_7_MPORT_addr >= 10'h240 ? _RAND_8[7:0] :
    banks_0[banks_0_io_readData_7_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_8_MPORT_en = io_bankSel == 2'h0;
  assign banks_0_io_readData_8_MPORT_addr = io_readAddr + 10'h8;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_0_io_readData_8_MPORT_data = banks_0[banks_0_io_readData_8_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_0_io_readData_8_MPORT_data = banks_0_io_readData_8_MPORT_addr >= 10'h240 ? _RAND_9[7:0] :
    banks_0[banks_0_io_readData_8_MPORT_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_0_MPORT_1_en = _T ? 1'h0 : _T_1;
  assign banks_1_io_readData_0_MPORT_1_addr = _io_readData_0_T[9:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_0_MPORT_1_data = banks_1[banks_1_io_readData_0_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_1_io_readData_0_MPORT_1_data = banks_1_io_readData_0_MPORT_1_addr >= 10'h240 ? _RAND_11[7:0] :
    banks_1[banks_1_io_readData_0_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_1_MPORT_1_en = _T ? 1'h0 : _T_1;
  assign banks_1_io_readData_1_MPORT_1_addr = io_readAddr + 10'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_1_MPORT_1_data = banks_1[banks_1_io_readData_1_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_1_io_readData_1_MPORT_1_data = banks_1_io_readData_1_MPORT_1_addr >= 10'h240 ? _RAND_12[7:0] :
    banks_1[banks_1_io_readData_1_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_2_MPORT_1_en = _T ? 1'h0 : _T_1;
  assign banks_1_io_readData_2_MPORT_1_addr = io_readAddr + 10'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_2_MPORT_1_data = banks_1[banks_1_io_readData_2_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_1_io_readData_2_MPORT_1_data = banks_1_io_readData_2_MPORT_1_addr >= 10'h240 ? _RAND_13[7:0] :
    banks_1[banks_1_io_readData_2_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_3_MPORT_1_en = _T ? 1'h0 : _T_1;
  assign banks_1_io_readData_3_MPORT_1_addr = io_readAddr + 10'h3;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_3_MPORT_1_data = banks_1[banks_1_io_readData_3_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_1_io_readData_3_MPORT_1_data = banks_1_io_readData_3_MPORT_1_addr >= 10'h240 ? _RAND_14[7:0] :
    banks_1[banks_1_io_readData_3_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_4_MPORT_1_en = _T ? 1'h0 : _T_1;
  assign banks_1_io_readData_4_MPORT_1_addr = io_readAddr + 10'h4;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_4_MPORT_1_data = banks_1[banks_1_io_readData_4_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_1_io_readData_4_MPORT_1_data = banks_1_io_readData_4_MPORT_1_addr >= 10'h240 ? _RAND_15[7:0] :
    banks_1[banks_1_io_readData_4_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_5_MPORT_1_en = _T ? 1'h0 : _T_1;
  assign banks_1_io_readData_5_MPORT_1_addr = io_readAddr + 10'h5;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_5_MPORT_1_data = banks_1[banks_1_io_readData_5_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_1_io_readData_5_MPORT_1_data = banks_1_io_readData_5_MPORT_1_addr >= 10'h240 ? _RAND_16[7:0] :
    banks_1[banks_1_io_readData_5_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_6_MPORT_1_en = _T ? 1'h0 : _T_1;
  assign banks_1_io_readData_6_MPORT_1_addr = io_readAddr + 10'h6;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_6_MPORT_1_data = banks_1[banks_1_io_readData_6_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_1_io_readData_6_MPORT_1_data = banks_1_io_readData_6_MPORT_1_addr >= 10'h240 ? _RAND_17[7:0] :
    banks_1[banks_1_io_readData_6_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_7_MPORT_1_en = _T ? 1'h0 : _T_1;
  assign banks_1_io_readData_7_MPORT_1_addr = io_readAddr + 10'h7;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_7_MPORT_1_data = banks_1[banks_1_io_readData_7_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_1_io_readData_7_MPORT_1_data = banks_1_io_readData_7_MPORT_1_addr >= 10'h240 ? _RAND_18[7:0] :
    banks_1[banks_1_io_readData_7_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_8_MPORT_1_en = _T ? 1'h0 : _T_1;
  assign banks_1_io_readData_8_MPORT_1_addr = io_readAddr + 10'h8;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_1_io_readData_8_MPORT_1_data = banks_1[banks_1_io_readData_8_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_1_io_readData_8_MPORT_1_data = banks_1_io_readData_8_MPORT_1_addr >= 10'h240 ? _RAND_19[7:0] :
    banks_1[banks_1_io_readData_8_MPORT_1_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_0_MPORT_2_en = _T ? 1'h0 : _GEN_13;
  assign banks_2_io_readData_0_MPORT_2_addr = _io_readData_0_T[9:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_0_MPORT_2_data = banks_2[banks_2_io_readData_0_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_2_io_readData_0_MPORT_2_data = banks_2_io_readData_0_MPORT_2_addr >= 10'h240 ? _RAND_21[7:0] :
    banks_2[banks_2_io_readData_0_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_1_MPORT_2_en = _T ? 1'h0 : _GEN_13;
  assign banks_2_io_readData_1_MPORT_2_addr = io_readAddr + 10'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_1_MPORT_2_data = banks_2[banks_2_io_readData_1_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_2_io_readData_1_MPORT_2_data = banks_2_io_readData_1_MPORT_2_addr >= 10'h240 ? _RAND_22[7:0] :
    banks_2[banks_2_io_readData_1_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_2_MPORT_2_en = _T ? 1'h0 : _GEN_13;
  assign banks_2_io_readData_2_MPORT_2_addr = io_readAddr + 10'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_2_MPORT_2_data = banks_2[banks_2_io_readData_2_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_2_io_readData_2_MPORT_2_data = banks_2_io_readData_2_MPORT_2_addr >= 10'h240 ? _RAND_23[7:0] :
    banks_2[banks_2_io_readData_2_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_3_MPORT_2_en = _T ? 1'h0 : _GEN_13;
  assign banks_2_io_readData_3_MPORT_2_addr = io_readAddr + 10'h3;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_3_MPORT_2_data = banks_2[banks_2_io_readData_3_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_2_io_readData_3_MPORT_2_data = banks_2_io_readData_3_MPORT_2_addr >= 10'h240 ? _RAND_24[7:0] :
    banks_2[banks_2_io_readData_3_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_4_MPORT_2_en = _T ? 1'h0 : _GEN_13;
  assign banks_2_io_readData_4_MPORT_2_addr = io_readAddr + 10'h4;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_4_MPORT_2_data = banks_2[banks_2_io_readData_4_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_2_io_readData_4_MPORT_2_data = banks_2_io_readData_4_MPORT_2_addr >= 10'h240 ? _RAND_25[7:0] :
    banks_2[banks_2_io_readData_4_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_5_MPORT_2_en = _T ? 1'h0 : _GEN_13;
  assign banks_2_io_readData_5_MPORT_2_addr = io_readAddr + 10'h5;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_5_MPORT_2_data = banks_2[banks_2_io_readData_5_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_2_io_readData_5_MPORT_2_data = banks_2_io_readData_5_MPORT_2_addr >= 10'h240 ? _RAND_26[7:0] :
    banks_2[banks_2_io_readData_5_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_6_MPORT_2_en = _T ? 1'h0 : _GEN_13;
  assign banks_2_io_readData_6_MPORT_2_addr = io_readAddr + 10'h6;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_6_MPORT_2_data = banks_2[banks_2_io_readData_6_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_2_io_readData_6_MPORT_2_data = banks_2_io_readData_6_MPORT_2_addr >= 10'h240 ? _RAND_27[7:0] :
    banks_2[banks_2_io_readData_6_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_7_MPORT_2_en = _T ? 1'h0 : _GEN_13;
  assign banks_2_io_readData_7_MPORT_2_addr = io_readAddr + 10'h7;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_7_MPORT_2_data = banks_2[banks_2_io_readData_7_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_2_io_readData_7_MPORT_2_data = banks_2_io_readData_7_MPORT_2_addr >= 10'h240 ? _RAND_28[7:0] :
    banks_2[banks_2_io_readData_7_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_8_MPORT_2_en = _T ? 1'h0 : _GEN_13;
  assign banks_2_io_readData_8_MPORT_2_addr = io_readAddr + 10'h8;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_2_io_readData_8_MPORT_2_data = banks_2[banks_2_io_readData_8_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_2_io_readData_8_MPORT_2_data = banks_2_io_readData_8_MPORT_2_addr >= 10'h240 ? _RAND_29[7:0] :
    banks_2[banks_2_io_readData_8_MPORT_2_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_0_MPORT_3_en = _T ? 1'h0 : _GEN_16;
  assign banks_3_io_readData_0_MPORT_3_addr = _io_readData_0_T[9:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_0_MPORT_3_data = banks_3[banks_3_io_readData_0_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_3_io_readData_0_MPORT_3_data = banks_3_io_readData_0_MPORT_3_addr >= 10'h240 ? _RAND_31[7:0] :
    banks_3[banks_3_io_readData_0_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_1_MPORT_3_en = _T ? 1'h0 : _GEN_16;
  assign banks_3_io_readData_1_MPORT_3_addr = io_readAddr + 10'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_1_MPORT_3_data = banks_3[banks_3_io_readData_1_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_3_io_readData_1_MPORT_3_data = banks_3_io_readData_1_MPORT_3_addr >= 10'h240 ? _RAND_32[7:0] :
    banks_3[banks_3_io_readData_1_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_2_MPORT_3_en = _T ? 1'h0 : _GEN_16;
  assign banks_3_io_readData_2_MPORT_3_addr = io_readAddr + 10'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_2_MPORT_3_data = banks_3[banks_3_io_readData_2_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_3_io_readData_2_MPORT_3_data = banks_3_io_readData_2_MPORT_3_addr >= 10'h240 ? _RAND_33[7:0] :
    banks_3[banks_3_io_readData_2_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_3_MPORT_3_en = _T ? 1'h0 : _GEN_16;
  assign banks_3_io_readData_3_MPORT_3_addr = io_readAddr + 10'h3;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_3_MPORT_3_data = banks_3[banks_3_io_readData_3_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_3_io_readData_3_MPORT_3_data = banks_3_io_readData_3_MPORT_3_addr >= 10'h240 ? _RAND_34[7:0] :
    banks_3[banks_3_io_readData_3_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_4_MPORT_3_en = _T ? 1'h0 : _GEN_16;
  assign banks_3_io_readData_4_MPORT_3_addr = io_readAddr + 10'h4;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_4_MPORT_3_data = banks_3[banks_3_io_readData_4_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_3_io_readData_4_MPORT_3_data = banks_3_io_readData_4_MPORT_3_addr >= 10'h240 ? _RAND_35[7:0] :
    banks_3[banks_3_io_readData_4_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_5_MPORT_3_en = _T ? 1'h0 : _GEN_16;
  assign banks_3_io_readData_5_MPORT_3_addr = io_readAddr + 10'h5;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_5_MPORT_3_data = banks_3[banks_3_io_readData_5_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_3_io_readData_5_MPORT_3_data = banks_3_io_readData_5_MPORT_3_addr >= 10'h240 ? _RAND_36[7:0] :
    banks_3[banks_3_io_readData_5_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_6_MPORT_3_en = _T ? 1'h0 : _GEN_16;
  assign banks_3_io_readData_6_MPORT_3_addr = io_readAddr + 10'h6;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_6_MPORT_3_data = banks_3[banks_3_io_readData_6_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_3_io_readData_6_MPORT_3_data = banks_3_io_readData_6_MPORT_3_addr >= 10'h240 ? _RAND_37[7:0] :
    banks_3[banks_3_io_readData_6_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_7_MPORT_3_en = _T ? 1'h0 : _GEN_16;
  assign banks_3_io_readData_7_MPORT_3_addr = io_readAddr + 10'h7;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_7_MPORT_3_data = banks_3[banks_3_io_readData_7_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_3_io_readData_7_MPORT_3_data = banks_3_io_readData_7_MPORT_3_addr >= 10'h240 ? _RAND_38[7:0] :
    banks_3[banks_3_io_readData_7_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_8_MPORT_3_en = _T ? 1'h0 : _GEN_16;
  assign banks_3_io_readData_8_MPORT_3_addr = io_readAddr + 10'h8;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign banks_3_io_readData_8_MPORT_3_data = banks_3[banks_3_io_readData_8_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `else
  assign banks_3_io_readData_8_MPORT_3_data = banks_3_io_readData_8_MPORT_3_addr >= 10'h240 ? _RAND_39[7:0] :
    banks_3[banks_3_io_readData_8_MPORT_3_addr]; // @[GlobalBufferAccessParallel.scala 13:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign io_readData_0 = io_bankSel == 2'h0 ? banks_0_io_readData_0_MPORT_data : _GEN_10; // @[GlobalBufferAccessParallel.scala 18:32 19:24]
  assign io_readData_1 = io_bankSel == 2'h0 ? banks_0_io_readData_1_MPORT_data : _GEN_40; // @[GlobalBufferAccessParallel.scala 18:32 19:24]
  assign io_readData_2 = io_bankSel == 2'h0 ? banks_0_io_readData_2_MPORT_data : _GEN_70; // @[GlobalBufferAccessParallel.scala 18:32 19:24]
  assign io_readData_3 = io_bankSel == 2'h0 ? banks_0_io_readData_3_MPORT_data : _GEN_100; // @[GlobalBufferAccessParallel.scala 18:32 19:24]
  assign io_readData_4 = io_bankSel == 2'h0 ? banks_0_io_readData_4_MPORT_data : _GEN_130; // @[GlobalBufferAccessParallel.scala 18:32 19:24]
  assign io_readData_5 = io_bankSel == 2'h0 ? banks_0_io_readData_5_MPORT_data : _GEN_160; // @[GlobalBufferAccessParallel.scala 18:32 19:24]
  assign io_readData_6 = io_bankSel == 2'h0 ? banks_0_io_readData_6_MPORT_data : _GEN_190; // @[GlobalBufferAccessParallel.scala 18:32 19:24]
  assign io_readData_7 = io_bankSel == 2'h0 ? banks_0_io_readData_7_MPORT_data : _GEN_220; // @[GlobalBufferAccessParallel.scala 18:32 19:24]
  assign io_readData_8 = io_bankSel == 2'h0 ? banks_0_io_readData_8_MPORT_data : _GEN_250; // @[GlobalBufferAccessParallel.scala 18:32 19:24]
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
  _RAND_2 = {1{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
  _RAND_4 = {1{`RANDOM}};
  _RAND_5 = {1{`RANDOM}};
  _RAND_6 = {1{`RANDOM}};
  _RAND_7 = {1{`RANDOM}};
  _RAND_8 = {1{`RANDOM}};
  _RAND_9 = {1{`RANDOM}};
  _RAND_11 = {1{`RANDOM}};
  _RAND_12 = {1{`RANDOM}};
  _RAND_13 = {1{`RANDOM}};
  _RAND_14 = {1{`RANDOM}};
  _RAND_15 = {1{`RANDOM}};
  _RAND_16 = {1{`RANDOM}};
  _RAND_17 = {1{`RANDOM}};
  _RAND_18 = {1{`RANDOM}};
  _RAND_19 = {1{`RANDOM}};
  _RAND_21 = {1{`RANDOM}};
  _RAND_22 = {1{`RANDOM}};
  _RAND_23 = {1{`RANDOM}};
  _RAND_24 = {1{`RANDOM}};
  _RAND_25 = {1{`RANDOM}};
  _RAND_26 = {1{`RANDOM}};
  _RAND_27 = {1{`RANDOM}};
  _RAND_28 = {1{`RANDOM}};
  _RAND_29 = {1{`RANDOM}};
  _RAND_31 = {1{`RANDOM}};
  _RAND_32 = {1{`RANDOM}};
  _RAND_33 = {1{`RANDOM}};
  _RAND_34 = {1{`RANDOM}};
  _RAND_35 = {1{`RANDOM}};
  _RAND_36 = {1{`RANDOM}};
  _RAND_37 = {1{`RANDOM}};
  _RAND_38 = {1{`RANDOM}};
  _RAND_39 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 576; initvar = initvar+1)
    banks_0[initvar] = _RAND_0[7:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 576; initvar = initvar+1)
    banks_1[initvar] = _RAND_10[7:0];
  _RAND_20 = {1{`RANDOM}};
  for (initvar = 0; initvar < 576; initvar = initvar+1)
    banks_2[initvar] = _RAND_20[7:0];
  _RAND_30 = {1{`RANDOM}};
  for (initvar = 0; initvar < 576; initvar = initvar+1)
    banks_3[initvar] = _RAND_30[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
