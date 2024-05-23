module SHIFT_DATA_TOP(
  input        clock,
  input        reset,
  input  [7:0] io_inp,
  output [7:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] reg1; // @[SHIFT_DATA_TOP.scala 11:21]
  reg [7:0] reg2; // @[SHIFT_DATA_TOP.scala 12:21]
  reg [7:0] reg3; // @[SHIFT_DATA_TOP.scala 13:21]
  reg [7:0] reg4; // @[SHIFT_DATA_TOP.scala 14:21]
  reg [7:0] reg5; // @[SHIFT_DATA_TOP.scala 15:21]
  assign io_out = reg5; // @[SHIFT_DATA_TOP.scala 17:10]
  always @(posedge clock) begin
    reg1 <= io_inp; // @[SHIFT_DATA_TOP.scala 11:21]
    reg2 <= reg1; // @[SHIFT_DATA_TOP.scala 12:21]
    reg3 <= reg2; // @[SHIFT_DATA_TOP.scala 13:21]
    reg4 <= reg3; // @[SHIFT_DATA_TOP.scala 14:21]
    reg5 <= reg4; // @[SHIFT_DATA_TOP.scala 15:21]
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
  reg1 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  reg2 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  reg3 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  reg4 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  reg5 = _RAND_4[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
