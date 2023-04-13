module counter_top(
  input        clock,
  input        reset,
  output [7:0] io_count
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] cntReg; // @[counter_top.scala 11:23]
  reg [7:0] blkReg; // @[counter_top.scala 13:23]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[counter_top.scala 15:20]
  wire [7:0] _blkReg_T_1 = blkReg + 8'h1; // @[counter_top.scala 18:22]
  assign io_count = blkReg; // @[counter_top.scala 20:12]
  always @(posedge clock) begin
    if (reset) begin // @[counter_top.scala 11:23]
      cntReg <= 32'h0; // @[counter_top.scala 11:23]
    end else if (cntReg == 32'h17d783f) begin // @[counter_top.scala 16:27]
      cntReg <= 32'h0; // @[counter_top.scala 17:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[counter_top.scala 15:10]
    end
    if (reset) begin // @[counter_top.scala 13:23]
      blkReg <= 8'h0; // @[counter_top.scala 13:23]
    end else if (cntReg == 32'h17d783f) begin // @[counter_top.scala 16:27]
      blkReg <= _blkReg_T_1; // @[counter_top.scala 18:12]
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
  cntReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  blkReg = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
