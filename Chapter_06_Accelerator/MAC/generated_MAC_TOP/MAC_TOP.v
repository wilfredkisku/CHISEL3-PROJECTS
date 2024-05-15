module SIGNED_ADD_W16(
  input  [15:0] io_inputA,
  output [16:0] io_output
);
  assign io_output = {{1{io_inputA[15]}},io_inputA}; // @[SIGNED_ADD_W16.scala 12:26]
endmodule
module SIGNED_MUL(
  input  [7:0]  io_inputA,
  input  [7:0]  io_inputB,
  output [15:0] io_output
);
  assign io_output = $signed(io_inputA) * $signed(io_inputB); // @[SIGNED_MUL.scala 12:26]
endmodule
module MAC_TOP(
  input         clock,
  input         reset,
  input  [7:0]  io_wgt,
  input  [7:0]  io_ifm,
  output [15:0] io_result,
  output        io_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire [15:0] add_io_inputA; // @[MAC_TOP.scala 34:19]
  wire [16:0] add_io_output; // @[MAC_TOP.scala 34:19]
  wire [7:0] mul_io_inputA; // @[MAC_TOP.scala 35:19]
  wire [7:0] mul_io_inputB; // @[MAC_TOP.scala 35:19]
  wire [15:0] mul_io_output; // @[MAC_TOP.scala 35:19]
  reg [1:0] count; // @[MAC_TOP.scala 16:22]
  wire [1:0] _count_T_1 = count + 2'h1; // @[MAC_TOP.scala 17:18]
  reg [7:0] wgtReg; // @[MAC_TOP.scala 20:19]
  reg [7:0] ifmReg; // @[MAC_TOP.scala 21:19]
  reg [15:0] mulReg; // @[MAC_TOP.scala 24:19]
  SIGNED_ADD_W16 add ( // @[MAC_TOP.scala 34:19]
    .io_inputA(add_io_inputA),
    .io_output(add_io_output)
  );
  SIGNED_MUL mul ( // @[MAC_TOP.scala 35:19]
    .io_inputA(mul_io_inputA),
    .io_inputB(mul_io_inputB),
    .io_output(mul_io_output)
  );
  assign io_result = add_io_output[15:0]; // @[MAC_TOP.scala 56:13]
  assign io_valid = count == 2'h3; // @[MAC_TOP.scala 60:14]
  assign add_io_inputA = mulReg; // @[MAC_TOP.scala 54:17]
  assign mul_io_inputA = wgtReg; // @[MAC_TOP.scala 49:17]
  assign mul_io_inputB = ifmReg; // @[MAC_TOP.scala 50:17]
  always @(posedge clock) begin
    if (reset) begin // @[MAC_TOP.scala 16:22]
      count <= 2'h0; // @[MAC_TOP.scala 16:22]
    end else if (count == 2'h3) begin // @[MAC_TOP.scala 60:23]
      count <= 2'h0; // @[MAC_TOP.scala 62:11]
    end else begin
      count <= _count_T_1; // @[MAC_TOP.scala 17:9]
    end
    wgtReg <= io_wgt; // @[MAC_TOP.scala 41:10]
    ifmReg <= io_ifm; // @[MAC_TOP.scala 42:10]
    mulReg <= mul_io_output; // @[MAC_TOP.scala 51:10]
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
  count = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  wgtReg = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  ifmReg = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  mulReg = _RAND_3[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
