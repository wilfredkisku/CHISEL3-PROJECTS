module FIFO16BIT(
  input         clock,
  input         reset,
  input         io_wr_en,
  input         io_rd_en,
  input  [15:0] io_data_in,
  output [15:0] io_data_out,
  output        io_full,
  output        io_empty,
  output        io_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] fifo_0; // @[FIFO16BIT.scala 14:17]
  reg [15:0] fifo_1; // @[FIFO16BIT.scala 14:17]
  reg [15:0] fifo_2; // @[FIFO16BIT.scala 14:17]
  reg [1:0] count; // @[FIFO16BIT.scala 15:22]
  reg [1:0] read_ptr; // @[FIFO16BIT.scala 16:25]
  reg [1:0] write_ptr; // @[FIFO16BIT.scala 17:26]
  wire  _io_valid_T = ~io_empty; // @[FIFO16BIT.scala 21:15]
  wire [1:0] _write_ptr_T_2 = write_ptr + 2'h1; // @[FIFO16BIT.scala 26:56]
  wire [1:0] _count_T_1 = count + 2'h1; // @[FIFO16BIT.scala 27:20]
  wire [15:0] _GEN_9 = 2'h1 == read_ptr ? fifo_1 : fifo_0; // @[FIFO16BIT.scala 31:{17,17}]
  wire [15:0] _GEN_10 = 2'h2 == read_ptr ? fifo_2 : _GEN_9; // @[FIFO16BIT.scala 31:{17,17}]
  wire [1:0] _read_ptr_T_2 = read_ptr + 2'h1; // @[FIFO16BIT.scala 32:53]
  wire [1:0] _count_T_3 = count - 2'h1; // @[FIFO16BIT.scala 33:20]
  assign io_data_out = io_rd_en & _io_valid_T ? _GEN_10 : 16'h0; // @[FIFO16BIT.scala 22:15 30:31 31:17]
  assign io_full = count == 2'h3; // @[FIFO16BIT.scala 20:21]
  assign io_empty = count == 2'h0; // @[FIFO16BIT.scala 19:22]
  assign io_valid = ~io_empty; // @[FIFO16BIT.scala 21:15]
  always @(posedge clock) begin
    if (io_wr_en & ~io_full) begin // @[FIFO16BIT.scala 24:30]
      if (2'h0 == write_ptr) begin // @[FIFO16BIT.scala 25:21]
        fifo_0 <= io_data_in; // @[FIFO16BIT.scala 25:21]
      end
    end
    if (io_wr_en & ~io_full) begin // @[FIFO16BIT.scala 24:30]
      if (2'h1 == write_ptr) begin // @[FIFO16BIT.scala 25:21]
        fifo_1 <= io_data_in; // @[FIFO16BIT.scala 25:21]
      end
    end
    if (io_wr_en & ~io_full) begin // @[FIFO16BIT.scala 24:30]
      if (2'h2 == write_ptr) begin // @[FIFO16BIT.scala 25:21]
        fifo_2 <= io_data_in; // @[FIFO16BIT.scala 25:21]
      end
    end
    if (reset) begin // @[FIFO16BIT.scala 15:22]
      count <= 2'h0; // @[FIFO16BIT.scala 15:22]
    end else if (io_rd_en & _io_valid_T) begin // @[FIFO16BIT.scala 30:31]
      count <= _count_T_3; // @[FIFO16BIT.scala 33:11]
    end else if (io_wr_en & ~io_full) begin // @[FIFO16BIT.scala 24:30]
      count <= _count_T_1; // @[FIFO16BIT.scala 27:11]
    end
    if (reset) begin // @[FIFO16BIT.scala 16:25]
      read_ptr <= 2'h0; // @[FIFO16BIT.scala 16:25]
    end else if (io_rd_en & _io_valid_T) begin // @[FIFO16BIT.scala 30:31]
      if (read_ptr == 2'h2) begin // @[FIFO16BIT.scala 32:20]
        read_ptr <= 2'h0;
      end else begin
        read_ptr <= _read_ptr_T_2;
      end
    end
    if (reset) begin // @[FIFO16BIT.scala 17:26]
      write_ptr <= 2'h0; // @[FIFO16BIT.scala 17:26]
    end else if (io_wr_en & ~io_full) begin // @[FIFO16BIT.scala 24:30]
      if (write_ptr == 2'h2) begin // @[FIFO16BIT.scala 26:21]
        write_ptr <= 2'h0;
      end else begin
        write_ptr <= _write_ptr_T_2;
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
  fifo_0 = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  fifo_1 = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  fifo_2 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  count = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  read_ptr = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  write_ptr = _RAND_5[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
