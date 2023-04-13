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
  reg [7:0] blkReg; // @[counter_top.scala 12:23]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[counter_top.scala 14:20]
  wire  _T_1 = blkReg == 8'h8; // @[counter_top.scala 17:18]
  wire [7:0] _blkReg_T_1 = blkReg + 8'h1; // @[counter_top.scala 23:26]
  assign io_count = blkReg; // @[counter_top.scala 26:12]
  always @(posedge clock) begin
    if (reset) begin // @[counter_top.scala 11:23]
      cntReg <= 32'h0; // @[counter_top.scala 11:23]
    end else if (cntReg == 32'h17d783f) begin // @[counter_top.scala 15:27]
      cntReg <= 32'h0; // @[counter_top.scala 16:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[counter_top.scala 14:10]
    end
    if (reset) begin // @[counter_top.scala 12:23]
      blkReg <= 8'h0; // @[counter_top.scala 12:23]
    end else if (cntReg == 32'h17d783f) begin // @[counter_top.scala 15:27]
      if (_T_1) begin // @[counter_top.scala 18:7]
        blkReg <= 8'h0; // @[counter_top.scala 19:16]
      end else begin
        blkReg <= _blkReg_T_1; // @[counter_top.scala 23:16]
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
