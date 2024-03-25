module RaccoonClass(
  input        clock,
  input        reset,
  input        io_noise,
  input        io_trash,
  input        io_food,
  output [1:0] io_action
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] state; // @[RacoonClass.scala 16:22]
  wire [1:0] _GEN_1 = io_trash ? 2'h2 : state; // @[RacoonClass.scala 16:22 21:{28,36}]
  wire [1:0] _GEN_3 = io_food ? 2'h3 : state; // @[RacoonClass.scala 16:22 24:{27,35}]
  wire [1:0] _GEN_4 = io_noise ? 2'h0 : _GEN_3; // @[RacoonClass.scala 23:{21,29}]
  wire [1:0] _GEN_5 = ~io_food ? 2'h1 : state; // @[RacoonClass.scala 16:22 27:{28,36}]
  wire [1:0] _GEN_6 = io_noise ? 2'h0 : _GEN_5; // @[RacoonClass.scala 26:{21,29}]
  wire [1:0] _GEN_7 = state == 2'h3 ? _GEN_6 : state; // @[RacoonClass.scala 16:22 25:42]
  assign io_action = state; // @[RacoonClass.scala 29:13]
  always @(posedge clock) begin
    if (reset) begin // @[RacoonClass.scala 16:22]
      state <= 2'h0; // @[RacoonClass.scala 16:22]
    end else if (state == 2'h0) begin // @[RacoonClass.scala 17:36]
      if (~io_noise) begin // @[RacoonClass.scala 18:22]
        state <= 2'h1; // @[RacoonClass.scala 18:30]
      end
    end else if (state == 2'h1) begin // @[RacoonClass.scala 19:45]
      if (io_noise) begin // @[RacoonClass.scala 20:21]
        state <= 2'h0; // @[RacoonClass.scala 20:29]
      end else begin
        state <= _GEN_1;
      end
    end else if (state == 2'h2) begin // @[RacoonClass.scala 22:46]
      state <= _GEN_4;
    end else begin
      state <= _GEN_7;
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
  state = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
