module PE(
  input         clock,
  input         reset,
  input  [7:0]  io_weightIn,
  input  [7:0]  io_ifmIn,
  output [31:0] io_parp,
  output [7:0]  io_weightOut,
  output [7:0]  io_ifmOut
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] weightBuff; // @[PE.scala 13:27]
  reg [7:0] ifmBuff; // @[PE.scala 16:24]
  wire [15:0] _io_parp_T = $signed(io_weightIn) * $signed(io_ifmIn); // @[PE.scala 22:28]
  wire [15:0] _GEN_0 = $signed(io_weightIn) == 8'sh0 | $signed(io_ifmIn) == 8'sh0 ? $signed(16'sh0) : $signed(_io_parp_T
    ); // @[PE.scala 19:49 20:11 22:13]
  assign io_parp = {{16{_GEN_0[15]}},_GEN_0};
  assign io_weightOut = weightBuff; // @[PE.scala 14:16]
  assign io_ifmOut = ifmBuff; // @[PE.scala 17:13]
  always @(posedge clock) begin
    weightBuff <= io_weightIn; // @[PE.scala 13:27]
    ifmBuff <= io_ifmIn; // @[PE.scala 16:24]
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
  weightBuff = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  ifmBuff = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
