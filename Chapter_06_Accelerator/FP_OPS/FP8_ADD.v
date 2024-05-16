module FP8_ADD(
  input        clock,
  input        reset,
  input  [7:0] io_inputA,
  input  [7:0] io_inputB,
  output [7:0] io_output
);
  wire  signA = io_inputA[7]; // @[FP8_ADD.scala 12:18]
  wire [4:0] expA = io_inputA[6:2]; // @[FP8_ADD.scala 13:22]
  wire [1:0] sigA = io_inputA[1:0]; // @[FP8_ADD.scala 14:25]
  wire  signB = io_inputB[7]; // @[FP8_ADD.scala 12:18]
  wire [4:0] expB = io_inputB[6:2]; // @[FP8_ADD.scala 13:22]
  wire [1:0] sigB = io_inputB[1:0]; // @[FP8_ADD.scala 14:25]
  wire  _infFlagA_T = expA == 5'h1f; // @[FP8_ADD.scala 23:23]
  wire  _infFlagA_T_1 = sigA == 2'h0; // @[FP8_ADD.scala 23:46]
  wire  infFlagA = expA == 5'h1f & sigA == 2'h0; // @[FP8_ADD.scala 23:38]
  wire  _infFlagB_T = expB == 5'h1f; // @[FP8_ADD.scala 24:23]
  wire  _infFlagB_T_1 = sigB == 2'h0; // @[FP8_ADD.scala 24:46]
  wire  infFlagB = expB == 5'h1f & sigB == 2'h0; // @[FP8_ADD.scala 24:38]
  wire  zeroFlagA = expA == 5'h0 & _infFlagA_T_1; // @[FP8_ADD.scala 27:39]
  wire  zeroFlagB = expB == 5'h0 & _infFlagB_T_1; // @[FP8_ADD.scala 28:39]
  wire  nanFlagA = _infFlagA_T & sigA != 2'h0; // @[FP8_ADD.scala 31:38]
  wire  nanFlagB = _infFlagB_T & sigB != 2'h0; // @[FP8_ADD.scala 32:38]
  wire [7:0] _io_output_T = infFlagA ? io_inputA : io_inputB; // @[FP8_ADD.scala 46:23]
  wire [7:0] _GEN_0 = infFlagA & infFlagB & signA != signB ? 8'h7f : _io_output_T; // @[FP8_ADD.scala 43:53 44:17 46:17]
  wire [6:0] _GEN_3 = nanFlagA | nanFlagB ? 7'h7f : 7'h0; // @[FP8_ADD.scala 48:35 49:15]
  wire [7:0] _GEN_4 = infFlagA | infFlagB ? _GEN_0 : {{1'd0}, _GEN_3}; // @[FP8_ADD.scala 41:35]
  assign io_output = zeroFlagA & zeroFlagB ? 8'h0 : _GEN_4; // @[FP8_ADD.scala 38:32 40:15]
endmodule
