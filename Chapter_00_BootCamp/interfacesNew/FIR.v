module FIR(
  input        clock,
  input        reset,
  input  [7:0] io_in,
  output [7:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] x_n1; // @[FIR.scala 15:21]
  reg [7:0] x_n2; // @[FIR.scala 16:21]
  reg [7:0] x_n3; // @[FIR.scala 17:21]
  wire [15:0] _io_out_T = io_in * 8'h1; // @[FIR.scala 18:19]
  wire [15:0] _io_out_T_1 = x_n1 * 8'h1; // @[FIR.scala 19:10]
  wire [15:0] _io_out_T_3 = _io_out_T + _io_out_T_1; // @[FIR.scala 18:31]
  wire [15:0] _io_out_T_4 = x_n2 * 8'h1; // @[FIR.scala 20:10]
  wire [15:0] _io_out_T_6 = _io_out_T_3 + _io_out_T_4; // @[FIR.scala 19:22]
  wire [15:0] _io_out_T_7 = x_n3 * 8'h1; // @[FIR.scala 21:10]
  wire [15:0] _io_out_T_9 = _io_out_T_6 + _io_out_T_7; // @[FIR.scala 20:22]
  assign io_out = _io_out_T_9[7:0]; // @[FIR.scala 18:10]
  always @(posedge clock) begin
    if (reset) begin // @[FIR.scala 15:21]
      x_n1 <= 8'h0; // @[FIR.scala 15:21]
    end else begin
      x_n1 <= io_in; // @[FIR.scala 15:21]
    end
    if (reset) begin // @[FIR.scala 16:21]
      x_n2 <= 8'h0; // @[FIR.scala 16:21]
    end else begin
      x_n2 <= x_n1; // @[FIR.scala 16:21]
    end
    if (reset) begin // @[FIR.scala 17:21]
      x_n3 <= 8'h0; // @[FIR.scala 17:21]
    end else begin
      x_n3 <= x_n2; // @[FIR.scala 17:21]
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
  x_n1 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  x_n2 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  x_n3 = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
