module GlobalBuffer(
  input         clock,
  input         reset,
  input         io_enableA,
  input         io_writeA,
  input  [9:0]  io_addrA,
  input  [15:0] io_dataInA,
  output [15:0] io_dataOutA
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] mem [0:1023]; // @[GlobalBufferModule.scala 17:24]
  wire  mem_rdwrPort_r_en; // @[GlobalBufferModule.scala 17:24]
  wire [9:0] mem_rdwrPort_r_addr; // @[GlobalBufferModule.scala 17:24]
  wire [15:0] mem_rdwrPort_r_data; // @[GlobalBufferModule.scala 17:24]
  wire [15:0] mem_rdwrPort_w_data; // @[GlobalBufferModule.scala 17:24]
  wire [9:0] mem_rdwrPort_w_addr; // @[GlobalBufferModule.scala 17:24]
  wire  mem_rdwrPort_w_mask; // @[GlobalBufferModule.scala 17:24]
  wire  mem_rdwrPort_w_en; // @[GlobalBufferModule.scala 17:24]
  reg  mem_rdwrPort_r_en_pipe_0;
  reg [9:0] mem_rdwrPort_r_addr_pipe_0;
  assign mem_rdwrPort_r_en = mem_rdwrPort_r_en_pipe_0;
  assign mem_rdwrPort_r_addr = mem_rdwrPort_r_addr_pipe_0;
  assign mem_rdwrPort_r_data = mem[mem_rdwrPort_r_addr]; // @[GlobalBufferModule.scala 17:24]
  assign mem_rdwrPort_w_data = io_dataInA;
  assign mem_rdwrPort_w_addr = io_addrA;
  assign mem_rdwrPort_w_mask = io_writeA;
  assign mem_rdwrPort_w_en = io_enableA & (io_enableA & io_writeA);
  assign io_dataOutA = mem_rdwrPort_r_data; // @[GlobalBufferModule.scala 22:22 25:19]
  always @(posedge clock) begin
    if (mem_rdwrPort_w_en & mem_rdwrPort_w_mask) begin
      mem[mem_rdwrPort_w_addr] <= mem_rdwrPort_w_data; // @[GlobalBufferModule.scala 17:24]
    end
    mem_rdwrPort_r_en_pipe_0 <= io_enableA & ~(io_enableA & io_writeA);
    if (io_enableA & ~(io_enableA & io_writeA)) begin
      mem_rdwrPort_r_addr_pipe_0 <= io_addrA;
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
    mem[initvar] = _RAND_0[15:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_rdwrPort_r_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_rdwrPort_r_addr_pipe_0 = _RAND_2[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
