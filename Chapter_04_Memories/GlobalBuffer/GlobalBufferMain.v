module GlobalBuffer(
  input         clock,
  input  [7:0]  io_dataIn,
  input         io_writeEnable,
  input  [17:0] io_address,
  output [7:0]  io_dataOut
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem [0:262143]; // @[GlobalBufferMain.scala 15:16]
  wire  mem_io_dataOut_MPORT_en; // @[GlobalBufferMain.scala 15:16]
  wire [17:0] mem_io_dataOut_MPORT_addr; // @[GlobalBufferMain.scala 15:16]
  wire [7:0] mem_io_dataOut_MPORT_data; // @[GlobalBufferMain.scala 15:16]
  wire [7:0] mem_MPORT_data; // @[GlobalBufferMain.scala 15:16]
  wire [17:0] mem_MPORT_addr; // @[GlobalBufferMain.scala 15:16]
  wire  mem_MPORT_mask; // @[GlobalBufferMain.scala 15:16]
  wire  mem_MPORT_en; // @[GlobalBufferMain.scala 15:16]
  reg [7:0] io_dataOut_REG; // @[GlobalBufferMain.scala 18:24]
  assign mem_io_dataOut_MPORT_en = 1'h1;
  assign mem_io_dataOut_MPORT_addr = io_address;
  assign mem_io_dataOut_MPORT_data = mem[mem_io_dataOut_MPORT_addr]; // @[GlobalBufferMain.scala 15:16]
  assign mem_MPORT_data = io_dataIn;
  assign mem_MPORT_addr = io_address;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_writeEnable;
  assign io_dataOut = io_dataOut_REG; // @[GlobalBufferMain.scala 18:14]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[GlobalBufferMain.scala 15:16]
    end
    io_dataOut_REG <= mem_io_dataOut_MPORT_data; // @[GlobalBufferMain.scala 18:24]
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
  for (initvar = 0; initvar < 262144; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  io_dataOut_REG = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module GlobalBufferMain(
  input         clock,
  input         reset,
  input  [7:0]  io_dataIn,
  input         io_writeEnable,
  input  [17:0] io_address,
  output [7:0]  io_dataOut
);
  wire  globalBuffer_clock; // @[GlobalBufferMain.scala 35:28]
  wire [7:0] globalBuffer_io_dataIn; // @[GlobalBufferMain.scala 35:28]
  wire  globalBuffer_io_writeEnable; // @[GlobalBufferMain.scala 35:28]
  wire [17:0] globalBuffer_io_address; // @[GlobalBufferMain.scala 35:28]
  wire [7:0] globalBuffer_io_dataOut; // @[GlobalBufferMain.scala 35:28]
  GlobalBuffer globalBuffer ( // @[GlobalBufferMain.scala 35:28]
    .clock(globalBuffer_clock),
    .io_dataIn(globalBuffer_io_dataIn),
    .io_writeEnable(globalBuffer_io_writeEnable),
    .io_address(globalBuffer_io_address),
    .io_dataOut(globalBuffer_io_dataOut)
  );
  assign io_dataOut = globalBuffer_io_dataOut; // @[GlobalBufferMain.scala 40:14]
  assign globalBuffer_clock = clock;
  assign globalBuffer_io_dataIn = io_dataIn; // @[GlobalBufferMain.scala 37:26]
  assign globalBuffer_io_writeEnable = io_writeEnable; // @[GlobalBufferMain.scala 38:31]
  assign globalBuffer_io_address = io_address; // @[GlobalBufferMain.scala 39:27]
endmodule
