module BufferAccumulator(
  input        clock,
  input        reset,
  input  [7:0] io_adcValues_0,
  input  [7:0] io_adcValues_1,
  input  [7:0] io_adcValues_2,
  input  [7:0] io_adcValues_3,
  input  [7:0] io_adcValues_4,
  input  [7:0] io_adcValues_5,
  input  [7:0] io_adcValues_6,
  input  [7:0] io_adcValues_7,
  input  [7:0] io_adcValues_8,
  input  [7:0] io_adcValues_9,
  input  [7:0] io_adcValues_10,
  input  [7:0] io_adcValues_11,
  input  [7:0] io_adcValues_12,
  input  [7:0] io_adcValues_13,
  input  [7:0] io_adcValues_14,
  input  [7:0] io_adcValues_15,
  input  [7:0] io_adcValues_16,
  input  [7:0] io_adcValues_17,
  input  [7:0] io_adcValues_18,
  input  [7:0] io_adcValues_19,
  input  [7:0] io_adcValues_20,
  input  [7:0] io_adcValues_21,
  input  [7:0] io_adcValues_22,
  input  [7:0] io_adcValues_23,
  input  [7:0] io_adcValues_24,
  input  [7:0] io_adcValues_25,
  input  [7:0] io_adcValues_26,
  input  [7:0] io_adcValues_27,
  input  [7:0] io_adcValues_28,
  input  [7:0] io_adcValues_29,
  input  [7:0] io_adcValues_30,
  input  [7:0] io_adcValues_31,
  input  [7:0] io_adcValues_32,
  input  [7:0] io_adcValues_33,
  input  [7:0] io_adcValues_34,
  input  [7:0] io_adcValues_35,
  input  [7:0] io_adcValues_36,
  input  [7:0] io_adcValues_37,
  input  [7:0] io_adcValues_38,
  input  [7:0] io_adcValues_39,
  input  [7:0] io_adcValues_40,
  input  [7:0] io_adcValues_41,
  input  [7:0] io_adcValues_42,
  input  [7:0] io_adcValues_43,
  input  [7:0] io_adcValues_44,
  input  [7:0] io_adcValues_45,
  input  [7:0] io_adcValues_46,
  input  [7:0] io_adcValues_47,
  input  [7:0] io_adcValues_48,
  input  [7:0] io_adcValues_49,
  input  [7:0] io_adcValues_50,
  input  [7:0] io_adcValues_51,
  input  [7:0] io_adcValues_52,
  input  [7:0] io_adcValues_53,
  input  [7:0] io_adcValues_54,
  input  [7:0] io_adcValues_55,
  input  [7:0] io_adcValues_56,
  input  [7:0] io_adcValues_57,
  input  [7:0] io_adcValues_58,
  input  [7:0] io_adcValues_59,
  input  [7:0] io_adcValues_60,
  input  [7:0] io_adcValues_61,
  input  [7:0] io_adcValues_62,
  input  [7:0] io_adcValues_63,
  input  [7:0] io_adcValues_64,
  input  [7:0] io_adcValues_65,
  input  [7:0] io_adcValues_66,
  input  [7:0] io_adcValues_67,
  input  [7:0] io_adcValues_68,
  input  [7:0] io_adcValues_69,
  input  [7:0] io_adcValues_70,
  input  [7:0] io_adcValues_71,
  input  [7:0] io_adcValues_72,
  input  [7:0] io_adcValues_73,
  input  [7:0] io_adcValues_74,
  input  [7:0] io_adcValues_75,
  input  [7:0] io_adcValues_76,
  input  [7:0] io_adcValues_77,
  input  [7:0] io_adcValues_78,
  input  [7:0] io_adcValues_79,
  input  [7:0] io_adcValues_80,
  input  [7:0] io_adcValues_81,
  input  [7:0] io_adcValues_82,
  input  [7:0] io_adcValues_83,
  input  [7:0] io_adcValues_84,
  input  [7:0] io_adcValues_85,
  input  [7:0] io_adcValues_86,
  input  [7:0] io_adcValues_87,
  input  [7:0] io_adcValues_88,
  input  [7:0] io_adcValues_89,
  input  [7:0] io_adcValues_90,
  input  [7:0] io_adcValues_91,
  input  [7:0] io_adcValues_92,
  input  [7:0] io_adcValues_93,
  input  [7:0] io_adcValues_94,
  input  [7:0] io_adcValues_95,
  input  [7:0] io_adcValues_96,
  input  [7:0] io_adcValues_97,
  input  [7:0] io_adcValues_98,
  input  [7:0] io_adcValues_99,
  input  [7:0] io_adcValues_100,
  input  [7:0] io_adcValues_101,
  input  [7:0] io_adcValues_102,
  input  [7:0] io_adcValues_103,
  input  [7:0] io_adcValues_104,
  input  [7:0] io_adcValues_105,
  input  [7:0] io_adcValues_106,
  input  [7:0] io_adcValues_107,
  input  [7:0] io_adcValues_108,
  input  [7:0] io_adcValues_109,
  input  [7:0] io_adcValues_110,
  input  [7:0] io_adcValues_111,
  input  [7:0] io_adcValues_112,
  input  [7:0] io_adcValues_113,
  input  [7:0] io_adcValues_114,
  input  [7:0] io_adcValues_115,
  input  [7:0] io_adcValues_116,
  input  [7:0] io_adcValues_117,
  input  [7:0] io_adcValues_118,
  input  [7:0] io_adcValues_119,
  input  [7:0] io_adcValues_120,
  input  [7:0] io_adcValues_121,
  input  [7:0] io_adcValues_122,
  input  [7:0] io_adcValues_123,
  input  [7:0] io_adcValues_124,
  input  [7:0] io_adcValues_125,
  input  [7:0] io_adcValues_126,
  input  [7:0] io_adcValues_127,
  output [7:0] io_zeroSums_0,
  output [7:0] io_zeroSums_1,
  output [7:0] io_zeroSums_2,
  output [7:0] io_zeroSums_3,
  output [7:0] io_zeroSums_4,
  output [7:0] io_zeroSums_5,
  output [7:0] io_zeroSums_6,
  output [7:0] io_zeroSums_7
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] zeroAccumulators_0; // @[BufferAccumulator.scala 12:33]
  reg [7:0] zeroAccumulators_1; // @[BufferAccumulator.scala 12:33]
  reg [7:0] zeroAccumulators_2; // @[BufferAccumulator.scala 12:33]
  reg [7:0] zeroAccumulators_3; // @[BufferAccumulator.scala 12:33]
  reg [7:0] zeroAccumulators_4; // @[BufferAccumulator.scala 12:33]
  reg [7:0] zeroAccumulators_5; // @[BufferAccumulator.scala 12:33]
  reg [7:0] zeroAccumulators_6; // @[BufferAccumulator.scala 12:33]
  reg [7:0] zeroAccumulators_7; // @[BufferAccumulator.scala 12:33]
  reg [3:0] lineCounter; // @[BufferAccumulator.scala 14:28]
  wire [3:0] _lineCounter_T_1 = lineCounter + 4'h1; // @[BufferAccumulator.scala 20:32]
  wire [1:0] _zeroCount_T_16 = {{1'd0}, io_adcValues_0 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [1:0] _GEN_9 = {{1'd0}, io_adcValues_1 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _zeroCount_T_17 = _zeroCount_T_16 + _GEN_9; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _GEN_10 = {{2'd0}, io_adcValues_2 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _zeroCount_T_18 = _zeroCount_T_17 + _GEN_10; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _GEN_11 = {{3'd0}, io_adcValues_3 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _zeroCount_T_19 = _zeroCount_T_18 + _GEN_11; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _GEN_12 = {{4'd0}, io_adcValues_4 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _zeroCount_T_20 = _zeroCount_T_19 + _GEN_12; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _GEN_13 = {{5'd0}, io_adcValues_5 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _zeroCount_T_21 = _zeroCount_T_20 + _GEN_13; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _GEN_14 = {{6'd0}, io_adcValues_6 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _zeroCount_T_22 = _zeroCount_T_21 + _GEN_14; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _GEN_15 = {{7'd0}, io_adcValues_7 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _zeroCount_T_23 = _zeroCount_T_22 + _GEN_15; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _GEN_16 = {{8'd0}, io_adcValues_8 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _zeroCount_T_24 = _zeroCount_T_23 + _GEN_16; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _GEN_17 = {{9'd0}, io_adcValues_9 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _zeroCount_T_25 = _zeroCount_T_24 + _GEN_17; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _GEN_18 = {{10'd0}, io_adcValues_10 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _zeroCount_T_26 = _zeroCount_T_25 + _GEN_18; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _GEN_19 = {{11'd0}, io_adcValues_11 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _zeroCount_T_27 = _zeroCount_T_26 + _GEN_19; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _GEN_20 = {{12'd0}, io_adcValues_12 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _zeroCount_T_28 = _zeroCount_T_27 + _GEN_20; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _GEN_21 = {{13'd0}, io_adcValues_13 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _zeroCount_T_29 = _zeroCount_T_28 + _GEN_21; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _GEN_22 = {{14'd0}, io_adcValues_14 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _zeroCount_T_30 = _zeroCount_T_29 + _GEN_22; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _GEN_23 = {{15'd0}, io_adcValues_15 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [16:0] zeroCount = _zeroCount_T_30 + _GEN_23; // @[BufferAccumulator.scala 24:70]
  wire [16:0] _GEN_24 = {{9'd0}, zeroAccumulators_0}; // @[BufferAccumulator.scala 26:50]
  wire [16:0] _zeroAccumulators_0_T_1 = _GEN_24 + zeroCount; // @[BufferAccumulator.scala 26:50]
  wire [1:0] _zeroCount_T_47 = {{1'd0}, io_adcValues_16 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [1:0] _GEN_25 = {{1'd0}, io_adcValues_17 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _zeroCount_T_48 = _zeroCount_T_47 + _GEN_25; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _GEN_26 = {{2'd0}, io_adcValues_18 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _zeroCount_T_49 = _zeroCount_T_48 + _GEN_26; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _GEN_27 = {{3'd0}, io_adcValues_19 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _zeroCount_T_50 = _zeroCount_T_49 + _GEN_27; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _GEN_28 = {{4'd0}, io_adcValues_20 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _zeroCount_T_51 = _zeroCount_T_50 + _GEN_28; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _GEN_29 = {{5'd0}, io_adcValues_21 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _zeroCount_T_52 = _zeroCount_T_51 + _GEN_29; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _GEN_30 = {{6'd0}, io_adcValues_22 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _zeroCount_T_53 = _zeroCount_T_52 + _GEN_30; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _GEN_31 = {{7'd0}, io_adcValues_23 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _zeroCount_T_54 = _zeroCount_T_53 + _GEN_31; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _GEN_32 = {{8'd0}, io_adcValues_24 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _zeroCount_T_55 = _zeroCount_T_54 + _GEN_32; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _GEN_33 = {{9'd0}, io_adcValues_25 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _zeroCount_T_56 = _zeroCount_T_55 + _GEN_33; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _GEN_34 = {{10'd0}, io_adcValues_26 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _zeroCount_T_57 = _zeroCount_T_56 + _GEN_34; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _GEN_35 = {{11'd0}, io_adcValues_27 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _zeroCount_T_58 = _zeroCount_T_57 + _GEN_35; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _GEN_36 = {{12'd0}, io_adcValues_28 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _zeroCount_T_59 = _zeroCount_T_58 + _GEN_36; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _GEN_37 = {{13'd0}, io_adcValues_29 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _zeroCount_T_60 = _zeroCount_T_59 + _GEN_37; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _GEN_38 = {{14'd0}, io_adcValues_30 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _zeroCount_T_61 = _zeroCount_T_60 + _GEN_38; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _GEN_39 = {{15'd0}, io_adcValues_31 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [16:0] zeroCount_1 = _zeroCount_T_61 + _GEN_39; // @[BufferAccumulator.scala 24:70]
  wire [16:0] _GEN_40 = {{9'd0}, zeroAccumulators_1}; // @[BufferAccumulator.scala 26:50]
  wire [16:0] _zeroAccumulators_1_T_1 = _GEN_40 + zeroCount_1; // @[BufferAccumulator.scala 26:50]
  wire [1:0] _zeroCount_T_78 = {{1'd0}, io_adcValues_32 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [1:0] _GEN_41 = {{1'd0}, io_adcValues_33 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _zeroCount_T_79 = _zeroCount_T_78 + _GEN_41; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _GEN_42 = {{2'd0}, io_adcValues_34 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _zeroCount_T_80 = _zeroCount_T_79 + _GEN_42; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _GEN_43 = {{3'd0}, io_adcValues_35 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _zeroCount_T_81 = _zeroCount_T_80 + _GEN_43; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _GEN_44 = {{4'd0}, io_adcValues_36 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _zeroCount_T_82 = _zeroCount_T_81 + _GEN_44; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _GEN_45 = {{5'd0}, io_adcValues_37 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _zeroCount_T_83 = _zeroCount_T_82 + _GEN_45; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _GEN_46 = {{6'd0}, io_adcValues_38 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _zeroCount_T_84 = _zeroCount_T_83 + _GEN_46; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _GEN_47 = {{7'd0}, io_adcValues_39 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _zeroCount_T_85 = _zeroCount_T_84 + _GEN_47; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _GEN_48 = {{8'd0}, io_adcValues_40 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _zeroCount_T_86 = _zeroCount_T_85 + _GEN_48; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _GEN_49 = {{9'd0}, io_adcValues_41 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _zeroCount_T_87 = _zeroCount_T_86 + _GEN_49; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _GEN_50 = {{10'd0}, io_adcValues_42 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _zeroCount_T_88 = _zeroCount_T_87 + _GEN_50; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _GEN_51 = {{11'd0}, io_adcValues_43 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _zeroCount_T_89 = _zeroCount_T_88 + _GEN_51; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _GEN_52 = {{12'd0}, io_adcValues_44 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _zeroCount_T_90 = _zeroCount_T_89 + _GEN_52; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _GEN_53 = {{13'd0}, io_adcValues_45 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _zeroCount_T_91 = _zeroCount_T_90 + _GEN_53; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _GEN_54 = {{14'd0}, io_adcValues_46 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _zeroCount_T_92 = _zeroCount_T_91 + _GEN_54; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _GEN_55 = {{15'd0}, io_adcValues_47 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [16:0] zeroCount_2 = _zeroCount_T_92 + _GEN_55; // @[BufferAccumulator.scala 24:70]
  wire [16:0] _GEN_56 = {{9'd0}, zeroAccumulators_2}; // @[BufferAccumulator.scala 26:50]
  wire [16:0] _zeroAccumulators_2_T_1 = _GEN_56 + zeroCount_2; // @[BufferAccumulator.scala 26:50]
  wire [1:0] _zeroCount_T_109 = {{1'd0}, io_adcValues_48 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [1:0] _GEN_57 = {{1'd0}, io_adcValues_49 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _zeroCount_T_110 = _zeroCount_T_109 + _GEN_57; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _GEN_58 = {{2'd0}, io_adcValues_50 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _zeroCount_T_111 = _zeroCount_T_110 + _GEN_58; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _GEN_59 = {{3'd0}, io_adcValues_51 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _zeroCount_T_112 = _zeroCount_T_111 + _GEN_59; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _GEN_60 = {{4'd0}, io_adcValues_52 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _zeroCount_T_113 = _zeroCount_T_112 + _GEN_60; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _GEN_61 = {{5'd0}, io_adcValues_53 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _zeroCount_T_114 = _zeroCount_T_113 + _GEN_61; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _GEN_62 = {{6'd0}, io_adcValues_54 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _zeroCount_T_115 = _zeroCount_T_114 + _GEN_62; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _GEN_63 = {{7'd0}, io_adcValues_55 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _zeroCount_T_116 = _zeroCount_T_115 + _GEN_63; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _GEN_64 = {{8'd0}, io_adcValues_56 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _zeroCount_T_117 = _zeroCount_T_116 + _GEN_64; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _GEN_65 = {{9'd0}, io_adcValues_57 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _zeroCount_T_118 = _zeroCount_T_117 + _GEN_65; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _GEN_66 = {{10'd0}, io_adcValues_58 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _zeroCount_T_119 = _zeroCount_T_118 + _GEN_66; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _GEN_67 = {{11'd0}, io_adcValues_59 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _zeroCount_T_120 = _zeroCount_T_119 + _GEN_67; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _GEN_68 = {{12'd0}, io_adcValues_60 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _zeroCount_T_121 = _zeroCount_T_120 + _GEN_68; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _GEN_69 = {{13'd0}, io_adcValues_61 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _zeroCount_T_122 = _zeroCount_T_121 + _GEN_69; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _GEN_70 = {{14'd0}, io_adcValues_62 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _zeroCount_T_123 = _zeroCount_T_122 + _GEN_70; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _GEN_71 = {{15'd0}, io_adcValues_63 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [16:0] zeroCount_3 = _zeroCount_T_123 + _GEN_71; // @[BufferAccumulator.scala 24:70]
  wire [16:0] _GEN_72 = {{9'd0}, zeroAccumulators_3}; // @[BufferAccumulator.scala 26:50]
  wire [16:0] _zeroAccumulators_3_T_1 = _GEN_72 + zeroCount_3; // @[BufferAccumulator.scala 26:50]
  wire [1:0] _zeroCount_T_140 = {{1'd0}, io_adcValues_64 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [1:0] _GEN_73 = {{1'd0}, io_adcValues_65 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _zeroCount_T_141 = _zeroCount_T_140 + _GEN_73; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _GEN_74 = {{2'd0}, io_adcValues_66 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _zeroCount_T_142 = _zeroCount_T_141 + _GEN_74; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _GEN_75 = {{3'd0}, io_adcValues_67 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _zeroCount_T_143 = _zeroCount_T_142 + _GEN_75; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _GEN_76 = {{4'd0}, io_adcValues_68 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _zeroCount_T_144 = _zeroCount_T_143 + _GEN_76; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _GEN_77 = {{5'd0}, io_adcValues_69 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _zeroCount_T_145 = _zeroCount_T_144 + _GEN_77; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _GEN_78 = {{6'd0}, io_adcValues_70 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _zeroCount_T_146 = _zeroCount_T_145 + _GEN_78; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _GEN_79 = {{7'd0}, io_adcValues_71 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _zeroCount_T_147 = _zeroCount_T_146 + _GEN_79; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _GEN_80 = {{8'd0}, io_adcValues_72 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _zeroCount_T_148 = _zeroCount_T_147 + _GEN_80; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _GEN_81 = {{9'd0}, io_adcValues_73 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _zeroCount_T_149 = _zeroCount_T_148 + _GEN_81; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _GEN_82 = {{10'd0}, io_adcValues_74 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _zeroCount_T_150 = _zeroCount_T_149 + _GEN_82; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _GEN_83 = {{11'd0}, io_adcValues_75 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _zeroCount_T_151 = _zeroCount_T_150 + _GEN_83; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _GEN_84 = {{12'd0}, io_adcValues_76 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _zeroCount_T_152 = _zeroCount_T_151 + _GEN_84; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _GEN_85 = {{13'd0}, io_adcValues_77 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _zeroCount_T_153 = _zeroCount_T_152 + _GEN_85; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _GEN_86 = {{14'd0}, io_adcValues_78 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _zeroCount_T_154 = _zeroCount_T_153 + _GEN_86; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _GEN_87 = {{15'd0}, io_adcValues_79 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [16:0] zeroCount_4 = _zeroCount_T_154 + _GEN_87; // @[BufferAccumulator.scala 24:70]
  wire [16:0] _GEN_88 = {{9'd0}, zeroAccumulators_4}; // @[BufferAccumulator.scala 26:50]
  wire [16:0] _zeroAccumulators_4_T_1 = _GEN_88 + zeroCount_4; // @[BufferAccumulator.scala 26:50]
  wire [1:0] _zeroCount_T_171 = {{1'd0}, io_adcValues_80 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [1:0] _GEN_89 = {{1'd0}, io_adcValues_81 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _zeroCount_T_172 = _zeroCount_T_171 + _GEN_89; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _GEN_90 = {{2'd0}, io_adcValues_82 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _zeroCount_T_173 = _zeroCount_T_172 + _GEN_90; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _GEN_91 = {{3'd0}, io_adcValues_83 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _zeroCount_T_174 = _zeroCount_T_173 + _GEN_91; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _GEN_92 = {{4'd0}, io_adcValues_84 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _zeroCount_T_175 = _zeroCount_T_174 + _GEN_92; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _GEN_93 = {{5'd0}, io_adcValues_85 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _zeroCount_T_176 = _zeroCount_T_175 + _GEN_93; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _GEN_94 = {{6'd0}, io_adcValues_86 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _zeroCount_T_177 = _zeroCount_T_176 + _GEN_94; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _GEN_95 = {{7'd0}, io_adcValues_87 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _zeroCount_T_178 = _zeroCount_T_177 + _GEN_95; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _GEN_96 = {{8'd0}, io_adcValues_88 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _zeroCount_T_179 = _zeroCount_T_178 + _GEN_96; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _GEN_97 = {{9'd0}, io_adcValues_89 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _zeroCount_T_180 = _zeroCount_T_179 + _GEN_97; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _GEN_98 = {{10'd0}, io_adcValues_90 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _zeroCount_T_181 = _zeroCount_T_180 + _GEN_98; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _GEN_99 = {{11'd0}, io_adcValues_91 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _zeroCount_T_182 = _zeroCount_T_181 + _GEN_99; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _GEN_100 = {{12'd0}, io_adcValues_92 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _zeroCount_T_183 = _zeroCount_T_182 + _GEN_100; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _GEN_101 = {{13'd0}, io_adcValues_93 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _zeroCount_T_184 = _zeroCount_T_183 + _GEN_101; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _GEN_102 = {{14'd0}, io_adcValues_94 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _zeroCount_T_185 = _zeroCount_T_184 + _GEN_102; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _GEN_103 = {{15'd0}, io_adcValues_95 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [16:0] zeroCount_5 = _zeroCount_T_185 + _GEN_103; // @[BufferAccumulator.scala 24:70]
  wire [16:0] _GEN_104 = {{9'd0}, zeroAccumulators_5}; // @[BufferAccumulator.scala 26:50]
  wire [16:0] _zeroAccumulators_5_T_1 = _GEN_104 + zeroCount_5; // @[BufferAccumulator.scala 26:50]
  wire [1:0] _zeroCount_T_202 = {{1'd0}, io_adcValues_96 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [1:0] _GEN_105 = {{1'd0}, io_adcValues_97 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _zeroCount_T_203 = _zeroCount_T_202 + _GEN_105; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _GEN_106 = {{2'd0}, io_adcValues_98 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _zeroCount_T_204 = _zeroCount_T_203 + _GEN_106; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _GEN_107 = {{3'd0}, io_adcValues_99 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _zeroCount_T_205 = _zeroCount_T_204 + _GEN_107; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _GEN_108 = {{4'd0}, io_adcValues_100 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _zeroCount_T_206 = _zeroCount_T_205 + _GEN_108; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _GEN_109 = {{5'd0}, io_adcValues_101 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _zeroCount_T_207 = _zeroCount_T_206 + _GEN_109; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _GEN_110 = {{6'd0}, io_adcValues_102 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _zeroCount_T_208 = _zeroCount_T_207 + _GEN_110; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _GEN_111 = {{7'd0}, io_adcValues_103 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _zeroCount_T_209 = _zeroCount_T_208 + _GEN_111; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _GEN_112 = {{8'd0}, io_adcValues_104 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _zeroCount_T_210 = _zeroCount_T_209 + _GEN_112; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _GEN_113 = {{9'd0}, io_adcValues_105 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _zeroCount_T_211 = _zeroCount_T_210 + _GEN_113; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _GEN_114 = {{10'd0}, io_adcValues_106 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _zeroCount_T_212 = _zeroCount_T_211 + _GEN_114; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _GEN_115 = {{11'd0}, io_adcValues_107 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _zeroCount_T_213 = _zeroCount_T_212 + _GEN_115; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _GEN_116 = {{12'd0}, io_adcValues_108 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _zeroCount_T_214 = _zeroCount_T_213 + _GEN_116; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _GEN_117 = {{13'd0}, io_adcValues_109 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _zeroCount_T_215 = _zeroCount_T_214 + _GEN_117; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _GEN_118 = {{14'd0}, io_adcValues_110 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _zeroCount_T_216 = _zeroCount_T_215 + _GEN_118; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _GEN_119 = {{15'd0}, io_adcValues_111 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [16:0] zeroCount_6 = _zeroCount_T_216 + _GEN_119; // @[BufferAccumulator.scala 24:70]
  wire [16:0] _GEN_120 = {{9'd0}, zeroAccumulators_6}; // @[BufferAccumulator.scala 26:50]
  wire [16:0] _zeroAccumulators_6_T_1 = _GEN_120 + zeroCount_6; // @[BufferAccumulator.scala 26:50]
  wire [1:0] _zeroCount_T_233 = {{1'd0}, io_adcValues_112 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [1:0] _GEN_121 = {{1'd0}, io_adcValues_113 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _zeroCount_T_234 = _zeroCount_T_233 + _GEN_121; // @[BufferAccumulator.scala 24:70]
  wire [2:0] _GEN_122 = {{2'd0}, io_adcValues_114 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _zeroCount_T_235 = _zeroCount_T_234 + _GEN_122; // @[BufferAccumulator.scala 24:70]
  wire [3:0] _GEN_123 = {{3'd0}, io_adcValues_115 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _zeroCount_T_236 = _zeroCount_T_235 + _GEN_123; // @[BufferAccumulator.scala 24:70]
  wire [4:0] _GEN_124 = {{4'd0}, io_adcValues_116 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _zeroCount_T_237 = _zeroCount_T_236 + _GEN_124; // @[BufferAccumulator.scala 24:70]
  wire [5:0] _GEN_125 = {{5'd0}, io_adcValues_117 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _zeroCount_T_238 = _zeroCount_T_237 + _GEN_125; // @[BufferAccumulator.scala 24:70]
  wire [6:0] _GEN_126 = {{6'd0}, io_adcValues_118 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _zeroCount_T_239 = _zeroCount_T_238 + _GEN_126; // @[BufferAccumulator.scala 24:70]
  wire [7:0] _GEN_127 = {{7'd0}, io_adcValues_119 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _zeroCount_T_240 = _zeroCount_T_239 + _GEN_127; // @[BufferAccumulator.scala 24:70]
  wire [8:0] _GEN_128 = {{8'd0}, io_adcValues_120 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _zeroCount_T_241 = _zeroCount_T_240 + _GEN_128; // @[BufferAccumulator.scala 24:70]
  wire [9:0] _GEN_129 = {{9'd0}, io_adcValues_121 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _zeroCount_T_242 = _zeroCount_T_241 + _GEN_129; // @[BufferAccumulator.scala 24:70]
  wire [10:0] _GEN_130 = {{10'd0}, io_adcValues_122 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _zeroCount_T_243 = _zeroCount_T_242 + _GEN_130; // @[BufferAccumulator.scala 24:70]
  wire [11:0] _GEN_131 = {{11'd0}, io_adcValues_123 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _zeroCount_T_244 = _zeroCount_T_243 + _GEN_131; // @[BufferAccumulator.scala 24:70]
  wire [12:0] _GEN_132 = {{12'd0}, io_adcValues_124 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _zeroCount_T_245 = _zeroCount_T_244 + _GEN_132; // @[BufferAccumulator.scala 24:70]
  wire [13:0] _GEN_133 = {{13'd0}, io_adcValues_125 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _zeroCount_T_246 = _zeroCount_T_245 + _GEN_133; // @[BufferAccumulator.scala 24:70]
  wire [14:0] _GEN_134 = {{14'd0}, io_adcValues_126 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _zeroCount_T_247 = _zeroCount_T_246 + _GEN_134; // @[BufferAccumulator.scala 24:70]
  wire [15:0] _GEN_135 = {{15'd0}, io_adcValues_127 == 8'h0}; // @[BufferAccumulator.scala 24:70]
  wire [16:0] zeroCount_7 = _zeroCount_T_247 + _GEN_135; // @[BufferAccumulator.scala 24:70]
  wire [16:0] _GEN_136 = {{9'd0}, zeroAccumulators_7}; // @[BufferAccumulator.scala 26:50]
  wire [16:0] _zeroAccumulators_7_T_1 = _GEN_136 + zeroCount_7; // @[BufferAccumulator.scala 26:50]
  wire [16:0] _GEN_1 = lineCounter == 4'hf ? 17'h0 : _zeroAccumulators_0_T_1; // @[BufferAccumulator.scala 16:30 18:22 26:27]
  wire [16:0] _GEN_2 = lineCounter == 4'hf ? 17'h0 : _zeroAccumulators_1_T_1; // @[BufferAccumulator.scala 16:30 18:22 26:27]
  wire [16:0] _GEN_3 = lineCounter == 4'hf ? 17'h0 : _zeroAccumulators_2_T_1; // @[BufferAccumulator.scala 16:30 18:22 26:27]
  wire [16:0] _GEN_4 = lineCounter == 4'hf ? 17'h0 : _zeroAccumulators_3_T_1; // @[BufferAccumulator.scala 16:30 18:22 26:27]
  wire [16:0] _GEN_5 = lineCounter == 4'hf ? 17'h0 : _zeroAccumulators_4_T_1; // @[BufferAccumulator.scala 16:30 18:22 26:27]
  wire [16:0] _GEN_6 = lineCounter == 4'hf ? 17'h0 : _zeroAccumulators_5_T_1; // @[BufferAccumulator.scala 16:30 18:22 26:27]
  wire [16:0] _GEN_7 = lineCounter == 4'hf ? 17'h0 : _zeroAccumulators_6_T_1; // @[BufferAccumulator.scala 16:30 18:22 26:27]
  wire [16:0] _GEN_8 = lineCounter == 4'hf ? 17'h0 : _zeroAccumulators_7_T_1; // @[BufferAccumulator.scala 16:30 18:22 26:27]
  wire [16:0] _GEN_137 = reset ? 17'h0 : _GEN_1; // @[BufferAccumulator.scala 12:{33,33}]
  wire [16:0] _GEN_138 = reset ? 17'h0 : _GEN_2; // @[BufferAccumulator.scala 12:{33,33}]
  wire [16:0] _GEN_139 = reset ? 17'h0 : _GEN_3; // @[BufferAccumulator.scala 12:{33,33}]
  wire [16:0] _GEN_140 = reset ? 17'h0 : _GEN_4; // @[BufferAccumulator.scala 12:{33,33}]
  wire [16:0] _GEN_141 = reset ? 17'h0 : _GEN_5; // @[BufferAccumulator.scala 12:{33,33}]
  wire [16:0] _GEN_142 = reset ? 17'h0 : _GEN_6; // @[BufferAccumulator.scala 12:{33,33}]
  wire [16:0] _GEN_143 = reset ? 17'h0 : _GEN_7; // @[BufferAccumulator.scala 12:{33,33}]
  wire [16:0] _GEN_144 = reset ? 17'h0 : _GEN_8; // @[BufferAccumulator.scala 12:{33,33}]
  assign io_zeroSums_0 = zeroAccumulators_0; // @[BufferAccumulator.scala 30:15]
  assign io_zeroSums_1 = zeroAccumulators_1; // @[BufferAccumulator.scala 30:15]
  assign io_zeroSums_2 = zeroAccumulators_2; // @[BufferAccumulator.scala 30:15]
  assign io_zeroSums_3 = zeroAccumulators_3; // @[BufferAccumulator.scala 30:15]
  assign io_zeroSums_4 = zeroAccumulators_4; // @[BufferAccumulator.scala 30:15]
  assign io_zeroSums_5 = zeroAccumulators_5; // @[BufferAccumulator.scala 30:15]
  assign io_zeroSums_6 = zeroAccumulators_6; // @[BufferAccumulator.scala 30:15]
  assign io_zeroSums_7 = zeroAccumulators_7; // @[BufferAccumulator.scala 30:15]
  always @(posedge clock) begin
    zeroAccumulators_0 <= _GEN_137[7:0]; // @[BufferAccumulator.scala 12:{33,33}]
    zeroAccumulators_1 <= _GEN_138[7:0]; // @[BufferAccumulator.scala 12:{33,33}]
    zeroAccumulators_2 <= _GEN_139[7:0]; // @[BufferAccumulator.scala 12:{33,33}]
    zeroAccumulators_3 <= _GEN_140[7:0]; // @[BufferAccumulator.scala 12:{33,33}]
    zeroAccumulators_4 <= _GEN_141[7:0]; // @[BufferAccumulator.scala 12:{33,33}]
    zeroAccumulators_5 <= _GEN_142[7:0]; // @[BufferAccumulator.scala 12:{33,33}]
    zeroAccumulators_6 <= _GEN_143[7:0]; // @[BufferAccumulator.scala 12:{33,33}]
    zeroAccumulators_7 <= _GEN_144[7:0]; // @[BufferAccumulator.scala 12:{33,33}]
    if (reset) begin // @[BufferAccumulator.scala 14:28]
      lineCounter <= 4'h0; // @[BufferAccumulator.scala 14:28]
    end else if (lineCounter == 4'hf) begin // @[BufferAccumulator.scala 16:30]
      lineCounter <= 4'h0; // @[BufferAccumulator.scala 17:17]
    end else begin
      lineCounter <= _lineCounter_T_1; // @[BufferAccumulator.scala 20:17]
    end
  end
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  zeroAccumulators_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  zeroAccumulators_1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  zeroAccumulators_2 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  zeroAccumulators_3 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  zeroAccumulators_4 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  zeroAccumulators_5 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  zeroAccumulators_6 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  zeroAccumulators_7 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  lineCounter = _RAND_8[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
