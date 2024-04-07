module GCDModule(
  input        clock,
  input        reset,
  output       input_ready,
  input        input_valid,
  input  [7:0] input_bits_value1,
  input  [7:0] input_bits_value2,
  input        output_ready,
  output       output_valid,
  output [7:0] output_bits_value1,
  output [7:0] output_bits_value2,
  output [7:0] output_bits_gcd
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] xInitial; // @[GCDModule.scala 20:21]
  reg [7:0] yInitial; // @[GCDModule.scala 21:21]
  reg [7:0] x; // @[GCDModule.scala 23:24]
  reg [7:0] y; // @[GCDModule.scala 24:24]
  reg  busy; // @[GCDModule.scala 25:28]
  wire [7:0] _x_T_1 = x - y; // @[GCDModule.scala 35:12]
  wire [7:0] _y_T_1 = y - x; // @[GCDModule.scala 37:12]
  wire  _T_1 = y == 8'h0; // @[GCDModule.scala 39:12]
  wire  _GEN_7 = input_valid | ~busy; // @[GCDModule.scala 48:22 Decoupled.scala 82:20 GCDModule.scala 29:15]
  wire  _GEN_12 = input_valid | busy; // @[GCDModule.scala 48:22 55:12 25:28]
  assign input_ready = busy ? ~busy : _GEN_7; // @[GCDModule.scala 33:14 29:15]
  assign output_valid = busy & _T_1; // @[GCDModule.scala 33:14 30:16]
  assign output_bits_value1 = xInitial; // @[GCDModule.scala 39:20 40:26]
  assign output_bits_value2 = yInitial; // @[GCDModule.scala 39:20 41:26]
  assign output_bits_gcd = x; // @[GCDModule.scala 39:20 42:23]
  always @(posedge clock) begin
    if (!(busy)) begin // @[GCDModule.scala 33:14]
      if (input_valid) begin // @[GCDModule.scala 48:22]
        xInitial <= input_bits_value1; // @[GCDModule.scala 53:16]
      end
    end
    if (!(busy)) begin // @[GCDModule.scala 33:14]
      if (input_valid) begin // @[GCDModule.scala 48:22]
        yInitial <= input_bits_value2; // @[GCDModule.scala 54:16]
      end
    end
    if (busy) begin // @[GCDModule.scala 33:14]
      if (x > y) begin // @[GCDModule.scala 34:15]
        x <= _x_T_1; // @[GCDModule.scala 35:7]
      end
    end else if (input_valid) begin // @[GCDModule.scala 48:22]
      x <= input_bits_value1; // @[GCDModule.scala 51:9]
    end
    if (busy) begin // @[GCDModule.scala 33:14]
      if (!(x > y)) begin // @[GCDModule.scala 34:15]
        y <= _y_T_1; // @[GCDModule.scala 37:7]
      end
    end else if (input_valid) begin // @[GCDModule.scala 48:22]
      y <= input_bits_value2; // @[GCDModule.scala 52:9]
    end
    if (reset) begin // @[GCDModule.scala 25:28]
      busy <= 1'h0; // @[GCDModule.scala 25:28]
    end else if (busy) begin // @[GCDModule.scala 33:14]
      if (y == 8'h0) begin // @[GCDModule.scala 39:20]
        busy <= ~output_ready; // @[GCDModule.scala 44:12]
      end
    end else begin
      busy <= _GEN_12;
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
  xInitial = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  yInitial = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  x = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  y = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  busy = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
