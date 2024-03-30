module RegEnableModule(
  input        clock,
  input        reset,
  input        io_en, // @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 6:14]
  output [2:0] io_out // @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 6:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire [2:0] _io_out_T_2 = io_out + 3'h1; // @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 11:53]
  reg [2:0] io_out_r; // @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 11:22]
  assign io_out = io_out_r; // @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 11:10]
  always @(posedge clock) begin
    if (reset) begin // @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 11:22]
      io_out_r <= 3'h0; // @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 11:22]
    end else if (io_en) begin // @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 11:22]
      if (io_out < 3'h7) begin // @[IdeaProjects/CounterManual/src/main/scala/RegEnable.scala 11:26]
        io_out_r <= _io_out_T_2;
      end else begin
        io_out_r <= 3'h0;
      end
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
  io_out_r = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
