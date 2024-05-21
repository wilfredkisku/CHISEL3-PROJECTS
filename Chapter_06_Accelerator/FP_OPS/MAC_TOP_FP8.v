module FP8_MUL(
  input  [7:0] io_inputA,
  input  [7:0] io_inputB,
  output [7:0] io_output
);
  wire  signA = io_inputA[7]; // @[FP8_MUL.scala 13:20]
  wire [4:0] expA = io_inputA[6:2]; // @[FP8_MUL.scala 14:24]
  wire [1:0] sigA = io_inputA[1:0]; // @[FP8_MUL.scala 15:27]
  wire  signB = io_inputB[7]; // @[FP8_MUL.scala 13:20]
  wire [4:0] expB = io_inputB[6:2]; // @[FP8_MUL.scala 14:24]
  wire [1:0] sigB = io_inputB[1:0]; // @[FP8_MUL.scala 15:27]
  wire  _infFlagA_T = expA == 5'h1f; // @[FP8_MUL.scala 24:25]
  wire  _infFlagA_T_1 = sigA == 2'h0; // @[FP8_MUL.scala 24:48]
  wire  infFlagA = expA == 5'h1f & sigA == 2'h0; // @[FP8_MUL.scala 24:40]
  wire  _infFlagB_T = expB == 5'h1f; // @[FP8_MUL.scala 25:25]
  wire  _infFlagB_T_1 = sigB == 2'h0; // @[FP8_MUL.scala 25:48]
  wire  infFlagB = expB == 5'h1f & sigB == 2'h0; // @[FP8_MUL.scala 25:40]
  wire  _zeroFlagA_T = expA == 5'h0; // @[FP8_MUL.scala 28:26]
  wire  zeroFlagA = expA == 5'h0 & _infFlagA_T_1; // @[FP8_MUL.scala 28:41]
  wire  _zeroFlagB_T = expB == 5'h0; // @[FP8_MUL.scala 29:26]
  wire  zeroFlagB = expB == 5'h0 & _infFlagB_T_1; // @[FP8_MUL.scala 29:41]
  wire  _nanFlagA_T_1 = sigA != 2'h0; // @[FP8_MUL.scala 32:48]
  wire  nanFlagA = _infFlagA_T & sigA != 2'h0; // @[FP8_MUL.scala 32:40]
  wire  _nanFlagB_T_1 = sigB != 2'h0; // @[FP8_MUL.scala 33:48]
  wire  nanFlagB = _infFlagB_T & sigB != 2'h0; // @[FP8_MUL.scala 33:40]
  wire  subFlagA = _zeroFlagA_T & _nanFlagA_T_1; // @[FP8_MUL.scala 36:40]
  wire  subFlagB = _zeroFlagB_T & _nanFlagB_T_1; // @[FP8_MUL.scala 37:40]
  wire [7:0] _io_output_T = infFlagA ? io_inputA : io_inputB; // @[FP8_MUL.scala 55:23]
  wire [7:0] _GEN_0 = infFlagA & infFlagB & signA != signB ? 8'h7f : _io_output_T; // @[FP8_MUL.scala 52:53 53:17 55:17]
  wire [5:0] _ovrChk_6_T = expA + expB; // @[FP8_MUL.scala 61:22]
  wire  _sigMul_6_T = ~subFlagA; // @[FP8_MUL.scala 62:21]
  wire [2:0] _sigMul_6_T_1 = {_sigMul_6_T,sigA}; // @[Cat.scala 33:92]
  wire  _sigMul_6_T_2 = ~subFlagB; // @[FP8_MUL.scala 62:43]
  wire [2:0] _sigMul_6_T_3 = {_sigMul_6_T_2,sigB}; // @[Cat.scala 33:92]
  wire [5:0] _sigMul_6_T_4 = _sigMul_6_T_1 * _sigMul_6_T_3; // @[FP8_MUL.scala 62:37]
  wire [5:0] _GEN_4 = nanFlagA | nanFlagB ? 6'h0 : _ovrChk_6_T; // @[FP8_MUL.scala 42:14 57:35 61:14]
  wire [5:0] _GEN_7 = infFlagA | infFlagB ? 6'h0 : _GEN_4; // @[FP8_MUL.scala 42:14 50:35]
  wire [5:0] _GEN_10 = zeroFlagA | zeroFlagB ? 6'h0 : _GEN_7; // @[FP8_MUL.scala 42:14 48:37]
  wire [5:0] ovrChk_6 = zeroFlagA & zeroFlagB ? 6'h0 : _GEN_10; // @[FP8_MUL.scala 42:14 45:32]
  wire  _io_output_T_1 = signA ^ signB; // @[FP8_MUL.scala 64:30]
  wire [7:0] _io_output_T_2 = {_io_output_T_1,7'h7c}; // @[Cat.scala 33:92]
  wire [5:0] _io_output_T_5 = ovrChk_6 - 6'hf; // @[FP8_MUL.scala 69:50]
  wire [5:0] _GEN_5 = nanFlagA | nanFlagB ? 6'h0 : _sigMul_6_T_4; // @[FP8_MUL.scala 43:14 57:35 62:14]
  wire [5:0] _GEN_8 = infFlagA | infFlagB ? 6'h0 : _GEN_5; // @[FP8_MUL.scala 43:14 50:35]
  wire [5:0] _GEN_11 = zeroFlagA | zeroFlagB ? 6'h0 : _GEN_8; // @[FP8_MUL.scala 43:14 48:37]
  wire [5:0] sigMul_6 = zeroFlagA & zeroFlagB ? 6'h0 : _GEN_11; // @[FP8_MUL.scala 43:14 45:32]
  wire [4:0] _GEN_15 = {{4'd0}, sigMul_6[5]}; // @[FP8_MUL.scala 69:63]
  wire [4:0] _io_output_T_9 = _io_output_T_5[4:0] + _GEN_15; // @[FP8_MUL.scala 69:63]
  wire [5:0] _io_output_T_11 = sigMul_6 >> sigMul_6[5]; // @[FP8_MUL.scala 69:89]
  wire [7:0] _io_output_T_13 = {_io_output_T_1,_io_output_T_9,_io_output_T_11[3:2]}; // @[Cat.scala 33:92]
  wire [7:0] _GEN_1 = ovrChk_6 < 6'hf ? 8'h0 : _io_output_T_13; // @[FP8_MUL.scala 65:32 66:17 69:17]
  wire [7:0] _GEN_2 = ovrChk_6 > 6'h2d ? _io_output_T_2 : _GEN_1; // @[FP8_MUL.scala 63:26 64:17]
  wire [7:0] _GEN_3 = nanFlagA | nanFlagB ? 8'h7f : _GEN_2; // @[FP8_MUL.scala 57:35 58:15]
  wire [7:0] _GEN_6 = infFlagA | infFlagB ? _GEN_0 : _GEN_3; // @[FP8_MUL.scala 50:35]
  wire [7:0] _GEN_9 = zeroFlagA | zeroFlagB ? 8'h0 : _GEN_6; // @[FP8_MUL.scala 48:37 49:15]
  assign io_output = zeroFlagA & zeroFlagB ? 8'h0 : _GEN_9; // @[FP8_MUL.scala 45:32 47:15]
endmodule
module MAC_TOP_FP8(
  input        clock,
  input        reset,
  input  [7:0] io_wgt,
  input  [7:0] io_ifm,
  output [7:0] io_result,
  output       io_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] multiplier_io_inputA; // @[MAC_TOP.scala 13:26]
  wire [7:0] multiplier_io_inputB; // @[MAC_TOP.scala 13:26]
  wire [7:0] multiplier_io_output; // @[MAC_TOP.scala 13:26]
  reg [1:0] counter; // @[MAC_TOP.scala 28:24]
  wire  _counter_T = counter == 2'h3; // @[MAC_TOP.scala 29:26]
  wire [1:0] _counter_T_2 = counter + 2'h1; // @[MAC_TOP.scala 29:48]
  reg [7:0] regOutput; // @[MAC_TOP.scala 33:26]
  wire [15:0] _regOutput_T = regOutput * multiplier_io_output; // @[MAC_TOP.scala 36:28]
  wire [15:0] _GEN_0 = _counter_T ? _regOutput_T : {{8'd0}, regOutput}; // @[MAC_TOP.scala 35:24 36:15 33:26]
  wire [15:0] _GEN_2 = reset ? 16'h0 : _GEN_0; // @[MAC_TOP.scala 33:{26,26}]
  FP8_MUL multiplier ( // @[MAC_TOP.scala 13:26]
    .io_inputA(multiplier_io_inputA),
    .io_inputB(multiplier_io_inputB),
    .io_output(multiplier_io_output)
  );
  assign io_result = _counter_T ? multiplier_io_output : regOutput; // @[MAC_TOP.scala 22:13 35:24 38:15]
  assign io_valid = counter == 2'h3; // @[MAC_TOP.scala 30:23]
  assign multiplier_io_inputA = io_wgt; // @[MAC_TOP.scala 19:24]
  assign multiplier_io_inputB = io_ifm; // @[MAC_TOP.scala 20:24]
  always @(posedge clock) begin
    if (reset) begin // @[MAC_TOP.scala 28:24]
      counter <= 2'h0; // @[MAC_TOP.scala 28:24]
    end else if (counter == 2'h3) begin // @[MAC_TOP.scala 29:17]
      counter <= 2'h0;
    end else begin
      counter <= _counter_T_2;
    end
    regOutput <= _GEN_2[7:0]; // @[MAC_TOP.scala 33:{26,26}]
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
  counter = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  regOutput = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
