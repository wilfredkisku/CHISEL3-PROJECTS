module CounterUpDownModuleAnother(
  input        clock,
  input        reset,
  input        io_en, // @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 6:14]
  input        io_upDown, // @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 6:14]
  output [2:0] io_out // @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 6:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] count; // @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 12:22]
  wire [2:0] _nextValUp_T_2 = count + 3'h1; // @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 13:47]
  wire [2:0] _nextValDown_T_2 = count - 3'h1; // @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 14:44]
  assign io_out = count; // @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 25:10]
  always @(posedge clock) begin
    if (reset) begin // @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 12:22]
      count <= 3'h0; // @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 12:22]
    end else if (io_en & io_upDown) begin // @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 16:15]
      if (count < 3'h7) begin // @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 13:22]
        count <= _nextValUp_T_2;
      end else begin
        count <= 3'h0;
      end
    end else if (count > 3'h0) begin // @[IdeaProjects/CounterRegUpDown/src/main/scala/CounterUpDownModuleAnother.scala 14:24]
      count <= _nextValDown_T_2;
    end else begin
      count <= 3'h7;
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
