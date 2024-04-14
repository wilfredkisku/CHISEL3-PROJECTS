module InitializedMemory(
  input        clock,
  input        reset,
  input        io_writeEnable,
  input  [7:0] io_writeAddr,
  input  [7:0] io_writeData,
  input  [7:0] io_readAddr,
  input        io_readEnable,
  output [7:0] io_readData
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] memory [0:255]; // @[Memory.scala 16:27]
  wire  memory_io_readData_MPORT_en; // @[Memory.scala 16:27]
  wire [7:0] memory_io_readData_MPORT_addr; // @[Memory.scala 16:27]
  wire [7:0] memory_io_readData_MPORT_data; // @[Memory.scala 16:27]
  wire [7:0] memory_MPORT_data; // @[Memory.scala 16:27]
  wire [7:0] memory_MPORT_addr; // @[Memory.scala 16:27]
  wire  memory_MPORT_mask; // @[Memory.scala 16:27]
  wire  memory_MPORT_en; // @[Memory.scala 16:27]
  reg  memory_io_readData_MPORT_en_pipe_0;
  reg [7:0] memory_io_readData_MPORT_addr_pipe_0;
  assign memory_io_readData_MPORT_en = memory_io_readData_MPORT_en_pipe_0;
  assign memory_io_readData_MPORT_addr = memory_io_readData_MPORT_addr_pipe_0;
  assign memory_io_readData_MPORT_data = memory[memory_io_readData_MPORT_addr]; // @[Memory.scala 16:27]
  assign memory_MPORT_data = io_writeData;
  assign memory_MPORT_addr = io_writeAddr;
  assign memory_MPORT_mask = 1'h1;
  assign memory_MPORT_en = io_writeEnable;
  assign io_readData = memory_io_readData_MPORT_data; // @[Memory.scala 26:15]
  always @(posedge clock) begin
    if (memory_MPORT_en & memory_MPORT_mask) begin
      memory[memory_MPORT_addr] <= memory_MPORT_data; // @[Memory.scala 16:27]
    end
    memory_io_readData_MPORT_en_pipe_0 <= io_readEnable;
    if (io_readEnable) begin
      memory_io_readData_MPORT_addr_pipe_0 <= io_readAddr;
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
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    memory[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  memory_io_readData_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  memory_io_readData_MPORT_addr_pipe_0 = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
