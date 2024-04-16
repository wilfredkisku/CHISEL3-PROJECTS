module MemoryController(
  input        clock,
  input        reset,
  input        io_readEnable,
  input  [9:0] io_weightAddr,
  input  [9:0] io_featureMapAddr,
  output [7:0] io_weightDataOut,
  output [7:0] io_featureMapDataOut,
  output       io_readDone
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] weightMemory [0:1023]; // @[MemoryController.scala 15:25]
  wire  weightMemory_weightDataReg_MPORT_en; // @[MemoryController.scala 15:25]
  wire [9:0] weightMemory_weightDataReg_MPORT_addr; // @[MemoryController.scala 15:25]
  wire [7:0] weightMemory_weightDataReg_MPORT_data; // @[MemoryController.scala 15:25]
  reg [7:0] featureMapMemory [0:1023]; // @[MemoryController.scala 16:29]
  wire  featureMapMemory_featureMapDataReg_MPORT_en; // @[MemoryController.scala 16:29]
  wire [9:0] featureMapMemory_featureMapDataReg_MPORT_addr; // @[MemoryController.scala 16:29]
  wire [7:0] featureMapMemory_featureMapDataReg_MPORT_data; // @[MemoryController.scala 16:29]
  reg [1:0] state; // @[MemoryController.scala 20:22]
  reg [7:0] weightDataReg; // @[MemoryController.scala 23:26]
  reg [7:0] featureMapDataReg; // @[MemoryController.scala 24:30]
  wire  _T = 2'h0 == state; // @[MemoryController.scala 31:17]
  wire  _T_1 = 2'h1 == state; // @[MemoryController.scala 31:17]
  wire [1:0] _GEN_1 = ~io_readEnable ? 2'h0 : state; // @[MemoryController.scala 47:28 48:15 20:22]
  wire [1:0] _GEN_3 = 2'h3 == state ? _GEN_1 : state; // @[MemoryController.scala 31:17 20:22]
  wire  _GEN_9 = 2'h2 == state ? 1'h0 : 2'h3 == state; // @[MemoryController.scala 29:15 31:17]
  wire  _GEN_17 = 2'h1 == state ? 1'h0 : 2'h2 == state; // @[MemoryController.scala 31:17 16:29]
  wire  _GEN_19 = 2'h1 == state ? 1'h0 : _GEN_9; // @[MemoryController.scala 29:15 31:17]
  assign weightMemory_weightDataReg_MPORT_en = _T ? 1'h0 : _T_1;
  assign weightMemory_weightDataReg_MPORT_addr = io_weightAddr;
  assign weightMemory_weightDataReg_MPORT_data = weightMemory[weightMemory_weightDataReg_MPORT_addr]; // @[MemoryController.scala 15:25]
  assign featureMapMemory_featureMapDataReg_MPORT_en = _T ? 1'h0 : _GEN_17;
  assign featureMapMemory_featureMapDataReg_MPORT_addr = io_featureMapAddr;
  assign featureMapMemory_featureMapDataReg_MPORT_data = featureMapMemory[featureMapMemory_featureMapDataReg_MPORT_addr]
    ; // @[MemoryController.scala 16:29]
  assign io_weightDataOut = weightDataReg; // @[MemoryController.scala 27:20]
  assign io_featureMapDataOut = featureMapDataReg; // @[MemoryController.scala 28:24]
  assign io_readDone = 2'h0 == state ? 1'h0 : _GEN_19; // @[MemoryController.scala 29:15 31:17]
  always @(posedge clock) begin
    if (reset) begin // @[MemoryController.scala 20:22]
      state <= 2'h0; // @[MemoryController.scala 20:22]
    end else if (2'h0 == state) begin // @[MemoryController.scala 31:17]
      if (io_readEnable) begin // @[MemoryController.scala 33:27]
        state <= 2'h1; // @[MemoryController.scala 34:15]
      end
    end else if (2'h1 == state) begin // @[MemoryController.scala 31:17]
      state <= 2'h2; // @[MemoryController.scala 39:13]
    end else if (2'h2 == state) begin // @[MemoryController.scala 31:17]
      state <= 2'h3; // @[MemoryController.scala 43:13]
    end else begin
      state <= _GEN_3;
    end
    if (!(2'h0 == state)) begin // @[MemoryController.scala 31:17]
      if (2'h1 == state) begin // @[MemoryController.scala 31:17]
        weightDataReg <= weightMemory_weightDataReg_MPORT_data; // @[MemoryController.scala 38:21]
      end
    end
    if (!(2'h0 == state)) begin // @[MemoryController.scala 31:17]
      if (!(2'h1 == state)) begin // @[MemoryController.scala 31:17]
        if (2'h2 == state) begin // @[MemoryController.scala 31:17]
          featureMapDataReg <= featureMapMemory_featureMapDataReg_MPORT_data; // @[MemoryController.scala 42:25]
        end
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    weightMemory[initvar] = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    featureMapMemory[initvar] = _RAND_1[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  state = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  weightDataReg = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  featureMapDataReg = _RAND_4[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
