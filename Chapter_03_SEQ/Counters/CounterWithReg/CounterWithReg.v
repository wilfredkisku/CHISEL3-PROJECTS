module CounterWithReg(
  input        clock,
  input        reset,
  input        io_en, // @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 5:14]
  output [2:0] io_out // @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 5:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] count; // @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 10:18]
  wire [2:0] _NextVal_T_2 = count + 3'h1; // @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 11:45]
  assign io_out = count; // @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 15:10]
  always @(posedge clock) begin
    if (reset) begin // @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 14:15]
      count <= 3'h0;
    end else if (io_en) begin // @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 12:20]
      if (count < 3'h7) begin // @[IdeaProjects/CounterManual/src/main/scala/CounterWithReg.scala 11:20]
        count <= _NextVal_T_2;
      end else begin
        count <= 3'h0;
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
  count = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
