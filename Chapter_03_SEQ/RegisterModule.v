module RegisterModule(
  input         clock,
  input         reset,
  input  [11:0] io_in, // @[IdeaProjects/stateRegisters/src/main/scala/RegisterModule.scala 7:14]
  output [11:0] io_out // @[IdeaProjects/stateRegisters/src/main/scala/RegisterModule.scala 7:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [11:0] register; // @[IdeaProjects/stateRegisters/src/main/scala/RegisterModule.scala 12:21]
  assign io_out = register; // @[IdeaProjects/stateRegisters/src/main/scala/RegisterModule.scala 14:10]
  always @(posedge clock) begin
    register <= io_in + 12'h1; // @[IdeaProjects/stateRegisters/src/main/scala/RegisterModule.scala 13:21]
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
  register = _RAND_0[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
