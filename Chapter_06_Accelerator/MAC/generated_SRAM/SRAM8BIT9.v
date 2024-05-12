module SRAM8BIT9(
  input        clock,
  input        reset,
  input  [3:0] io_addr,
  input  [7:0] io_dataIn,
  output [7:0] io_dataOut,
  input        io_writeEnable,
  input        io_readEnable
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:8]; // @[SRAM8BIT9.scala 14:16]
  wire  mem_io_dataOut_MPORT_en; // @[SRAM8BIT9.scala 14:16]
  wire [3:0] mem_io_dataOut_MPORT_addr; // @[SRAM8BIT9.scala 14:16]
  wire [7:0] mem_io_dataOut_MPORT_data; // @[SRAM8BIT9.scala 14:16]
  wire [7:0] mem_MPORT_data; // @[SRAM8BIT9.scala 14:16]
  wire [3:0] mem_MPORT_addr; // @[SRAM8BIT9.scala 14:16]
  wire  mem_MPORT_mask; // @[SRAM8BIT9.scala 14:16]
  wire  mem_MPORT_en; // @[SRAM8BIT9.scala 14:16]
  assign mem_io_dataOut_MPORT_en = io_readEnable;
  assign mem_io_dataOut_MPORT_addr = io_addr;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign mem_io_dataOut_MPORT_data = mem[mem_io_dataOut_MPORT_addr]; // @[SRAM8BIT9.scala 14:16]
  `else
  assign mem_io_dataOut_MPORT_data = mem_io_dataOut_MPORT_addr >= 4'h9 ? _RAND_1[7:0] : mem[mem_io_dataOut_MPORT_addr]; // @[SRAM8BIT9.scala 14:16]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign mem_MPORT_data = io_dataIn;
  assign mem_MPORT_addr = io_addr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_writeEnable;
  assign io_dataOut = io_readEnable ? mem_io_dataOut_MPORT_data : 8'h0; // @[SRAM8BIT9.scala 22:14 25:23 26:16]
  always @(posedge clock) begin
    if (mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[SRAM8BIT9.scala 14:16]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 9; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
