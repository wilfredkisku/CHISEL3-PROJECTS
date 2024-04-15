module PE(
  input         clock,
  input  [7:0]  io_weightIn,
  input  [7:0]  io_ifmIn,
  output [31:0] io_parp,
  output [7:0]  io_weightOut,
  output [7:0]  io_ifmOut
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] weightBuff; // @[PE.scala 13:27]
  reg [7:0] ifmBuff; // @[PE.scala 16:24]
  wire [15:0] _io_parp_T = $signed(io_weightIn) * $signed(io_ifmIn); // @[PE.scala 22:28]
  wire [15:0] _GEN_0 = $signed(io_weightIn) == 8'sh0 | $signed(io_ifmIn) == 8'sh0 ? $signed(16'sh0) : $signed(_io_parp_T
    ); // @[PE.scala 19:49 20:11 22:13]
  assign io_parp = {{16{_GEN_0[15]}},_GEN_0};
  assign io_weightOut = weightBuff; // @[PE.scala 14:16]
  assign io_ifmOut = ifmBuff; // @[PE.scala 17:13]
  always @(posedge clock) begin
    weightBuff <= io_weightIn; // @[PE.scala 13:27]
    ifmBuff <= io_ifmIn; // @[PE.scala 16:24]
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
  weightBuff = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  ifmBuff = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SystolicArray(
  input         clock,
  input         reset,
  input  [7:0]  io_gridWeightIn_0,
  input  [7:0]  io_gridWeightIn_1,
  input  [7:0]  io_gridWeightIn_2,
  input  [7:0]  io_gridWeightIn_3,
  input  [7:0]  io_gridWeightIn_4,
  input  [7:0]  io_gridWeightIn_5,
  input  [7:0]  io_gridWeightIn_6,
  input  [7:0]  io_gridWeightIn_7,
  input  [7:0]  io_gridWeightIn_8,
  input  [7:0]  io_gridWeightIn_9,
  input  [7:0]  io_gridWeightIn_10,
  input  [7:0]  io_gridWeightIn_11,
  input  [7:0]  io_gridIfmIn_0,
  input  [7:0]  io_gridIfmIn_1,
  input  [7:0]  io_gridIfmIn_2,
  input  [7:0]  io_gridIfmIn_3,
  input  [7:0]  io_gridIfmIn_4,
  input  [7:0]  io_gridIfmIn_5,
  input  [7:0]  io_gridIfmIn_6,
  input  [7:0]  io_gridIfmIn_7,
  input  [7:0]  io_gridIfmIn_8,
  input  [7:0]  io_gridIfmIn_9,
  input  [7:0]  io_gridIfmIn_10,
  input  [7:0]  io_gridIfmIn_11,
  output [31:0] io_gridParpOut_0_0,
  output [31:0] io_gridParpOut_0_1,
  output [31:0] io_gridParpOut_0_2,
  output [31:0] io_gridParpOut_0_3,
  output [31:0] io_gridParpOut_0_4,
  output [31:0] io_gridParpOut_0_5,
  output [31:0] io_gridParpOut_0_6,
  output [31:0] io_gridParpOut_0_7,
  output [31:0] io_gridParpOut_0_8,
  output [31:0] io_gridParpOut_0_9,
  output [31:0] io_gridParpOut_0_10,
  output [31:0] io_gridParpOut_0_11,
  output [31:0] io_gridParpOut_1_0,
  output [31:0] io_gridParpOut_1_1,
  output [31:0] io_gridParpOut_1_2,
  output [31:0] io_gridParpOut_1_3,
  output [31:0] io_gridParpOut_1_4,
  output [31:0] io_gridParpOut_1_5,
  output [31:0] io_gridParpOut_1_6,
  output [31:0] io_gridParpOut_1_7,
  output [31:0] io_gridParpOut_1_8,
  output [31:0] io_gridParpOut_1_9,
  output [31:0] io_gridParpOut_1_10,
  output [31:0] io_gridParpOut_1_11,
  output [31:0] io_gridParpOut_2_0,
  output [31:0] io_gridParpOut_2_1,
  output [31:0] io_gridParpOut_2_2,
  output [31:0] io_gridParpOut_2_3,
  output [31:0] io_gridParpOut_2_4,
  output [31:0] io_gridParpOut_2_5,
  output [31:0] io_gridParpOut_2_6,
  output [31:0] io_gridParpOut_2_7,
  output [31:0] io_gridParpOut_2_8,
  output [31:0] io_gridParpOut_2_9,
  output [31:0] io_gridParpOut_2_10,
  output [31:0] io_gridParpOut_2_11,
  output [31:0] io_gridParpOut_3_0,
  output [31:0] io_gridParpOut_3_1,
  output [31:0] io_gridParpOut_3_2,
  output [31:0] io_gridParpOut_3_3,
  output [31:0] io_gridParpOut_3_4,
  output [31:0] io_gridParpOut_3_5,
  output [31:0] io_gridParpOut_3_6,
  output [31:0] io_gridParpOut_3_7,
  output [31:0] io_gridParpOut_3_8,
  output [31:0] io_gridParpOut_3_9,
  output [31:0] io_gridParpOut_3_10,
  output [31:0] io_gridParpOut_3_11,
  output [31:0] io_gridParpOut_4_0,
  output [31:0] io_gridParpOut_4_1,
  output [31:0] io_gridParpOut_4_2,
  output [31:0] io_gridParpOut_4_3,
  output [31:0] io_gridParpOut_4_4,
  output [31:0] io_gridParpOut_4_5,
  output [31:0] io_gridParpOut_4_6,
  output [31:0] io_gridParpOut_4_7,
  output [31:0] io_gridParpOut_4_8,
  output [31:0] io_gridParpOut_4_9,
  output [31:0] io_gridParpOut_4_10,
  output [31:0] io_gridParpOut_4_11,
  output [31:0] io_gridParpOut_5_0,
  output [31:0] io_gridParpOut_5_1,
  output [31:0] io_gridParpOut_5_2,
  output [31:0] io_gridParpOut_5_3,
  output [31:0] io_gridParpOut_5_4,
  output [31:0] io_gridParpOut_5_5,
  output [31:0] io_gridParpOut_5_6,
  output [31:0] io_gridParpOut_5_7,
  output [31:0] io_gridParpOut_5_8,
  output [31:0] io_gridParpOut_5_9,
  output [31:0] io_gridParpOut_5_10,
  output [31:0] io_gridParpOut_5_11,
  output [31:0] io_gridParpOut_6_0,
  output [31:0] io_gridParpOut_6_1,
  output [31:0] io_gridParpOut_6_2,
  output [31:0] io_gridParpOut_6_3,
  output [31:0] io_gridParpOut_6_4,
  output [31:0] io_gridParpOut_6_5,
  output [31:0] io_gridParpOut_6_6,
  output [31:0] io_gridParpOut_6_7,
  output [31:0] io_gridParpOut_6_8,
  output [31:0] io_gridParpOut_6_9,
  output [31:0] io_gridParpOut_6_10,
  output [31:0] io_gridParpOut_6_11,
  output [31:0] io_gridParpOut_7_0,
  output [31:0] io_gridParpOut_7_1,
  output [31:0] io_gridParpOut_7_2,
  output [31:0] io_gridParpOut_7_3,
  output [31:0] io_gridParpOut_7_4,
  output [31:0] io_gridParpOut_7_5,
  output [31:0] io_gridParpOut_7_6,
  output [31:0] io_gridParpOut_7_7,
  output [31:0] io_gridParpOut_7_8,
  output [31:0] io_gridParpOut_7_9,
  output [31:0] io_gridParpOut_7_10,
  output [31:0] io_gridParpOut_7_11,
  output [31:0] io_gridParpOut_8_0,
  output [31:0] io_gridParpOut_8_1,
  output [31:0] io_gridParpOut_8_2,
  output [31:0] io_gridParpOut_8_3,
  output [31:0] io_gridParpOut_8_4,
  output [31:0] io_gridParpOut_8_5,
  output [31:0] io_gridParpOut_8_6,
  output [31:0] io_gridParpOut_8_7,
  output [31:0] io_gridParpOut_8_8,
  output [31:0] io_gridParpOut_8_9,
  output [31:0] io_gridParpOut_8_10,
  output [31:0] io_gridParpOut_8_11,
  output [31:0] io_gridParpOut_9_0,
  output [31:0] io_gridParpOut_9_1,
  output [31:0] io_gridParpOut_9_2,
  output [31:0] io_gridParpOut_9_3,
  output [31:0] io_gridParpOut_9_4,
  output [31:0] io_gridParpOut_9_5,
  output [31:0] io_gridParpOut_9_6,
  output [31:0] io_gridParpOut_9_7,
  output [31:0] io_gridParpOut_9_8,
  output [31:0] io_gridParpOut_9_9,
  output [31:0] io_gridParpOut_9_10,
  output [31:0] io_gridParpOut_9_11,
  output [31:0] io_gridParpOut_10_0,
  output [31:0] io_gridParpOut_10_1,
  output [31:0] io_gridParpOut_10_2,
  output [31:0] io_gridParpOut_10_3,
  output [31:0] io_gridParpOut_10_4,
  output [31:0] io_gridParpOut_10_5,
  output [31:0] io_gridParpOut_10_6,
  output [31:0] io_gridParpOut_10_7,
  output [31:0] io_gridParpOut_10_8,
  output [31:0] io_gridParpOut_10_9,
  output [31:0] io_gridParpOut_10_10,
  output [31:0] io_gridParpOut_10_11,
  output [31:0] io_gridParpOut_11_0,
  output [31:0] io_gridParpOut_11_1,
  output [31:0] io_gridParpOut_11_2,
  output [31:0] io_gridParpOut_11_3,
  output [31:0] io_gridParpOut_11_4,
  output [31:0] io_gridParpOut_11_5,
  output [31:0] io_gridParpOut_11_6,
  output [31:0] io_gridParpOut_11_7,
  output [31:0] io_gridParpOut_11_8,
  output [31:0] io_gridParpOut_11_9,
  output [31:0] io_gridParpOut_11_10,
  output [31:0] io_gridParpOut_11_11
);
  wire  peArray_0_0_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_0_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_0_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_0_0_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_0_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_0_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_0_1_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_1_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_1_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_0_1_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_1_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_1_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_0_2_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_2_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_2_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_0_2_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_2_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_2_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_0_3_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_3_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_3_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_0_3_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_3_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_3_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_0_4_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_4_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_4_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_0_4_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_4_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_4_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_0_5_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_5_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_5_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_0_5_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_5_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_5_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_0_6_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_6_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_6_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_0_6_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_6_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_6_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_0_7_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_7_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_7_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_0_7_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_7_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_7_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_0_8_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_8_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_8_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_0_8_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_8_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_8_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_0_9_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_9_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_9_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_0_9_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_9_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_9_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_0_10_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_10_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_10_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_0_10_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_10_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_10_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_0_11_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_11_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_11_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_0_11_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_11_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_0_11_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_1_0_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_0_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_0_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_1_0_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_0_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_0_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_1_1_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_1_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_1_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_1_1_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_1_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_1_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_1_2_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_2_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_2_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_1_2_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_2_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_2_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_1_3_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_3_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_3_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_1_3_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_3_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_3_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_1_4_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_4_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_4_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_1_4_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_4_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_4_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_1_5_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_5_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_5_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_1_5_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_5_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_5_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_1_6_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_6_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_6_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_1_6_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_6_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_6_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_1_7_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_7_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_7_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_1_7_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_7_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_7_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_1_8_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_8_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_8_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_1_8_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_8_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_8_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_1_9_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_9_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_9_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_1_9_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_9_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_9_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_1_10_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_10_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_10_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_1_10_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_10_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_10_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_1_11_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_11_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_11_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_1_11_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_11_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_1_11_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_2_0_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_0_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_0_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_2_0_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_0_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_0_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_2_1_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_1_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_1_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_2_1_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_1_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_1_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_2_2_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_2_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_2_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_2_2_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_2_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_2_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_2_3_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_3_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_3_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_2_3_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_3_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_3_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_2_4_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_4_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_4_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_2_4_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_4_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_4_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_2_5_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_5_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_5_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_2_5_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_5_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_5_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_2_6_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_6_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_6_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_2_6_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_6_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_6_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_2_7_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_7_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_7_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_2_7_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_7_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_7_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_2_8_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_8_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_8_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_2_8_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_8_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_8_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_2_9_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_9_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_9_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_2_9_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_9_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_9_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_2_10_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_10_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_10_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_2_10_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_10_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_10_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_2_11_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_11_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_11_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_2_11_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_11_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_2_11_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_3_0_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_0_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_0_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_3_0_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_0_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_0_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_3_1_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_1_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_1_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_3_1_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_1_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_1_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_3_2_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_2_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_2_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_3_2_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_2_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_2_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_3_3_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_3_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_3_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_3_3_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_3_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_3_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_3_4_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_4_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_4_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_3_4_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_4_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_4_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_3_5_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_5_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_5_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_3_5_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_5_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_5_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_3_6_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_6_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_6_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_3_6_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_6_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_6_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_3_7_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_7_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_7_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_3_7_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_7_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_7_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_3_8_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_8_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_8_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_3_8_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_8_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_8_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_3_9_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_9_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_9_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_3_9_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_9_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_9_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_3_10_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_10_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_10_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_3_10_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_10_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_10_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_3_11_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_11_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_11_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_3_11_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_11_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_3_11_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_4_0_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_0_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_0_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_4_0_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_0_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_0_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_4_1_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_1_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_1_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_4_1_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_1_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_1_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_4_2_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_2_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_2_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_4_2_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_2_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_2_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_4_3_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_3_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_3_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_4_3_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_3_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_3_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_4_4_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_4_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_4_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_4_4_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_4_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_4_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_4_5_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_5_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_5_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_4_5_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_5_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_5_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_4_6_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_6_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_6_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_4_6_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_6_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_6_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_4_7_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_7_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_7_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_4_7_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_7_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_7_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_4_8_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_8_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_8_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_4_8_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_8_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_8_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_4_9_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_9_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_9_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_4_9_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_9_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_9_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_4_10_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_10_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_10_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_4_10_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_10_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_10_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_4_11_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_11_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_11_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_4_11_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_11_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_4_11_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_5_0_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_0_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_0_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_5_0_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_0_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_0_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_5_1_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_1_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_1_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_5_1_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_1_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_1_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_5_2_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_2_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_2_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_5_2_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_2_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_2_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_5_3_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_3_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_3_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_5_3_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_3_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_3_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_5_4_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_4_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_4_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_5_4_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_4_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_4_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_5_5_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_5_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_5_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_5_5_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_5_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_5_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_5_6_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_6_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_6_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_5_6_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_6_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_6_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_5_7_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_7_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_7_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_5_7_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_7_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_7_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_5_8_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_8_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_8_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_5_8_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_8_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_8_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_5_9_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_9_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_9_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_5_9_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_9_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_9_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_5_10_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_10_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_10_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_5_10_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_10_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_10_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_5_11_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_11_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_11_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_5_11_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_11_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_5_11_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_6_0_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_0_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_0_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_6_0_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_0_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_0_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_6_1_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_1_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_1_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_6_1_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_1_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_1_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_6_2_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_2_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_2_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_6_2_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_2_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_2_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_6_3_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_3_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_3_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_6_3_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_3_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_3_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_6_4_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_4_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_4_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_6_4_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_4_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_4_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_6_5_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_5_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_5_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_6_5_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_5_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_5_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_6_6_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_6_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_6_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_6_6_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_6_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_6_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_6_7_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_7_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_7_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_6_7_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_7_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_7_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_6_8_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_8_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_8_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_6_8_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_8_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_8_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_6_9_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_9_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_9_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_6_9_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_9_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_9_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_6_10_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_10_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_10_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_6_10_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_10_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_10_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_6_11_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_11_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_11_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_6_11_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_11_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_6_11_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_7_0_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_0_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_0_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_7_0_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_0_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_0_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_7_1_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_1_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_1_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_7_1_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_1_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_1_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_7_2_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_2_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_2_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_7_2_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_2_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_2_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_7_3_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_3_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_3_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_7_3_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_3_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_3_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_7_4_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_4_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_4_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_7_4_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_4_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_4_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_7_5_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_5_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_5_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_7_5_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_5_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_5_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_7_6_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_6_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_6_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_7_6_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_6_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_6_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_7_7_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_7_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_7_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_7_7_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_7_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_7_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_7_8_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_8_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_8_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_7_8_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_8_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_8_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_7_9_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_9_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_9_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_7_9_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_9_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_9_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_7_10_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_10_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_10_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_7_10_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_10_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_10_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_7_11_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_11_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_11_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_7_11_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_11_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_7_11_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_8_0_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_0_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_0_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_8_0_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_0_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_0_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_8_1_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_1_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_1_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_8_1_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_1_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_1_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_8_2_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_2_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_2_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_8_2_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_2_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_2_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_8_3_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_3_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_3_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_8_3_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_3_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_3_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_8_4_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_4_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_4_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_8_4_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_4_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_4_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_8_5_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_5_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_5_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_8_5_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_5_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_5_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_8_6_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_6_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_6_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_8_6_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_6_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_6_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_8_7_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_7_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_7_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_8_7_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_7_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_7_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_8_8_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_8_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_8_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_8_8_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_8_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_8_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_8_9_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_9_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_9_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_8_9_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_9_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_9_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_8_10_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_10_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_10_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_8_10_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_10_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_10_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_8_11_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_11_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_11_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_8_11_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_11_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_8_11_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_9_0_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_0_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_0_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_9_0_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_0_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_0_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_9_1_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_1_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_1_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_9_1_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_1_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_1_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_9_2_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_2_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_2_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_9_2_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_2_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_2_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_9_3_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_3_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_3_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_9_3_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_3_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_3_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_9_4_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_4_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_4_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_9_4_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_4_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_4_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_9_5_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_5_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_5_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_9_5_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_5_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_5_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_9_6_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_6_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_6_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_9_6_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_6_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_6_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_9_7_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_7_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_7_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_9_7_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_7_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_7_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_9_8_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_8_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_8_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_9_8_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_8_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_8_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_9_9_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_9_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_9_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_9_9_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_9_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_9_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_9_10_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_10_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_10_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_9_10_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_10_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_10_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_9_11_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_11_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_11_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_9_11_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_11_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_9_11_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_10_0_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_0_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_0_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_10_0_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_0_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_0_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_10_1_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_1_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_1_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_10_1_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_1_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_1_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_10_2_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_2_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_2_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_10_2_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_2_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_2_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_10_3_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_3_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_3_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_10_3_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_3_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_3_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_10_4_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_4_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_4_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_10_4_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_4_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_4_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_10_5_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_5_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_5_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_10_5_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_5_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_5_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_10_6_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_6_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_6_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_10_6_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_6_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_6_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_10_7_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_7_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_7_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_10_7_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_7_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_7_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_10_8_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_8_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_8_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_10_8_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_8_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_8_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_10_9_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_9_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_9_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_10_9_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_9_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_9_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_10_10_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_10_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_10_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_10_10_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_10_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_10_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_10_11_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_11_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_11_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_10_11_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_11_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_10_11_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_11_0_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_0_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_0_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_11_0_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_0_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_0_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_11_1_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_1_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_1_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_11_1_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_1_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_1_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_11_2_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_2_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_2_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_11_2_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_2_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_2_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_11_3_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_3_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_3_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_11_3_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_3_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_3_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_11_4_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_4_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_4_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_11_4_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_4_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_4_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_11_5_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_5_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_5_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_11_5_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_5_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_5_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_11_6_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_6_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_6_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_11_6_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_6_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_6_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_11_7_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_7_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_7_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_11_7_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_7_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_7_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_11_8_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_8_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_8_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_11_8_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_8_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_8_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_11_9_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_9_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_9_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_11_9_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_9_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_9_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_11_10_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_10_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_10_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_11_10_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_10_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_10_io_ifmOut; // @[SystolicArray.scala 14:40]
  wire  peArray_11_11_clock; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_11_io_weightIn; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_11_io_ifmIn; // @[SystolicArray.scala 14:40]
  wire [31:0] peArray_11_11_io_parp; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_11_io_weightOut; // @[SystolicArray.scala 14:40]
  wire [7:0] peArray_11_11_io_ifmOut; // @[SystolicArray.scala 14:40]
  PE peArray_0_0 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_0_0_clock),
    .io_weightIn(peArray_0_0_io_weightIn),
    .io_ifmIn(peArray_0_0_io_ifmIn),
    .io_parp(peArray_0_0_io_parp),
    .io_weightOut(peArray_0_0_io_weightOut),
    .io_ifmOut(peArray_0_0_io_ifmOut)
  );
  PE peArray_0_1 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_0_1_clock),
    .io_weightIn(peArray_0_1_io_weightIn),
    .io_ifmIn(peArray_0_1_io_ifmIn),
    .io_parp(peArray_0_1_io_parp),
    .io_weightOut(peArray_0_1_io_weightOut),
    .io_ifmOut(peArray_0_1_io_ifmOut)
  );
  PE peArray_0_2 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_0_2_clock),
    .io_weightIn(peArray_0_2_io_weightIn),
    .io_ifmIn(peArray_0_2_io_ifmIn),
    .io_parp(peArray_0_2_io_parp),
    .io_weightOut(peArray_0_2_io_weightOut),
    .io_ifmOut(peArray_0_2_io_ifmOut)
  );
  PE peArray_0_3 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_0_3_clock),
    .io_weightIn(peArray_0_3_io_weightIn),
    .io_ifmIn(peArray_0_3_io_ifmIn),
    .io_parp(peArray_0_3_io_parp),
    .io_weightOut(peArray_0_3_io_weightOut),
    .io_ifmOut(peArray_0_3_io_ifmOut)
  );
  PE peArray_0_4 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_0_4_clock),
    .io_weightIn(peArray_0_4_io_weightIn),
    .io_ifmIn(peArray_0_4_io_ifmIn),
    .io_parp(peArray_0_4_io_parp),
    .io_weightOut(peArray_0_4_io_weightOut),
    .io_ifmOut(peArray_0_4_io_ifmOut)
  );
  PE peArray_0_5 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_0_5_clock),
    .io_weightIn(peArray_0_5_io_weightIn),
    .io_ifmIn(peArray_0_5_io_ifmIn),
    .io_parp(peArray_0_5_io_parp),
    .io_weightOut(peArray_0_5_io_weightOut),
    .io_ifmOut(peArray_0_5_io_ifmOut)
  );
  PE peArray_0_6 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_0_6_clock),
    .io_weightIn(peArray_0_6_io_weightIn),
    .io_ifmIn(peArray_0_6_io_ifmIn),
    .io_parp(peArray_0_6_io_parp),
    .io_weightOut(peArray_0_6_io_weightOut),
    .io_ifmOut(peArray_0_6_io_ifmOut)
  );
  PE peArray_0_7 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_0_7_clock),
    .io_weightIn(peArray_0_7_io_weightIn),
    .io_ifmIn(peArray_0_7_io_ifmIn),
    .io_parp(peArray_0_7_io_parp),
    .io_weightOut(peArray_0_7_io_weightOut),
    .io_ifmOut(peArray_0_7_io_ifmOut)
  );
  PE peArray_0_8 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_0_8_clock),
    .io_weightIn(peArray_0_8_io_weightIn),
    .io_ifmIn(peArray_0_8_io_ifmIn),
    .io_parp(peArray_0_8_io_parp),
    .io_weightOut(peArray_0_8_io_weightOut),
    .io_ifmOut(peArray_0_8_io_ifmOut)
  );
  PE peArray_0_9 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_0_9_clock),
    .io_weightIn(peArray_0_9_io_weightIn),
    .io_ifmIn(peArray_0_9_io_ifmIn),
    .io_parp(peArray_0_9_io_parp),
    .io_weightOut(peArray_0_9_io_weightOut),
    .io_ifmOut(peArray_0_9_io_ifmOut)
  );
  PE peArray_0_10 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_0_10_clock),
    .io_weightIn(peArray_0_10_io_weightIn),
    .io_ifmIn(peArray_0_10_io_ifmIn),
    .io_parp(peArray_0_10_io_parp),
    .io_weightOut(peArray_0_10_io_weightOut),
    .io_ifmOut(peArray_0_10_io_ifmOut)
  );
  PE peArray_0_11 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_0_11_clock),
    .io_weightIn(peArray_0_11_io_weightIn),
    .io_ifmIn(peArray_0_11_io_ifmIn),
    .io_parp(peArray_0_11_io_parp),
    .io_weightOut(peArray_0_11_io_weightOut),
    .io_ifmOut(peArray_0_11_io_ifmOut)
  );
  PE peArray_1_0 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_1_0_clock),
    .io_weightIn(peArray_1_0_io_weightIn),
    .io_ifmIn(peArray_1_0_io_ifmIn),
    .io_parp(peArray_1_0_io_parp),
    .io_weightOut(peArray_1_0_io_weightOut),
    .io_ifmOut(peArray_1_0_io_ifmOut)
  );
  PE peArray_1_1 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_1_1_clock),
    .io_weightIn(peArray_1_1_io_weightIn),
    .io_ifmIn(peArray_1_1_io_ifmIn),
    .io_parp(peArray_1_1_io_parp),
    .io_weightOut(peArray_1_1_io_weightOut),
    .io_ifmOut(peArray_1_1_io_ifmOut)
  );
  PE peArray_1_2 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_1_2_clock),
    .io_weightIn(peArray_1_2_io_weightIn),
    .io_ifmIn(peArray_1_2_io_ifmIn),
    .io_parp(peArray_1_2_io_parp),
    .io_weightOut(peArray_1_2_io_weightOut),
    .io_ifmOut(peArray_1_2_io_ifmOut)
  );
  PE peArray_1_3 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_1_3_clock),
    .io_weightIn(peArray_1_3_io_weightIn),
    .io_ifmIn(peArray_1_3_io_ifmIn),
    .io_parp(peArray_1_3_io_parp),
    .io_weightOut(peArray_1_3_io_weightOut),
    .io_ifmOut(peArray_1_3_io_ifmOut)
  );
  PE peArray_1_4 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_1_4_clock),
    .io_weightIn(peArray_1_4_io_weightIn),
    .io_ifmIn(peArray_1_4_io_ifmIn),
    .io_parp(peArray_1_4_io_parp),
    .io_weightOut(peArray_1_4_io_weightOut),
    .io_ifmOut(peArray_1_4_io_ifmOut)
  );
  PE peArray_1_5 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_1_5_clock),
    .io_weightIn(peArray_1_5_io_weightIn),
    .io_ifmIn(peArray_1_5_io_ifmIn),
    .io_parp(peArray_1_5_io_parp),
    .io_weightOut(peArray_1_5_io_weightOut),
    .io_ifmOut(peArray_1_5_io_ifmOut)
  );
  PE peArray_1_6 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_1_6_clock),
    .io_weightIn(peArray_1_6_io_weightIn),
    .io_ifmIn(peArray_1_6_io_ifmIn),
    .io_parp(peArray_1_6_io_parp),
    .io_weightOut(peArray_1_6_io_weightOut),
    .io_ifmOut(peArray_1_6_io_ifmOut)
  );
  PE peArray_1_7 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_1_7_clock),
    .io_weightIn(peArray_1_7_io_weightIn),
    .io_ifmIn(peArray_1_7_io_ifmIn),
    .io_parp(peArray_1_7_io_parp),
    .io_weightOut(peArray_1_7_io_weightOut),
    .io_ifmOut(peArray_1_7_io_ifmOut)
  );
  PE peArray_1_8 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_1_8_clock),
    .io_weightIn(peArray_1_8_io_weightIn),
    .io_ifmIn(peArray_1_8_io_ifmIn),
    .io_parp(peArray_1_8_io_parp),
    .io_weightOut(peArray_1_8_io_weightOut),
    .io_ifmOut(peArray_1_8_io_ifmOut)
  );
  PE peArray_1_9 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_1_9_clock),
    .io_weightIn(peArray_1_9_io_weightIn),
    .io_ifmIn(peArray_1_9_io_ifmIn),
    .io_parp(peArray_1_9_io_parp),
    .io_weightOut(peArray_1_9_io_weightOut),
    .io_ifmOut(peArray_1_9_io_ifmOut)
  );
  PE peArray_1_10 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_1_10_clock),
    .io_weightIn(peArray_1_10_io_weightIn),
    .io_ifmIn(peArray_1_10_io_ifmIn),
    .io_parp(peArray_1_10_io_parp),
    .io_weightOut(peArray_1_10_io_weightOut),
    .io_ifmOut(peArray_1_10_io_ifmOut)
  );
  PE peArray_1_11 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_1_11_clock),
    .io_weightIn(peArray_1_11_io_weightIn),
    .io_ifmIn(peArray_1_11_io_ifmIn),
    .io_parp(peArray_1_11_io_parp),
    .io_weightOut(peArray_1_11_io_weightOut),
    .io_ifmOut(peArray_1_11_io_ifmOut)
  );
  PE peArray_2_0 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_2_0_clock),
    .io_weightIn(peArray_2_0_io_weightIn),
    .io_ifmIn(peArray_2_0_io_ifmIn),
    .io_parp(peArray_2_0_io_parp),
    .io_weightOut(peArray_2_0_io_weightOut),
    .io_ifmOut(peArray_2_0_io_ifmOut)
  );
  PE peArray_2_1 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_2_1_clock),
    .io_weightIn(peArray_2_1_io_weightIn),
    .io_ifmIn(peArray_2_1_io_ifmIn),
    .io_parp(peArray_2_1_io_parp),
    .io_weightOut(peArray_2_1_io_weightOut),
    .io_ifmOut(peArray_2_1_io_ifmOut)
  );
  PE peArray_2_2 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_2_2_clock),
    .io_weightIn(peArray_2_2_io_weightIn),
    .io_ifmIn(peArray_2_2_io_ifmIn),
    .io_parp(peArray_2_2_io_parp),
    .io_weightOut(peArray_2_2_io_weightOut),
    .io_ifmOut(peArray_2_2_io_ifmOut)
  );
  PE peArray_2_3 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_2_3_clock),
    .io_weightIn(peArray_2_3_io_weightIn),
    .io_ifmIn(peArray_2_3_io_ifmIn),
    .io_parp(peArray_2_3_io_parp),
    .io_weightOut(peArray_2_3_io_weightOut),
    .io_ifmOut(peArray_2_3_io_ifmOut)
  );
  PE peArray_2_4 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_2_4_clock),
    .io_weightIn(peArray_2_4_io_weightIn),
    .io_ifmIn(peArray_2_4_io_ifmIn),
    .io_parp(peArray_2_4_io_parp),
    .io_weightOut(peArray_2_4_io_weightOut),
    .io_ifmOut(peArray_2_4_io_ifmOut)
  );
  PE peArray_2_5 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_2_5_clock),
    .io_weightIn(peArray_2_5_io_weightIn),
    .io_ifmIn(peArray_2_5_io_ifmIn),
    .io_parp(peArray_2_5_io_parp),
    .io_weightOut(peArray_2_5_io_weightOut),
    .io_ifmOut(peArray_2_5_io_ifmOut)
  );
  PE peArray_2_6 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_2_6_clock),
    .io_weightIn(peArray_2_6_io_weightIn),
    .io_ifmIn(peArray_2_6_io_ifmIn),
    .io_parp(peArray_2_6_io_parp),
    .io_weightOut(peArray_2_6_io_weightOut),
    .io_ifmOut(peArray_2_6_io_ifmOut)
  );
  PE peArray_2_7 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_2_7_clock),
    .io_weightIn(peArray_2_7_io_weightIn),
    .io_ifmIn(peArray_2_7_io_ifmIn),
    .io_parp(peArray_2_7_io_parp),
    .io_weightOut(peArray_2_7_io_weightOut),
    .io_ifmOut(peArray_2_7_io_ifmOut)
  );
  PE peArray_2_8 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_2_8_clock),
    .io_weightIn(peArray_2_8_io_weightIn),
    .io_ifmIn(peArray_2_8_io_ifmIn),
    .io_parp(peArray_2_8_io_parp),
    .io_weightOut(peArray_2_8_io_weightOut),
    .io_ifmOut(peArray_2_8_io_ifmOut)
  );
  PE peArray_2_9 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_2_9_clock),
    .io_weightIn(peArray_2_9_io_weightIn),
    .io_ifmIn(peArray_2_9_io_ifmIn),
    .io_parp(peArray_2_9_io_parp),
    .io_weightOut(peArray_2_9_io_weightOut),
    .io_ifmOut(peArray_2_9_io_ifmOut)
  );
  PE peArray_2_10 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_2_10_clock),
    .io_weightIn(peArray_2_10_io_weightIn),
    .io_ifmIn(peArray_2_10_io_ifmIn),
    .io_parp(peArray_2_10_io_parp),
    .io_weightOut(peArray_2_10_io_weightOut),
    .io_ifmOut(peArray_2_10_io_ifmOut)
  );
  PE peArray_2_11 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_2_11_clock),
    .io_weightIn(peArray_2_11_io_weightIn),
    .io_ifmIn(peArray_2_11_io_ifmIn),
    .io_parp(peArray_2_11_io_parp),
    .io_weightOut(peArray_2_11_io_weightOut),
    .io_ifmOut(peArray_2_11_io_ifmOut)
  );
  PE peArray_3_0 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_3_0_clock),
    .io_weightIn(peArray_3_0_io_weightIn),
    .io_ifmIn(peArray_3_0_io_ifmIn),
    .io_parp(peArray_3_0_io_parp),
    .io_weightOut(peArray_3_0_io_weightOut),
    .io_ifmOut(peArray_3_0_io_ifmOut)
  );
  PE peArray_3_1 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_3_1_clock),
    .io_weightIn(peArray_3_1_io_weightIn),
    .io_ifmIn(peArray_3_1_io_ifmIn),
    .io_parp(peArray_3_1_io_parp),
    .io_weightOut(peArray_3_1_io_weightOut),
    .io_ifmOut(peArray_3_1_io_ifmOut)
  );
  PE peArray_3_2 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_3_2_clock),
    .io_weightIn(peArray_3_2_io_weightIn),
    .io_ifmIn(peArray_3_2_io_ifmIn),
    .io_parp(peArray_3_2_io_parp),
    .io_weightOut(peArray_3_2_io_weightOut),
    .io_ifmOut(peArray_3_2_io_ifmOut)
  );
  PE peArray_3_3 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_3_3_clock),
    .io_weightIn(peArray_3_3_io_weightIn),
    .io_ifmIn(peArray_3_3_io_ifmIn),
    .io_parp(peArray_3_3_io_parp),
    .io_weightOut(peArray_3_3_io_weightOut),
    .io_ifmOut(peArray_3_3_io_ifmOut)
  );
  PE peArray_3_4 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_3_4_clock),
    .io_weightIn(peArray_3_4_io_weightIn),
    .io_ifmIn(peArray_3_4_io_ifmIn),
    .io_parp(peArray_3_4_io_parp),
    .io_weightOut(peArray_3_4_io_weightOut),
    .io_ifmOut(peArray_3_4_io_ifmOut)
  );
  PE peArray_3_5 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_3_5_clock),
    .io_weightIn(peArray_3_5_io_weightIn),
    .io_ifmIn(peArray_3_5_io_ifmIn),
    .io_parp(peArray_3_5_io_parp),
    .io_weightOut(peArray_3_5_io_weightOut),
    .io_ifmOut(peArray_3_5_io_ifmOut)
  );
  PE peArray_3_6 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_3_6_clock),
    .io_weightIn(peArray_3_6_io_weightIn),
    .io_ifmIn(peArray_3_6_io_ifmIn),
    .io_parp(peArray_3_6_io_parp),
    .io_weightOut(peArray_3_6_io_weightOut),
    .io_ifmOut(peArray_3_6_io_ifmOut)
  );
  PE peArray_3_7 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_3_7_clock),
    .io_weightIn(peArray_3_7_io_weightIn),
    .io_ifmIn(peArray_3_7_io_ifmIn),
    .io_parp(peArray_3_7_io_parp),
    .io_weightOut(peArray_3_7_io_weightOut),
    .io_ifmOut(peArray_3_7_io_ifmOut)
  );
  PE peArray_3_8 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_3_8_clock),
    .io_weightIn(peArray_3_8_io_weightIn),
    .io_ifmIn(peArray_3_8_io_ifmIn),
    .io_parp(peArray_3_8_io_parp),
    .io_weightOut(peArray_3_8_io_weightOut),
    .io_ifmOut(peArray_3_8_io_ifmOut)
  );
  PE peArray_3_9 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_3_9_clock),
    .io_weightIn(peArray_3_9_io_weightIn),
    .io_ifmIn(peArray_3_9_io_ifmIn),
    .io_parp(peArray_3_9_io_parp),
    .io_weightOut(peArray_3_9_io_weightOut),
    .io_ifmOut(peArray_3_9_io_ifmOut)
  );
  PE peArray_3_10 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_3_10_clock),
    .io_weightIn(peArray_3_10_io_weightIn),
    .io_ifmIn(peArray_3_10_io_ifmIn),
    .io_parp(peArray_3_10_io_parp),
    .io_weightOut(peArray_3_10_io_weightOut),
    .io_ifmOut(peArray_3_10_io_ifmOut)
  );
  PE peArray_3_11 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_3_11_clock),
    .io_weightIn(peArray_3_11_io_weightIn),
    .io_ifmIn(peArray_3_11_io_ifmIn),
    .io_parp(peArray_3_11_io_parp),
    .io_weightOut(peArray_3_11_io_weightOut),
    .io_ifmOut(peArray_3_11_io_ifmOut)
  );
  PE peArray_4_0 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_4_0_clock),
    .io_weightIn(peArray_4_0_io_weightIn),
    .io_ifmIn(peArray_4_0_io_ifmIn),
    .io_parp(peArray_4_0_io_parp),
    .io_weightOut(peArray_4_0_io_weightOut),
    .io_ifmOut(peArray_4_0_io_ifmOut)
  );
  PE peArray_4_1 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_4_1_clock),
    .io_weightIn(peArray_4_1_io_weightIn),
    .io_ifmIn(peArray_4_1_io_ifmIn),
    .io_parp(peArray_4_1_io_parp),
    .io_weightOut(peArray_4_1_io_weightOut),
    .io_ifmOut(peArray_4_1_io_ifmOut)
  );
  PE peArray_4_2 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_4_2_clock),
    .io_weightIn(peArray_4_2_io_weightIn),
    .io_ifmIn(peArray_4_2_io_ifmIn),
    .io_parp(peArray_4_2_io_parp),
    .io_weightOut(peArray_4_2_io_weightOut),
    .io_ifmOut(peArray_4_2_io_ifmOut)
  );
  PE peArray_4_3 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_4_3_clock),
    .io_weightIn(peArray_4_3_io_weightIn),
    .io_ifmIn(peArray_4_3_io_ifmIn),
    .io_parp(peArray_4_3_io_parp),
    .io_weightOut(peArray_4_3_io_weightOut),
    .io_ifmOut(peArray_4_3_io_ifmOut)
  );
  PE peArray_4_4 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_4_4_clock),
    .io_weightIn(peArray_4_4_io_weightIn),
    .io_ifmIn(peArray_4_4_io_ifmIn),
    .io_parp(peArray_4_4_io_parp),
    .io_weightOut(peArray_4_4_io_weightOut),
    .io_ifmOut(peArray_4_4_io_ifmOut)
  );
  PE peArray_4_5 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_4_5_clock),
    .io_weightIn(peArray_4_5_io_weightIn),
    .io_ifmIn(peArray_4_5_io_ifmIn),
    .io_parp(peArray_4_5_io_parp),
    .io_weightOut(peArray_4_5_io_weightOut),
    .io_ifmOut(peArray_4_5_io_ifmOut)
  );
  PE peArray_4_6 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_4_6_clock),
    .io_weightIn(peArray_4_6_io_weightIn),
    .io_ifmIn(peArray_4_6_io_ifmIn),
    .io_parp(peArray_4_6_io_parp),
    .io_weightOut(peArray_4_6_io_weightOut),
    .io_ifmOut(peArray_4_6_io_ifmOut)
  );
  PE peArray_4_7 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_4_7_clock),
    .io_weightIn(peArray_4_7_io_weightIn),
    .io_ifmIn(peArray_4_7_io_ifmIn),
    .io_parp(peArray_4_7_io_parp),
    .io_weightOut(peArray_4_7_io_weightOut),
    .io_ifmOut(peArray_4_7_io_ifmOut)
  );
  PE peArray_4_8 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_4_8_clock),
    .io_weightIn(peArray_4_8_io_weightIn),
    .io_ifmIn(peArray_4_8_io_ifmIn),
    .io_parp(peArray_4_8_io_parp),
    .io_weightOut(peArray_4_8_io_weightOut),
    .io_ifmOut(peArray_4_8_io_ifmOut)
  );
  PE peArray_4_9 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_4_9_clock),
    .io_weightIn(peArray_4_9_io_weightIn),
    .io_ifmIn(peArray_4_9_io_ifmIn),
    .io_parp(peArray_4_9_io_parp),
    .io_weightOut(peArray_4_9_io_weightOut),
    .io_ifmOut(peArray_4_9_io_ifmOut)
  );
  PE peArray_4_10 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_4_10_clock),
    .io_weightIn(peArray_4_10_io_weightIn),
    .io_ifmIn(peArray_4_10_io_ifmIn),
    .io_parp(peArray_4_10_io_parp),
    .io_weightOut(peArray_4_10_io_weightOut),
    .io_ifmOut(peArray_4_10_io_ifmOut)
  );
  PE peArray_4_11 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_4_11_clock),
    .io_weightIn(peArray_4_11_io_weightIn),
    .io_ifmIn(peArray_4_11_io_ifmIn),
    .io_parp(peArray_4_11_io_parp),
    .io_weightOut(peArray_4_11_io_weightOut),
    .io_ifmOut(peArray_4_11_io_ifmOut)
  );
  PE peArray_5_0 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_5_0_clock),
    .io_weightIn(peArray_5_0_io_weightIn),
    .io_ifmIn(peArray_5_0_io_ifmIn),
    .io_parp(peArray_5_0_io_parp),
    .io_weightOut(peArray_5_0_io_weightOut),
    .io_ifmOut(peArray_5_0_io_ifmOut)
  );
  PE peArray_5_1 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_5_1_clock),
    .io_weightIn(peArray_5_1_io_weightIn),
    .io_ifmIn(peArray_5_1_io_ifmIn),
    .io_parp(peArray_5_1_io_parp),
    .io_weightOut(peArray_5_1_io_weightOut),
    .io_ifmOut(peArray_5_1_io_ifmOut)
  );
  PE peArray_5_2 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_5_2_clock),
    .io_weightIn(peArray_5_2_io_weightIn),
    .io_ifmIn(peArray_5_2_io_ifmIn),
    .io_parp(peArray_5_2_io_parp),
    .io_weightOut(peArray_5_2_io_weightOut),
    .io_ifmOut(peArray_5_2_io_ifmOut)
  );
  PE peArray_5_3 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_5_3_clock),
    .io_weightIn(peArray_5_3_io_weightIn),
    .io_ifmIn(peArray_5_3_io_ifmIn),
    .io_parp(peArray_5_3_io_parp),
    .io_weightOut(peArray_5_3_io_weightOut),
    .io_ifmOut(peArray_5_3_io_ifmOut)
  );
  PE peArray_5_4 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_5_4_clock),
    .io_weightIn(peArray_5_4_io_weightIn),
    .io_ifmIn(peArray_5_4_io_ifmIn),
    .io_parp(peArray_5_4_io_parp),
    .io_weightOut(peArray_5_4_io_weightOut),
    .io_ifmOut(peArray_5_4_io_ifmOut)
  );
  PE peArray_5_5 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_5_5_clock),
    .io_weightIn(peArray_5_5_io_weightIn),
    .io_ifmIn(peArray_5_5_io_ifmIn),
    .io_parp(peArray_5_5_io_parp),
    .io_weightOut(peArray_5_5_io_weightOut),
    .io_ifmOut(peArray_5_5_io_ifmOut)
  );
  PE peArray_5_6 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_5_6_clock),
    .io_weightIn(peArray_5_6_io_weightIn),
    .io_ifmIn(peArray_5_6_io_ifmIn),
    .io_parp(peArray_5_6_io_parp),
    .io_weightOut(peArray_5_6_io_weightOut),
    .io_ifmOut(peArray_5_6_io_ifmOut)
  );
  PE peArray_5_7 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_5_7_clock),
    .io_weightIn(peArray_5_7_io_weightIn),
    .io_ifmIn(peArray_5_7_io_ifmIn),
    .io_parp(peArray_5_7_io_parp),
    .io_weightOut(peArray_5_7_io_weightOut),
    .io_ifmOut(peArray_5_7_io_ifmOut)
  );
  PE peArray_5_8 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_5_8_clock),
    .io_weightIn(peArray_5_8_io_weightIn),
    .io_ifmIn(peArray_5_8_io_ifmIn),
    .io_parp(peArray_5_8_io_parp),
    .io_weightOut(peArray_5_8_io_weightOut),
    .io_ifmOut(peArray_5_8_io_ifmOut)
  );
  PE peArray_5_9 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_5_9_clock),
    .io_weightIn(peArray_5_9_io_weightIn),
    .io_ifmIn(peArray_5_9_io_ifmIn),
    .io_parp(peArray_5_9_io_parp),
    .io_weightOut(peArray_5_9_io_weightOut),
    .io_ifmOut(peArray_5_9_io_ifmOut)
  );
  PE peArray_5_10 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_5_10_clock),
    .io_weightIn(peArray_5_10_io_weightIn),
    .io_ifmIn(peArray_5_10_io_ifmIn),
    .io_parp(peArray_5_10_io_parp),
    .io_weightOut(peArray_5_10_io_weightOut),
    .io_ifmOut(peArray_5_10_io_ifmOut)
  );
  PE peArray_5_11 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_5_11_clock),
    .io_weightIn(peArray_5_11_io_weightIn),
    .io_ifmIn(peArray_5_11_io_ifmIn),
    .io_parp(peArray_5_11_io_parp),
    .io_weightOut(peArray_5_11_io_weightOut),
    .io_ifmOut(peArray_5_11_io_ifmOut)
  );
  PE peArray_6_0 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_6_0_clock),
    .io_weightIn(peArray_6_0_io_weightIn),
    .io_ifmIn(peArray_6_0_io_ifmIn),
    .io_parp(peArray_6_0_io_parp),
    .io_weightOut(peArray_6_0_io_weightOut),
    .io_ifmOut(peArray_6_0_io_ifmOut)
  );
  PE peArray_6_1 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_6_1_clock),
    .io_weightIn(peArray_6_1_io_weightIn),
    .io_ifmIn(peArray_6_1_io_ifmIn),
    .io_parp(peArray_6_1_io_parp),
    .io_weightOut(peArray_6_1_io_weightOut),
    .io_ifmOut(peArray_6_1_io_ifmOut)
  );
  PE peArray_6_2 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_6_2_clock),
    .io_weightIn(peArray_6_2_io_weightIn),
    .io_ifmIn(peArray_6_2_io_ifmIn),
    .io_parp(peArray_6_2_io_parp),
    .io_weightOut(peArray_6_2_io_weightOut),
    .io_ifmOut(peArray_6_2_io_ifmOut)
  );
  PE peArray_6_3 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_6_3_clock),
    .io_weightIn(peArray_6_3_io_weightIn),
    .io_ifmIn(peArray_6_3_io_ifmIn),
    .io_parp(peArray_6_3_io_parp),
    .io_weightOut(peArray_6_3_io_weightOut),
    .io_ifmOut(peArray_6_3_io_ifmOut)
  );
  PE peArray_6_4 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_6_4_clock),
    .io_weightIn(peArray_6_4_io_weightIn),
    .io_ifmIn(peArray_6_4_io_ifmIn),
    .io_parp(peArray_6_4_io_parp),
    .io_weightOut(peArray_6_4_io_weightOut),
    .io_ifmOut(peArray_6_4_io_ifmOut)
  );
  PE peArray_6_5 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_6_5_clock),
    .io_weightIn(peArray_6_5_io_weightIn),
    .io_ifmIn(peArray_6_5_io_ifmIn),
    .io_parp(peArray_6_5_io_parp),
    .io_weightOut(peArray_6_5_io_weightOut),
    .io_ifmOut(peArray_6_5_io_ifmOut)
  );
  PE peArray_6_6 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_6_6_clock),
    .io_weightIn(peArray_6_6_io_weightIn),
    .io_ifmIn(peArray_6_6_io_ifmIn),
    .io_parp(peArray_6_6_io_parp),
    .io_weightOut(peArray_6_6_io_weightOut),
    .io_ifmOut(peArray_6_6_io_ifmOut)
  );
  PE peArray_6_7 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_6_7_clock),
    .io_weightIn(peArray_6_7_io_weightIn),
    .io_ifmIn(peArray_6_7_io_ifmIn),
    .io_parp(peArray_6_7_io_parp),
    .io_weightOut(peArray_6_7_io_weightOut),
    .io_ifmOut(peArray_6_7_io_ifmOut)
  );
  PE peArray_6_8 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_6_8_clock),
    .io_weightIn(peArray_6_8_io_weightIn),
    .io_ifmIn(peArray_6_8_io_ifmIn),
    .io_parp(peArray_6_8_io_parp),
    .io_weightOut(peArray_6_8_io_weightOut),
    .io_ifmOut(peArray_6_8_io_ifmOut)
  );
  PE peArray_6_9 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_6_9_clock),
    .io_weightIn(peArray_6_9_io_weightIn),
    .io_ifmIn(peArray_6_9_io_ifmIn),
    .io_parp(peArray_6_9_io_parp),
    .io_weightOut(peArray_6_9_io_weightOut),
    .io_ifmOut(peArray_6_9_io_ifmOut)
  );
  PE peArray_6_10 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_6_10_clock),
    .io_weightIn(peArray_6_10_io_weightIn),
    .io_ifmIn(peArray_6_10_io_ifmIn),
    .io_parp(peArray_6_10_io_parp),
    .io_weightOut(peArray_6_10_io_weightOut),
    .io_ifmOut(peArray_6_10_io_ifmOut)
  );
  PE peArray_6_11 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_6_11_clock),
    .io_weightIn(peArray_6_11_io_weightIn),
    .io_ifmIn(peArray_6_11_io_ifmIn),
    .io_parp(peArray_6_11_io_parp),
    .io_weightOut(peArray_6_11_io_weightOut),
    .io_ifmOut(peArray_6_11_io_ifmOut)
  );
  PE peArray_7_0 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_7_0_clock),
    .io_weightIn(peArray_7_0_io_weightIn),
    .io_ifmIn(peArray_7_0_io_ifmIn),
    .io_parp(peArray_7_0_io_parp),
    .io_weightOut(peArray_7_0_io_weightOut),
    .io_ifmOut(peArray_7_0_io_ifmOut)
  );
  PE peArray_7_1 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_7_1_clock),
    .io_weightIn(peArray_7_1_io_weightIn),
    .io_ifmIn(peArray_7_1_io_ifmIn),
    .io_parp(peArray_7_1_io_parp),
    .io_weightOut(peArray_7_1_io_weightOut),
    .io_ifmOut(peArray_7_1_io_ifmOut)
  );
  PE peArray_7_2 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_7_2_clock),
    .io_weightIn(peArray_7_2_io_weightIn),
    .io_ifmIn(peArray_7_2_io_ifmIn),
    .io_parp(peArray_7_2_io_parp),
    .io_weightOut(peArray_7_2_io_weightOut),
    .io_ifmOut(peArray_7_2_io_ifmOut)
  );
  PE peArray_7_3 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_7_3_clock),
    .io_weightIn(peArray_7_3_io_weightIn),
    .io_ifmIn(peArray_7_3_io_ifmIn),
    .io_parp(peArray_7_3_io_parp),
    .io_weightOut(peArray_7_3_io_weightOut),
    .io_ifmOut(peArray_7_3_io_ifmOut)
  );
  PE peArray_7_4 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_7_4_clock),
    .io_weightIn(peArray_7_4_io_weightIn),
    .io_ifmIn(peArray_7_4_io_ifmIn),
    .io_parp(peArray_7_4_io_parp),
    .io_weightOut(peArray_7_4_io_weightOut),
    .io_ifmOut(peArray_7_4_io_ifmOut)
  );
  PE peArray_7_5 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_7_5_clock),
    .io_weightIn(peArray_7_5_io_weightIn),
    .io_ifmIn(peArray_7_5_io_ifmIn),
    .io_parp(peArray_7_5_io_parp),
    .io_weightOut(peArray_7_5_io_weightOut),
    .io_ifmOut(peArray_7_5_io_ifmOut)
  );
  PE peArray_7_6 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_7_6_clock),
    .io_weightIn(peArray_7_6_io_weightIn),
    .io_ifmIn(peArray_7_6_io_ifmIn),
    .io_parp(peArray_7_6_io_parp),
    .io_weightOut(peArray_7_6_io_weightOut),
    .io_ifmOut(peArray_7_6_io_ifmOut)
  );
  PE peArray_7_7 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_7_7_clock),
    .io_weightIn(peArray_7_7_io_weightIn),
    .io_ifmIn(peArray_7_7_io_ifmIn),
    .io_parp(peArray_7_7_io_parp),
    .io_weightOut(peArray_7_7_io_weightOut),
    .io_ifmOut(peArray_7_7_io_ifmOut)
  );
  PE peArray_7_8 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_7_8_clock),
    .io_weightIn(peArray_7_8_io_weightIn),
    .io_ifmIn(peArray_7_8_io_ifmIn),
    .io_parp(peArray_7_8_io_parp),
    .io_weightOut(peArray_7_8_io_weightOut),
    .io_ifmOut(peArray_7_8_io_ifmOut)
  );
  PE peArray_7_9 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_7_9_clock),
    .io_weightIn(peArray_7_9_io_weightIn),
    .io_ifmIn(peArray_7_9_io_ifmIn),
    .io_parp(peArray_7_9_io_parp),
    .io_weightOut(peArray_7_9_io_weightOut),
    .io_ifmOut(peArray_7_9_io_ifmOut)
  );
  PE peArray_7_10 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_7_10_clock),
    .io_weightIn(peArray_7_10_io_weightIn),
    .io_ifmIn(peArray_7_10_io_ifmIn),
    .io_parp(peArray_7_10_io_parp),
    .io_weightOut(peArray_7_10_io_weightOut),
    .io_ifmOut(peArray_7_10_io_ifmOut)
  );
  PE peArray_7_11 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_7_11_clock),
    .io_weightIn(peArray_7_11_io_weightIn),
    .io_ifmIn(peArray_7_11_io_ifmIn),
    .io_parp(peArray_7_11_io_parp),
    .io_weightOut(peArray_7_11_io_weightOut),
    .io_ifmOut(peArray_7_11_io_ifmOut)
  );
  PE peArray_8_0 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_8_0_clock),
    .io_weightIn(peArray_8_0_io_weightIn),
    .io_ifmIn(peArray_8_0_io_ifmIn),
    .io_parp(peArray_8_0_io_parp),
    .io_weightOut(peArray_8_0_io_weightOut),
    .io_ifmOut(peArray_8_0_io_ifmOut)
  );
  PE peArray_8_1 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_8_1_clock),
    .io_weightIn(peArray_8_1_io_weightIn),
    .io_ifmIn(peArray_8_1_io_ifmIn),
    .io_parp(peArray_8_1_io_parp),
    .io_weightOut(peArray_8_1_io_weightOut),
    .io_ifmOut(peArray_8_1_io_ifmOut)
  );
  PE peArray_8_2 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_8_2_clock),
    .io_weightIn(peArray_8_2_io_weightIn),
    .io_ifmIn(peArray_8_2_io_ifmIn),
    .io_parp(peArray_8_2_io_parp),
    .io_weightOut(peArray_8_2_io_weightOut),
    .io_ifmOut(peArray_8_2_io_ifmOut)
  );
  PE peArray_8_3 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_8_3_clock),
    .io_weightIn(peArray_8_3_io_weightIn),
    .io_ifmIn(peArray_8_3_io_ifmIn),
    .io_parp(peArray_8_3_io_parp),
    .io_weightOut(peArray_8_3_io_weightOut),
    .io_ifmOut(peArray_8_3_io_ifmOut)
  );
  PE peArray_8_4 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_8_4_clock),
    .io_weightIn(peArray_8_4_io_weightIn),
    .io_ifmIn(peArray_8_4_io_ifmIn),
    .io_parp(peArray_8_4_io_parp),
    .io_weightOut(peArray_8_4_io_weightOut),
    .io_ifmOut(peArray_8_4_io_ifmOut)
  );
  PE peArray_8_5 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_8_5_clock),
    .io_weightIn(peArray_8_5_io_weightIn),
    .io_ifmIn(peArray_8_5_io_ifmIn),
    .io_parp(peArray_8_5_io_parp),
    .io_weightOut(peArray_8_5_io_weightOut),
    .io_ifmOut(peArray_8_5_io_ifmOut)
  );
  PE peArray_8_6 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_8_6_clock),
    .io_weightIn(peArray_8_6_io_weightIn),
    .io_ifmIn(peArray_8_6_io_ifmIn),
    .io_parp(peArray_8_6_io_parp),
    .io_weightOut(peArray_8_6_io_weightOut),
    .io_ifmOut(peArray_8_6_io_ifmOut)
  );
  PE peArray_8_7 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_8_7_clock),
    .io_weightIn(peArray_8_7_io_weightIn),
    .io_ifmIn(peArray_8_7_io_ifmIn),
    .io_parp(peArray_8_7_io_parp),
    .io_weightOut(peArray_8_7_io_weightOut),
    .io_ifmOut(peArray_8_7_io_ifmOut)
  );
  PE peArray_8_8 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_8_8_clock),
    .io_weightIn(peArray_8_8_io_weightIn),
    .io_ifmIn(peArray_8_8_io_ifmIn),
    .io_parp(peArray_8_8_io_parp),
    .io_weightOut(peArray_8_8_io_weightOut),
    .io_ifmOut(peArray_8_8_io_ifmOut)
  );
  PE peArray_8_9 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_8_9_clock),
    .io_weightIn(peArray_8_9_io_weightIn),
    .io_ifmIn(peArray_8_9_io_ifmIn),
    .io_parp(peArray_8_9_io_parp),
    .io_weightOut(peArray_8_9_io_weightOut),
    .io_ifmOut(peArray_8_9_io_ifmOut)
  );
  PE peArray_8_10 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_8_10_clock),
    .io_weightIn(peArray_8_10_io_weightIn),
    .io_ifmIn(peArray_8_10_io_ifmIn),
    .io_parp(peArray_8_10_io_parp),
    .io_weightOut(peArray_8_10_io_weightOut),
    .io_ifmOut(peArray_8_10_io_ifmOut)
  );
  PE peArray_8_11 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_8_11_clock),
    .io_weightIn(peArray_8_11_io_weightIn),
    .io_ifmIn(peArray_8_11_io_ifmIn),
    .io_parp(peArray_8_11_io_parp),
    .io_weightOut(peArray_8_11_io_weightOut),
    .io_ifmOut(peArray_8_11_io_ifmOut)
  );
  PE peArray_9_0 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_9_0_clock),
    .io_weightIn(peArray_9_0_io_weightIn),
    .io_ifmIn(peArray_9_0_io_ifmIn),
    .io_parp(peArray_9_0_io_parp),
    .io_weightOut(peArray_9_0_io_weightOut),
    .io_ifmOut(peArray_9_0_io_ifmOut)
  );
  PE peArray_9_1 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_9_1_clock),
    .io_weightIn(peArray_9_1_io_weightIn),
    .io_ifmIn(peArray_9_1_io_ifmIn),
    .io_parp(peArray_9_1_io_parp),
    .io_weightOut(peArray_9_1_io_weightOut),
    .io_ifmOut(peArray_9_1_io_ifmOut)
  );
  PE peArray_9_2 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_9_2_clock),
    .io_weightIn(peArray_9_2_io_weightIn),
    .io_ifmIn(peArray_9_2_io_ifmIn),
    .io_parp(peArray_9_2_io_parp),
    .io_weightOut(peArray_9_2_io_weightOut),
    .io_ifmOut(peArray_9_2_io_ifmOut)
  );
  PE peArray_9_3 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_9_3_clock),
    .io_weightIn(peArray_9_3_io_weightIn),
    .io_ifmIn(peArray_9_3_io_ifmIn),
    .io_parp(peArray_9_3_io_parp),
    .io_weightOut(peArray_9_3_io_weightOut),
    .io_ifmOut(peArray_9_3_io_ifmOut)
  );
  PE peArray_9_4 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_9_4_clock),
    .io_weightIn(peArray_9_4_io_weightIn),
    .io_ifmIn(peArray_9_4_io_ifmIn),
    .io_parp(peArray_9_4_io_parp),
    .io_weightOut(peArray_9_4_io_weightOut),
    .io_ifmOut(peArray_9_4_io_ifmOut)
  );
  PE peArray_9_5 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_9_5_clock),
    .io_weightIn(peArray_9_5_io_weightIn),
    .io_ifmIn(peArray_9_5_io_ifmIn),
    .io_parp(peArray_9_5_io_parp),
    .io_weightOut(peArray_9_5_io_weightOut),
    .io_ifmOut(peArray_9_5_io_ifmOut)
  );
  PE peArray_9_6 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_9_6_clock),
    .io_weightIn(peArray_9_6_io_weightIn),
    .io_ifmIn(peArray_9_6_io_ifmIn),
    .io_parp(peArray_9_6_io_parp),
    .io_weightOut(peArray_9_6_io_weightOut),
    .io_ifmOut(peArray_9_6_io_ifmOut)
  );
  PE peArray_9_7 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_9_7_clock),
    .io_weightIn(peArray_9_7_io_weightIn),
    .io_ifmIn(peArray_9_7_io_ifmIn),
    .io_parp(peArray_9_7_io_parp),
    .io_weightOut(peArray_9_7_io_weightOut),
    .io_ifmOut(peArray_9_7_io_ifmOut)
  );
  PE peArray_9_8 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_9_8_clock),
    .io_weightIn(peArray_9_8_io_weightIn),
    .io_ifmIn(peArray_9_8_io_ifmIn),
    .io_parp(peArray_9_8_io_parp),
    .io_weightOut(peArray_9_8_io_weightOut),
    .io_ifmOut(peArray_9_8_io_ifmOut)
  );
  PE peArray_9_9 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_9_9_clock),
    .io_weightIn(peArray_9_9_io_weightIn),
    .io_ifmIn(peArray_9_9_io_ifmIn),
    .io_parp(peArray_9_9_io_parp),
    .io_weightOut(peArray_9_9_io_weightOut),
    .io_ifmOut(peArray_9_9_io_ifmOut)
  );
  PE peArray_9_10 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_9_10_clock),
    .io_weightIn(peArray_9_10_io_weightIn),
    .io_ifmIn(peArray_9_10_io_ifmIn),
    .io_parp(peArray_9_10_io_parp),
    .io_weightOut(peArray_9_10_io_weightOut),
    .io_ifmOut(peArray_9_10_io_ifmOut)
  );
  PE peArray_9_11 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_9_11_clock),
    .io_weightIn(peArray_9_11_io_weightIn),
    .io_ifmIn(peArray_9_11_io_ifmIn),
    .io_parp(peArray_9_11_io_parp),
    .io_weightOut(peArray_9_11_io_weightOut),
    .io_ifmOut(peArray_9_11_io_ifmOut)
  );
  PE peArray_10_0 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_10_0_clock),
    .io_weightIn(peArray_10_0_io_weightIn),
    .io_ifmIn(peArray_10_0_io_ifmIn),
    .io_parp(peArray_10_0_io_parp),
    .io_weightOut(peArray_10_0_io_weightOut),
    .io_ifmOut(peArray_10_0_io_ifmOut)
  );
  PE peArray_10_1 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_10_1_clock),
    .io_weightIn(peArray_10_1_io_weightIn),
    .io_ifmIn(peArray_10_1_io_ifmIn),
    .io_parp(peArray_10_1_io_parp),
    .io_weightOut(peArray_10_1_io_weightOut),
    .io_ifmOut(peArray_10_1_io_ifmOut)
  );
  PE peArray_10_2 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_10_2_clock),
    .io_weightIn(peArray_10_2_io_weightIn),
    .io_ifmIn(peArray_10_2_io_ifmIn),
    .io_parp(peArray_10_2_io_parp),
    .io_weightOut(peArray_10_2_io_weightOut),
    .io_ifmOut(peArray_10_2_io_ifmOut)
  );
  PE peArray_10_3 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_10_3_clock),
    .io_weightIn(peArray_10_3_io_weightIn),
    .io_ifmIn(peArray_10_3_io_ifmIn),
    .io_parp(peArray_10_3_io_parp),
    .io_weightOut(peArray_10_3_io_weightOut),
    .io_ifmOut(peArray_10_3_io_ifmOut)
  );
  PE peArray_10_4 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_10_4_clock),
    .io_weightIn(peArray_10_4_io_weightIn),
    .io_ifmIn(peArray_10_4_io_ifmIn),
    .io_parp(peArray_10_4_io_parp),
    .io_weightOut(peArray_10_4_io_weightOut),
    .io_ifmOut(peArray_10_4_io_ifmOut)
  );
  PE peArray_10_5 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_10_5_clock),
    .io_weightIn(peArray_10_5_io_weightIn),
    .io_ifmIn(peArray_10_5_io_ifmIn),
    .io_parp(peArray_10_5_io_parp),
    .io_weightOut(peArray_10_5_io_weightOut),
    .io_ifmOut(peArray_10_5_io_ifmOut)
  );
  PE peArray_10_6 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_10_6_clock),
    .io_weightIn(peArray_10_6_io_weightIn),
    .io_ifmIn(peArray_10_6_io_ifmIn),
    .io_parp(peArray_10_6_io_parp),
    .io_weightOut(peArray_10_6_io_weightOut),
    .io_ifmOut(peArray_10_6_io_ifmOut)
  );
  PE peArray_10_7 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_10_7_clock),
    .io_weightIn(peArray_10_7_io_weightIn),
    .io_ifmIn(peArray_10_7_io_ifmIn),
    .io_parp(peArray_10_7_io_parp),
    .io_weightOut(peArray_10_7_io_weightOut),
    .io_ifmOut(peArray_10_7_io_ifmOut)
  );
  PE peArray_10_8 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_10_8_clock),
    .io_weightIn(peArray_10_8_io_weightIn),
    .io_ifmIn(peArray_10_8_io_ifmIn),
    .io_parp(peArray_10_8_io_parp),
    .io_weightOut(peArray_10_8_io_weightOut),
    .io_ifmOut(peArray_10_8_io_ifmOut)
  );
  PE peArray_10_9 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_10_9_clock),
    .io_weightIn(peArray_10_9_io_weightIn),
    .io_ifmIn(peArray_10_9_io_ifmIn),
    .io_parp(peArray_10_9_io_parp),
    .io_weightOut(peArray_10_9_io_weightOut),
    .io_ifmOut(peArray_10_9_io_ifmOut)
  );
  PE peArray_10_10 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_10_10_clock),
    .io_weightIn(peArray_10_10_io_weightIn),
    .io_ifmIn(peArray_10_10_io_ifmIn),
    .io_parp(peArray_10_10_io_parp),
    .io_weightOut(peArray_10_10_io_weightOut),
    .io_ifmOut(peArray_10_10_io_ifmOut)
  );
  PE peArray_10_11 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_10_11_clock),
    .io_weightIn(peArray_10_11_io_weightIn),
    .io_ifmIn(peArray_10_11_io_ifmIn),
    .io_parp(peArray_10_11_io_parp),
    .io_weightOut(peArray_10_11_io_weightOut),
    .io_ifmOut(peArray_10_11_io_ifmOut)
  );
  PE peArray_11_0 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_11_0_clock),
    .io_weightIn(peArray_11_0_io_weightIn),
    .io_ifmIn(peArray_11_0_io_ifmIn),
    .io_parp(peArray_11_0_io_parp),
    .io_weightOut(peArray_11_0_io_weightOut),
    .io_ifmOut(peArray_11_0_io_ifmOut)
  );
  PE peArray_11_1 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_11_1_clock),
    .io_weightIn(peArray_11_1_io_weightIn),
    .io_ifmIn(peArray_11_1_io_ifmIn),
    .io_parp(peArray_11_1_io_parp),
    .io_weightOut(peArray_11_1_io_weightOut),
    .io_ifmOut(peArray_11_1_io_ifmOut)
  );
  PE peArray_11_2 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_11_2_clock),
    .io_weightIn(peArray_11_2_io_weightIn),
    .io_ifmIn(peArray_11_2_io_ifmIn),
    .io_parp(peArray_11_2_io_parp),
    .io_weightOut(peArray_11_2_io_weightOut),
    .io_ifmOut(peArray_11_2_io_ifmOut)
  );
  PE peArray_11_3 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_11_3_clock),
    .io_weightIn(peArray_11_3_io_weightIn),
    .io_ifmIn(peArray_11_3_io_ifmIn),
    .io_parp(peArray_11_3_io_parp),
    .io_weightOut(peArray_11_3_io_weightOut),
    .io_ifmOut(peArray_11_3_io_ifmOut)
  );
  PE peArray_11_4 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_11_4_clock),
    .io_weightIn(peArray_11_4_io_weightIn),
    .io_ifmIn(peArray_11_4_io_ifmIn),
    .io_parp(peArray_11_4_io_parp),
    .io_weightOut(peArray_11_4_io_weightOut),
    .io_ifmOut(peArray_11_4_io_ifmOut)
  );
  PE peArray_11_5 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_11_5_clock),
    .io_weightIn(peArray_11_5_io_weightIn),
    .io_ifmIn(peArray_11_5_io_ifmIn),
    .io_parp(peArray_11_5_io_parp),
    .io_weightOut(peArray_11_5_io_weightOut),
    .io_ifmOut(peArray_11_5_io_ifmOut)
  );
  PE peArray_11_6 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_11_6_clock),
    .io_weightIn(peArray_11_6_io_weightIn),
    .io_ifmIn(peArray_11_6_io_ifmIn),
    .io_parp(peArray_11_6_io_parp),
    .io_weightOut(peArray_11_6_io_weightOut),
    .io_ifmOut(peArray_11_6_io_ifmOut)
  );
  PE peArray_11_7 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_11_7_clock),
    .io_weightIn(peArray_11_7_io_weightIn),
    .io_ifmIn(peArray_11_7_io_ifmIn),
    .io_parp(peArray_11_7_io_parp),
    .io_weightOut(peArray_11_7_io_weightOut),
    .io_ifmOut(peArray_11_7_io_ifmOut)
  );
  PE peArray_11_8 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_11_8_clock),
    .io_weightIn(peArray_11_8_io_weightIn),
    .io_ifmIn(peArray_11_8_io_ifmIn),
    .io_parp(peArray_11_8_io_parp),
    .io_weightOut(peArray_11_8_io_weightOut),
    .io_ifmOut(peArray_11_8_io_ifmOut)
  );
  PE peArray_11_9 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_11_9_clock),
    .io_weightIn(peArray_11_9_io_weightIn),
    .io_ifmIn(peArray_11_9_io_ifmIn),
    .io_parp(peArray_11_9_io_parp),
    .io_weightOut(peArray_11_9_io_weightOut),
    .io_ifmOut(peArray_11_9_io_ifmOut)
  );
  PE peArray_11_10 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_11_10_clock),
    .io_weightIn(peArray_11_10_io_weightIn),
    .io_ifmIn(peArray_11_10_io_ifmIn),
    .io_parp(peArray_11_10_io_parp),
    .io_weightOut(peArray_11_10_io_weightOut),
    .io_ifmOut(peArray_11_10_io_ifmOut)
  );
  PE peArray_11_11 ( // @[SystolicArray.scala 14:40]
    .clock(peArray_11_11_clock),
    .io_weightIn(peArray_11_11_io_weightIn),
    .io_ifmIn(peArray_11_11_io_ifmIn),
    .io_parp(peArray_11_11_io_parp),
    .io_weightOut(peArray_11_11_io_weightOut),
    .io_ifmOut(peArray_11_11_io_ifmOut)
  );
  assign io_gridParpOut_0_0 = peArray_0_0_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_0_1 = peArray_0_1_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_0_2 = peArray_0_2_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_0_3 = peArray_0_3_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_0_4 = peArray_0_4_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_0_5 = peArray_0_5_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_0_6 = peArray_0_6_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_0_7 = peArray_0_7_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_0_8 = peArray_0_8_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_0_9 = peArray_0_9_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_0_10 = peArray_0_10_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_0_11 = peArray_0_11_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_1_0 = peArray_1_0_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_1_1 = peArray_1_1_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_1_2 = peArray_1_2_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_1_3 = peArray_1_3_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_1_4 = peArray_1_4_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_1_5 = peArray_1_5_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_1_6 = peArray_1_6_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_1_7 = peArray_1_7_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_1_8 = peArray_1_8_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_1_9 = peArray_1_9_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_1_10 = peArray_1_10_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_1_11 = peArray_1_11_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_2_0 = peArray_2_0_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_2_1 = peArray_2_1_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_2_2 = peArray_2_2_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_2_3 = peArray_2_3_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_2_4 = peArray_2_4_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_2_5 = peArray_2_5_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_2_6 = peArray_2_6_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_2_7 = peArray_2_7_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_2_8 = peArray_2_8_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_2_9 = peArray_2_9_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_2_10 = peArray_2_10_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_2_11 = peArray_2_11_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_3_0 = peArray_3_0_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_3_1 = peArray_3_1_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_3_2 = peArray_3_2_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_3_3 = peArray_3_3_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_3_4 = peArray_3_4_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_3_5 = peArray_3_5_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_3_6 = peArray_3_6_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_3_7 = peArray_3_7_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_3_8 = peArray_3_8_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_3_9 = peArray_3_9_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_3_10 = peArray_3_10_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_3_11 = peArray_3_11_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_4_0 = peArray_4_0_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_4_1 = peArray_4_1_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_4_2 = peArray_4_2_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_4_3 = peArray_4_3_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_4_4 = peArray_4_4_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_4_5 = peArray_4_5_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_4_6 = peArray_4_6_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_4_7 = peArray_4_7_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_4_8 = peArray_4_8_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_4_9 = peArray_4_9_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_4_10 = peArray_4_10_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_4_11 = peArray_4_11_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_5_0 = peArray_5_0_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_5_1 = peArray_5_1_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_5_2 = peArray_5_2_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_5_3 = peArray_5_3_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_5_4 = peArray_5_4_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_5_5 = peArray_5_5_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_5_6 = peArray_5_6_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_5_7 = peArray_5_7_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_5_8 = peArray_5_8_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_5_9 = peArray_5_9_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_5_10 = peArray_5_10_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_5_11 = peArray_5_11_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_6_0 = peArray_6_0_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_6_1 = peArray_6_1_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_6_2 = peArray_6_2_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_6_3 = peArray_6_3_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_6_4 = peArray_6_4_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_6_5 = peArray_6_5_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_6_6 = peArray_6_6_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_6_7 = peArray_6_7_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_6_8 = peArray_6_8_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_6_9 = peArray_6_9_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_6_10 = peArray_6_10_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_6_11 = peArray_6_11_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_7_0 = peArray_7_0_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_7_1 = peArray_7_1_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_7_2 = peArray_7_2_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_7_3 = peArray_7_3_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_7_4 = peArray_7_4_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_7_5 = peArray_7_5_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_7_6 = peArray_7_6_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_7_7 = peArray_7_7_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_7_8 = peArray_7_8_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_7_9 = peArray_7_9_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_7_10 = peArray_7_10_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_7_11 = peArray_7_11_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_8_0 = peArray_8_0_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_8_1 = peArray_8_1_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_8_2 = peArray_8_2_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_8_3 = peArray_8_3_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_8_4 = peArray_8_4_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_8_5 = peArray_8_5_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_8_6 = peArray_8_6_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_8_7 = peArray_8_7_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_8_8 = peArray_8_8_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_8_9 = peArray_8_9_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_8_10 = peArray_8_10_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_8_11 = peArray_8_11_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_9_0 = peArray_9_0_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_9_1 = peArray_9_1_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_9_2 = peArray_9_2_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_9_3 = peArray_9_3_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_9_4 = peArray_9_4_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_9_5 = peArray_9_5_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_9_6 = peArray_9_6_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_9_7 = peArray_9_7_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_9_8 = peArray_9_8_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_9_9 = peArray_9_9_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_9_10 = peArray_9_10_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_9_11 = peArray_9_11_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_10_0 = peArray_10_0_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_10_1 = peArray_10_1_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_10_2 = peArray_10_2_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_10_3 = peArray_10_3_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_10_4 = peArray_10_4_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_10_5 = peArray_10_5_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_10_6 = peArray_10_6_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_10_7 = peArray_10_7_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_10_8 = peArray_10_8_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_10_9 = peArray_10_9_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_10_10 = peArray_10_10_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_10_11 = peArray_10_11_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_11_0 = peArray_11_0_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_11_1 = peArray_11_1_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_11_2 = peArray_11_2_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_11_3 = peArray_11_3_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_11_4 = peArray_11_4_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_11_5 = peArray_11_5_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_11_6 = peArray_11_6_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_11_7 = peArray_11_7_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_11_8 = peArray_11_8_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_11_9 = peArray_11_9_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_11_10 = peArray_11_10_io_parp; // @[SystolicArray.scala 32:32]
  assign io_gridParpOut_11_11 = peArray_11_11_io_parp; // @[SystolicArray.scala 32:32]
  assign peArray_0_0_clock = clock;
  assign peArray_0_0_io_weightIn = io_gridWeightIn_0; // @[SystolicArray.scala 26:39]
  assign peArray_0_0_io_ifmIn = io_gridIfmIn_0; // @[SystolicArray.scala 20:36]
  assign peArray_0_1_clock = clock;
  assign peArray_0_1_io_weightIn = peArray_0_0_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_0_1_io_ifmIn = io_gridIfmIn_1; // @[SystolicArray.scala 20:36]
  assign peArray_0_2_clock = clock;
  assign peArray_0_2_io_weightIn = peArray_0_1_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_0_2_io_ifmIn = io_gridIfmIn_2; // @[SystolicArray.scala 20:36]
  assign peArray_0_3_clock = clock;
  assign peArray_0_3_io_weightIn = peArray_0_2_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_0_3_io_ifmIn = io_gridIfmIn_3; // @[SystolicArray.scala 20:36]
  assign peArray_0_4_clock = clock;
  assign peArray_0_4_io_weightIn = peArray_0_3_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_0_4_io_ifmIn = io_gridIfmIn_4; // @[SystolicArray.scala 20:36]
  assign peArray_0_5_clock = clock;
  assign peArray_0_5_io_weightIn = peArray_0_4_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_0_5_io_ifmIn = io_gridIfmIn_5; // @[SystolicArray.scala 20:36]
  assign peArray_0_6_clock = clock;
  assign peArray_0_6_io_weightIn = peArray_0_5_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_0_6_io_ifmIn = io_gridIfmIn_6; // @[SystolicArray.scala 20:36]
  assign peArray_0_7_clock = clock;
  assign peArray_0_7_io_weightIn = peArray_0_6_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_0_7_io_ifmIn = io_gridIfmIn_7; // @[SystolicArray.scala 20:36]
  assign peArray_0_8_clock = clock;
  assign peArray_0_8_io_weightIn = peArray_0_7_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_0_8_io_ifmIn = io_gridIfmIn_8; // @[SystolicArray.scala 20:36]
  assign peArray_0_9_clock = clock;
  assign peArray_0_9_io_weightIn = peArray_0_8_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_0_9_io_ifmIn = io_gridIfmIn_9; // @[SystolicArray.scala 20:36]
  assign peArray_0_10_clock = clock;
  assign peArray_0_10_io_weightIn = peArray_0_9_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_0_10_io_ifmIn = io_gridIfmIn_10; // @[SystolicArray.scala 20:36]
  assign peArray_0_11_clock = clock;
  assign peArray_0_11_io_weightIn = peArray_0_10_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_0_11_io_ifmIn = io_gridIfmIn_11; // @[SystolicArray.scala 20:36]
  assign peArray_1_0_clock = clock;
  assign peArray_1_0_io_weightIn = io_gridWeightIn_1; // @[SystolicArray.scala 26:39]
  assign peArray_1_0_io_ifmIn = peArray_0_0_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_1_1_clock = clock;
  assign peArray_1_1_io_weightIn = peArray_1_0_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_1_1_io_ifmIn = peArray_0_1_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_1_2_clock = clock;
  assign peArray_1_2_io_weightIn = peArray_1_1_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_1_2_io_ifmIn = peArray_0_2_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_1_3_clock = clock;
  assign peArray_1_3_io_weightIn = peArray_1_2_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_1_3_io_ifmIn = peArray_0_3_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_1_4_clock = clock;
  assign peArray_1_4_io_weightIn = peArray_1_3_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_1_4_io_ifmIn = peArray_0_4_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_1_5_clock = clock;
  assign peArray_1_5_io_weightIn = peArray_1_4_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_1_5_io_ifmIn = peArray_0_5_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_1_6_clock = clock;
  assign peArray_1_6_io_weightIn = peArray_1_5_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_1_6_io_ifmIn = peArray_0_6_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_1_7_clock = clock;
  assign peArray_1_7_io_weightIn = peArray_1_6_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_1_7_io_ifmIn = peArray_0_7_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_1_8_clock = clock;
  assign peArray_1_8_io_weightIn = peArray_1_7_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_1_8_io_ifmIn = peArray_0_8_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_1_9_clock = clock;
  assign peArray_1_9_io_weightIn = peArray_1_8_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_1_9_io_ifmIn = peArray_0_9_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_1_10_clock = clock;
  assign peArray_1_10_io_weightIn = peArray_1_9_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_1_10_io_ifmIn = peArray_0_10_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_1_11_clock = clock;
  assign peArray_1_11_io_weightIn = peArray_1_10_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_1_11_io_ifmIn = peArray_0_11_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_2_0_clock = clock;
  assign peArray_2_0_io_weightIn = io_gridWeightIn_2; // @[SystolicArray.scala 26:39]
  assign peArray_2_0_io_ifmIn = peArray_1_0_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_2_1_clock = clock;
  assign peArray_2_1_io_weightIn = peArray_2_0_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_2_1_io_ifmIn = peArray_1_1_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_2_2_clock = clock;
  assign peArray_2_2_io_weightIn = peArray_2_1_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_2_2_io_ifmIn = peArray_1_2_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_2_3_clock = clock;
  assign peArray_2_3_io_weightIn = peArray_2_2_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_2_3_io_ifmIn = peArray_1_3_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_2_4_clock = clock;
  assign peArray_2_4_io_weightIn = peArray_2_3_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_2_4_io_ifmIn = peArray_1_4_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_2_5_clock = clock;
  assign peArray_2_5_io_weightIn = peArray_2_4_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_2_5_io_ifmIn = peArray_1_5_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_2_6_clock = clock;
  assign peArray_2_6_io_weightIn = peArray_2_5_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_2_6_io_ifmIn = peArray_1_6_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_2_7_clock = clock;
  assign peArray_2_7_io_weightIn = peArray_2_6_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_2_7_io_ifmIn = peArray_1_7_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_2_8_clock = clock;
  assign peArray_2_8_io_weightIn = peArray_2_7_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_2_8_io_ifmIn = peArray_1_8_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_2_9_clock = clock;
  assign peArray_2_9_io_weightIn = peArray_2_8_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_2_9_io_ifmIn = peArray_1_9_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_2_10_clock = clock;
  assign peArray_2_10_io_weightIn = peArray_2_9_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_2_10_io_ifmIn = peArray_1_10_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_2_11_clock = clock;
  assign peArray_2_11_io_weightIn = peArray_2_10_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_2_11_io_ifmIn = peArray_1_11_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_3_0_clock = clock;
  assign peArray_3_0_io_weightIn = io_gridWeightIn_3; // @[SystolicArray.scala 26:39]
  assign peArray_3_0_io_ifmIn = peArray_2_0_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_3_1_clock = clock;
  assign peArray_3_1_io_weightIn = peArray_3_0_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_3_1_io_ifmIn = peArray_2_1_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_3_2_clock = clock;
  assign peArray_3_2_io_weightIn = peArray_3_1_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_3_2_io_ifmIn = peArray_2_2_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_3_3_clock = clock;
  assign peArray_3_3_io_weightIn = peArray_3_2_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_3_3_io_ifmIn = peArray_2_3_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_3_4_clock = clock;
  assign peArray_3_4_io_weightIn = peArray_3_3_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_3_4_io_ifmIn = peArray_2_4_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_3_5_clock = clock;
  assign peArray_3_5_io_weightIn = peArray_3_4_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_3_5_io_ifmIn = peArray_2_5_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_3_6_clock = clock;
  assign peArray_3_6_io_weightIn = peArray_3_5_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_3_6_io_ifmIn = peArray_2_6_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_3_7_clock = clock;
  assign peArray_3_7_io_weightIn = peArray_3_6_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_3_7_io_ifmIn = peArray_2_7_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_3_8_clock = clock;
  assign peArray_3_8_io_weightIn = peArray_3_7_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_3_8_io_ifmIn = peArray_2_8_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_3_9_clock = clock;
  assign peArray_3_9_io_weightIn = peArray_3_8_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_3_9_io_ifmIn = peArray_2_9_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_3_10_clock = clock;
  assign peArray_3_10_io_weightIn = peArray_3_9_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_3_10_io_ifmIn = peArray_2_10_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_3_11_clock = clock;
  assign peArray_3_11_io_weightIn = peArray_3_10_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_3_11_io_ifmIn = peArray_2_11_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_4_0_clock = clock;
  assign peArray_4_0_io_weightIn = io_gridWeightIn_4; // @[SystolicArray.scala 26:39]
  assign peArray_4_0_io_ifmIn = peArray_3_0_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_4_1_clock = clock;
  assign peArray_4_1_io_weightIn = peArray_4_0_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_4_1_io_ifmIn = peArray_3_1_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_4_2_clock = clock;
  assign peArray_4_2_io_weightIn = peArray_4_1_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_4_2_io_ifmIn = peArray_3_2_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_4_3_clock = clock;
  assign peArray_4_3_io_weightIn = peArray_4_2_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_4_3_io_ifmIn = peArray_3_3_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_4_4_clock = clock;
  assign peArray_4_4_io_weightIn = peArray_4_3_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_4_4_io_ifmIn = peArray_3_4_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_4_5_clock = clock;
  assign peArray_4_5_io_weightIn = peArray_4_4_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_4_5_io_ifmIn = peArray_3_5_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_4_6_clock = clock;
  assign peArray_4_6_io_weightIn = peArray_4_5_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_4_6_io_ifmIn = peArray_3_6_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_4_7_clock = clock;
  assign peArray_4_7_io_weightIn = peArray_4_6_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_4_7_io_ifmIn = peArray_3_7_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_4_8_clock = clock;
  assign peArray_4_8_io_weightIn = peArray_4_7_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_4_8_io_ifmIn = peArray_3_8_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_4_9_clock = clock;
  assign peArray_4_9_io_weightIn = peArray_4_8_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_4_9_io_ifmIn = peArray_3_9_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_4_10_clock = clock;
  assign peArray_4_10_io_weightIn = peArray_4_9_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_4_10_io_ifmIn = peArray_3_10_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_4_11_clock = clock;
  assign peArray_4_11_io_weightIn = peArray_4_10_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_4_11_io_ifmIn = peArray_3_11_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_5_0_clock = clock;
  assign peArray_5_0_io_weightIn = io_gridWeightIn_5; // @[SystolicArray.scala 26:39]
  assign peArray_5_0_io_ifmIn = peArray_4_0_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_5_1_clock = clock;
  assign peArray_5_1_io_weightIn = peArray_5_0_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_5_1_io_ifmIn = peArray_4_1_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_5_2_clock = clock;
  assign peArray_5_2_io_weightIn = peArray_5_1_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_5_2_io_ifmIn = peArray_4_2_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_5_3_clock = clock;
  assign peArray_5_3_io_weightIn = peArray_5_2_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_5_3_io_ifmIn = peArray_4_3_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_5_4_clock = clock;
  assign peArray_5_4_io_weightIn = peArray_5_3_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_5_4_io_ifmIn = peArray_4_4_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_5_5_clock = clock;
  assign peArray_5_5_io_weightIn = peArray_5_4_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_5_5_io_ifmIn = peArray_4_5_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_5_6_clock = clock;
  assign peArray_5_6_io_weightIn = peArray_5_5_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_5_6_io_ifmIn = peArray_4_6_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_5_7_clock = clock;
  assign peArray_5_7_io_weightIn = peArray_5_6_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_5_7_io_ifmIn = peArray_4_7_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_5_8_clock = clock;
  assign peArray_5_8_io_weightIn = peArray_5_7_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_5_8_io_ifmIn = peArray_4_8_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_5_9_clock = clock;
  assign peArray_5_9_io_weightIn = peArray_5_8_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_5_9_io_ifmIn = peArray_4_9_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_5_10_clock = clock;
  assign peArray_5_10_io_weightIn = peArray_5_9_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_5_10_io_ifmIn = peArray_4_10_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_5_11_clock = clock;
  assign peArray_5_11_io_weightIn = peArray_5_10_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_5_11_io_ifmIn = peArray_4_11_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_6_0_clock = clock;
  assign peArray_6_0_io_weightIn = io_gridWeightIn_6; // @[SystolicArray.scala 26:39]
  assign peArray_6_0_io_ifmIn = peArray_5_0_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_6_1_clock = clock;
  assign peArray_6_1_io_weightIn = peArray_6_0_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_6_1_io_ifmIn = peArray_5_1_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_6_2_clock = clock;
  assign peArray_6_2_io_weightIn = peArray_6_1_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_6_2_io_ifmIn = peArray_5_2_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_6_3_clock = clock;
  assign peArray_6_3_io_weightIn = peArray_6_2_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_6_3_io_ifmIn = peArray_5_3_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_6_4_clock = clock;
  assign peArray_6_4_io_weightIn = peArray_6_3_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_6_4_io_ifmIn = peArray_5_4_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_6_5_clock = clock;
  assign peArray_6_5_io_weightIn = peArray_6_4_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_6_5_io_ifmIn = peArray_5_5_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_6_6_clock = clock;
  assign peArray_6_6_io_weightIn = peArray_6_5_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_6_6_io_ifmIn = peArray_5_6_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_6_7_clock = clock;
  assign peArray_6_7_io_weightIn = peArray_6_6_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_6_7_io_ifmIn = peArray_5_7_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_6_8_clock = clock;
  assign peArray_6_8_io_weightIn = peArray_6_7_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_6_8_io_ifmIn = peArray_5_8_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_6_9_clock = clock;
  assign peArray_6_9_io_weightIn = peArray_6_8_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_6_9_io_ifmIn = peArray_5_9_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_6_10_clock = clock;
  assign peArray_6_10_io_weightIn = peArray_6_9_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_6_10_io_ifmIn = peArray_5_10_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_6_11_clock = clock;
  assign peArray_6_11_io_weightIn = peArray_6_10_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_6_11_io_ifmIn = peArray_5_11_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_7_0_clock = clock;
  assign peArray_7_0_io_weightIn = io_gridWeightIn_7; // @[SystolicArray.scala 26:39]
  assign peArray_7_0_io_ifmIn = peArray_6_0_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_7_1_clock = clock;
  assign peArray_7_1_io_weightIn = peArray_7_0_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_7_1_io_ifmIn = peArray_6_1_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_7_2_clock = clock;
  assign peArray_7_2_io_weightIn = peArray_7_1_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_7_2_io_ifmIn = peArray_6_2_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_7_3_clock = clock;
  assign peArray_7_3_io_weightIn = peArray_7_2_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_7_3_io_ifmIn = peArray_6_3_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_7_4_clock = clock;
  assign peArray_7_4_io_weightIn = peArray_7_3_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_7_4_io_ifmIn = peArray_6_4_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_7_5_clock = clock;
  assign peArray_7_5_io_weightIn = peArray_7_4_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_7_5_io_ifmIn = peArray_6_5_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_7_6_clock = clock;
  assign peArray_7_6_io_weightIn = peArray_7_5_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_7_6_io_ifmIn = peArray_6_6_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_7_7_clock = clock;
  assign peArray_7_7_io_weightIn = peArray_7_6_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_7_7_io_ifmIn = peArray_6_7_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_7_8_clock = clock;
  assign peArray_7_8_io_weightIn = peArray_7_7_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_7_8_io_ifmIn = peArray_6_8_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_7_9_clock = clock;
  assign peArray_7_9_io_weightIn = peArray_7_8_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_7_9_io_ifmIn = peArray_6_9_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_7_10_clock = clock;
  assign peArray_7_10_io_weightIn = peArray_7_9_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_7_10_io_ifmIn = peArray_6_10_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_7_11_clock = clock;
  assign peArray_7_11_io_weightIn = peArray_7_10_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_7_11_io_ifmIn = peArray_6_11_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_8_0_clock = clock;
  assign peArray_8_0_io_weightIn = io_gridWeightIn_8; // @[SystolicArray.scala 26:39]
  assign peArray_8_0_io_ifmIn = peArray_7_0_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_8_1_clock = clock;
  assign peArray_8_1_io_weightIn = peArray_8_0_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_8_1_io_ifmIn = peArray_7_1_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_8_2_clock = clock;
  assign peArray_8_2_io_weightIn = peArray_8_1_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_8_2_io_ifmIn = peArray_7_2_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_8_3_clock = clock;
  assign peArray_8_3_io_weightIn = peArray_8_2_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_8_3_io_ifmIn = peArray_7_3_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_8_4_clock = clock;
  assign peArray_8_4_io_weightIn = peArray_8_3_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_8_4_io_ifmIn = peArray_7_4_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_8_5_clock = clock;
  assign peArray_8_5_io_weightIn = peArray_8_4_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_8_5_io_ifmIn = peArray_7_5_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_8_6_clock = clock;
  assign peArray_8_6_io_weightIn = peArray_8_5_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_8_6_io_ifmIn = peArray_7_6_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_8_7_clock = clock;
  assign peArray_8_7_io_weightIn = peArray_8_6_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_8_7_io_ifmIn = peArray_7_7_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_8_8_clock = clock;
  assign peArray_8_8_io_weightIn = peArray_8_7_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_8_8_io_ifmIn = peArray_7_8_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_8_9_clock = clock;
  assign peArray_8_9_io_weightIn = peArray_8_8_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_8_9_io_ifmIn = peArray_7_9_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_8_10_clock = clock;
  assign peArray_8_10_io_weightIn = peArray_8_9_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_8_10_io_ifmIn = peArray_7_10_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_8_11_clock = clock;
  assign peArray_8_11_io_weightIn = peArray_8_10_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_8_11_io_ifmIn = peArray_7_11_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_9_0_clock = clock;
  assign peArray_9_0_io_weightIn = io_gridWeightIn_9; // @[SystolicArray.scala 26:39]
  assign peArray_9_0_io_ifmIn = peArray_8_0_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_9_1_clock = clock;
  assign peArray_9_1_io_weightIn = peArray_9_0_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_9_1_io_ifmIn = peArray_8_1_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_9_2_clock = clock;
  assign peArray_9_2_io_weightIn = peArray_9_1_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_9_2_io_ifmIn = peArray_8_2_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_9_3_clock = clock;
  assign peArray_9_3_io_weightIn = peArray_9_2_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_9_3_io_ifmIn = peArray_8_3_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_9_4_clock = clock;
  assign peArray_9_4_io_weightIn = peArray_9_3_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_9_4_io_ifmIn = peArray_8_4_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_9_5_clock = clock;
  assign peArray_9_5_io_weightIn = peArray_9_4_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_9_5_io_ifmIn = peArray_8_5_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_9_6_clock = clock;
  assign peArray_9_6_io_weightIn = peArray_9_5_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_9_6_io_ifmIn = peArray_8_6_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_9_7_clock = clock;
  assign peArray_9_7_io_weightIn = peArray_9_6_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_9_7_io_ifmIn = peArray_8_7_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_9_8_clock = clock;
  assign peArray_9_8_io_weightIn = peArray_9_7_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_9_8_io_ifmIn = peArray_8_8_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_9_9_clock = clock;
  assign peArray_9_9_io_weightIn = peArray_9_8_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_9_9_io_ifmIn = peArray_8_9_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_9_10_clock = clock;
  assign peArray_9_10_io_weightIn = peArray_9_9_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_9_10_io_ifmIn = peArray_8_10_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_9_11_clock = clock;
  assign peArray_9_11_io_weightIn = peArray_9_10_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_9_11_io_ifmIn = peArray_8_11_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_10_0_clock = clock;
  assign peArray_10_0_io_weightIn = io_gridWeightIn_10; // @[SystolicArray.scala 26:39]
  assign peArray_10_0_io_ifmIn = peArray_9_0_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_10_1_clock = clock;
  assign peArray_10_1_io_weightIn = peArray_10_0_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_10_1_io_ifmIn = peArray_9_1_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_10_2_clock = clock;
  assign peArray_10_2_io_weightIn = peArray_10_1_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_10_2_io_ifmIn = peArray_9_2_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_10_3_clock = clock;
  assign peArray_10_3_io_weightIn = peArray_10_2_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_10_3_io_ifmIn = peArray_9_3_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_10_4_clock = clock;
  assign peArray_10_4_io_weightIn = peArray_10_3_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_10_4_io_ifmIn = peArray_9_4_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_10_5_clock = clock;
  assign peArray_10_5_io_weightIn = peArray_10_4_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_10_5_io_ifmIn = peArray_9_5_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_10_6_clock = clock;
  assign peArray_10_6_io_weightIn = peArray_10_5_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_10_6_io_ifmIn = peArray_9_6_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_10_7_clock = clock;
  assign peArray_10_7_io_weightIn = peArray_10_6_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_10_7_io_ifmIn = peArray_9_7_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_10_8_clock = clock;
  assign peArray_10_8_io_weightIn = peArray_10_7_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_10_8_io_ifmIn = peArray_9_8_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_10_9_clock = clock;
  assign peArray_10_9_io_weightIn = peArray_10_8_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_10_9_io_ifmIn = peArray_9_9_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_10_10_clock = clock;
  assign peArray_10_10_io_weightIn = peArray_10_9_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_10_10_io_ifmIn = peArray_9_10_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_10_11_clock = clock;
  assign peArray_10_11_io_weightIn = peArray_10_10_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_10_11_io_ifmIn = peArray_9_11_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_11_0_clock = clock;
  assign peArray_11_0_io_weightIn = io_gridWeightIn_11; // @[SystolicArray.scala 26:39]
  assign peArray_11_0_io_ifmIn = peArray_10_0_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_11_1_clock = clock;
  assign peArray_11_1_io_weightIn = peArray_11_0_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_11_1_io_ifmIn = peArray_10_1_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_11_2_clock = clock;
  assign peArray_11_2_io_weightIn = peArray_11_1_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_11_2_io_ifmIn = peArray_10_2_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_11_3_clock = clock;
  assign peArray_11_3_io_weightIn = peArray_11_2_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_11_3_io_ifmIn = peArray_10_3_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_11_4_clock = clock;
  assign peArray_11_4_io_weightIn = peArray_11_3_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_11_4_io_ifmIn = peArray_10_4_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_11_5_clock = clock;
  assign peArray_11_5_io_weightIn = peArray_11_4_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_11_5_io_ifmIn = peArray_10_5_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_11_6_clock = clock;
  assign peArray_11_6_io_weightIn = peArray_11_5_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_11_6_io_ifmIn = peArray_10_6_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_11_7_clock = clock;
  assign peArray_11_7_io_weightIn = peArray_11_6_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_11_7_io_ifmIn = peArray_10_7_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_11_8_clock = clock;
  assign peArray_11_8_io_weightIn = peArray_11_7_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_11_8_io_ifmIn = peArray_10_8_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_11_9_clock = clock;
  assign peArray_11_9_io_weightIn = peArray_11_8_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_11_9_io_ifmIn = peArray_10_9_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_11_10_clock = clock;
  assign peArray_11_10_io_weightIn = peArray_11_9_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_11_10_io_ifmIn = peArray_10_10_io_ifmOut; // @[SystolicArray.scala 22:36]
  assign peArray_11_11_clock = clock;
  assign peArray_11_11_io_weightIn = peArray_11_10_io_weightOut; // @[SystolicArray.scala 28:39]
  assign peArray_11_11_io_ifmIn = peArray_10_11_io_ifmOut; // @[SystolicArray.scala 22:36]
endmodule
