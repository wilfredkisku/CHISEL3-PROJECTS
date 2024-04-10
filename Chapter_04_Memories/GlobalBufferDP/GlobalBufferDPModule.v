module GlobalBufferDPModule(
  input        clock,
  input        reset,
  input        io_rdWrPortA_enableA,
  input        io_rdWrPortA_writeA,
  input  [9:0] io_rdWrPortA_addrA,
  input  [7:0] io_rdWrPortA_dataInA,
  output [7:0] io_rdWrPortA_dataOutA,
  input        io_rdWrPortB_enableB,
  input        io_rdWrPortB_writeB,
  input  [9:0] io_rdWrPortB_addrB,
  input  [7:0] io_rdWrPortB_dataInB,
  output [7:0] io_rdWrPortB_dataOutB
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem [0:1023]; // @[GlobalBufferDPModule.scala 24:24]
  wire  mem_rdwrPortB_r_en; // @[GlobalBufferDPModule.scala 24:24]
  wire [9:0] mem_rdwrPortB_r_addr; // @[GlobalBufferDPModule.scala 24:24]
  wire [7:0] mem_rdwrPortB_r_data; // @[GlobalBufferDPModule.scala 24:24]
  wire  mem_rdwrPortA_r_en; // @[GlobalBufferDPModule.scala 24:24]
  wire [9:0] mem_rdwrPortA_r_addr; // @[GlobalBufferDPModule.scala 24:24]
  wire [7:0] mem_rdwrPortA_r_data; // @[GlobalBufferDPModule.scala 24:24]
  wire [7:0] mem_rdwrPortB_w_data; // @[GlobalBufferDPModule.scala 24:24]
  wire [9:0] mem_rdwrPortB_w_addr; // @[GlobalBufferDPModule.scala 24:24]
  wire  mem_rdwrPortB_w_mask; // @[GlobalBufferDPModule.scala 24:24]
  wire  mem_rdwrPortB_w_en; // @[GlobalBufferDPModule.scala 24:24]
  wire [7:0] mem_rdwrPortA_w_data; // @[GlobalBufferDPModule.scala 24:24]
  wire [9:0] mem_rdwrPortA_w_addr; // @[GlobalBufferDPModule.scala 24:24]
  wire  mem_rdwrPortA_w_mask; // @[GlobalBufferDPModule.scala 24:24]
  wire  mem_rdwrPortA_w_en; // @[GlobalBufferDPModule.scala 24:24]
  reg  mem_rdwrPortB_r_en_pipe_0;
  reg [9:0] mem_rdwrPortB_r_addr_pipe_0;
  reg  mem_rdwrPortA_r_en_pipe_0;
  reg [9:0] mem_rdwrPortA_r_addr_pipe_0;
  assign mem_rdwrPortB_r_en = mem_rdwrPortB_r_en_pipe_0;
  assign mem_rdwrPortB_r_addr = mem_rdwrPortB_r_addr_pipe_0;
  assign mem_rdwrPortB_r_data = mem[mem_rdwrPortB_r_addr]; // @[GlobalBufferDPModule.scala 24:24]
  assign mem_rdwrPortA_r_en = mem_rdwrPortA_r_en_pipe_0;
  assign mem_rdwrPortA_r_addr = mem_rdwrPortA_r_addr_pipe_0;
  assign mem_rdwrPortA_r_data = mem[mem_rdwrPortA_r_addr]; // @[GlobalBufferDPModule.scala 24:24]
  assign mem_rdwrPortB_w_data = io_rdWrPortB_dataInB;
  assign mem_rdwrPortB_w_addr = io_rdWrPortB_addrB;
  assign mem_rdwrPortB_w_mask = io_rdWrPortB_writeB;
  assign mem_rdwrPortB_w_en = io_rdWrPortB_enableB & (io_rdWrPortB_enableB & io_rdWrPortB_writeB);
  assign mem_rdwrPortA_w_data = io_rdWrPortA_dataInA;
  assign mem_rdwrPortA_w_addr = io_rdWrPortA_addrA;
  assign mem_rdwrPortA_w_mask = io_rdWrPortA_writeA;
  assign mem_rdwrPortA_w_en = io_rdWrPortA_enableA & (io_rdWrPortA_enableA & io_rdWrPortA_writeA);
  assign io_rdWrPortA_dataOutA = mem_rdwrPortA_r_data; // @[GlobalBufferDPModule.scala 40:32 43:29]
  assign io_rdWrPortB_dataOutB = mem_rdwrPortB_r_data; // @[GlobalBufferDPModule.scala 31:32 34:29]
  always @(posedge clock) begin
    if (mem_rdwrPortB_w_en & mem_rdwrPortB_w_mask) begin
      mem[mem_rdwrPortB_w_addr] <= mem_rdwrPortB_w_data; // @[GlobalBufferDPModule.scala 24:24]
    end
    if (mem_rdwrPortA_w_en & mem_rdwrPortA_w_mask) begin
      mem[mem_rdwrPortA_w_addr] <= mem_rdwrPortA_w_data; // @[GlobalBufferDPModule.scala 24:24]
    end
    mem_rdwrPortB_r_en_pipe_0 <= io_rdWrPortB_enableB & ~(io_rdWrPortB_enableB & io_rdWrPortB_writeB);
    if (io_rdWrPortB_enableB & ~(io_rdWrPortB_enableB & io_rdWrPortB_writeB)) begin
      mem_rdwrPortB_r_addr_pipe_0 <= io_rdWrPortB_addrB;
    end
    mem_rdwrPortA_r_en_pipe_0 <= io_rdWrPortA_enableA & ~(io_rdWrPortA_enableA & io_rdWrPortA_writeA);
    if (io_rdWrPortA_enableA & ~(io_rdWrPortA_enableA & io_rdWrPortA_writeA)) begin
      mem_rdwrPortA_r_addr_pipe_0 <= io_rdWrPortA_addrA;
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
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_rdwrPortB_r_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_rdwrPortB_r_addr_pipe_0 = _RAND_2[9:0];
  _RAND_3 = {1{`RANDOM}};
  mem_rdwrPortA_r_en_pipe_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  mem_rdwrPortA_r_addr_pipe_0 = _RAND_4[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
