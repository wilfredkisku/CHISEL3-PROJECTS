module Queue(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [7:0] io_enq_bits,
  input        io_deq_ready,
  output       io_deq_valid,
  output [7:0] io_deq_bits
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] ram [0:23]; // @[Decoupled.scala 273:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 273:95]
  wire [4:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 273:95]
  wire [7:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 273:95]
  wire [7:0] ram_MPORT_data; // @[Decoupled.scala 273:95]
  wire [4:0] ram_MPORT_addr; // @[Decoupled.scala 273:95]
  wire  ram_MPORT_mask; // @[Decoupled.scala 273:95]
  wire  ram_MPORT_en; // @[Decoupled.scala 273:95]
  reg [4:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [4:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 276:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 277:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 278:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 279:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 51:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 51:35]
  wire  wrap = enq_ptr_value == 5'h17; // @[Counter.scala 73:24]
  wire [4:0] _value_T_1 = enq_ptr_value + 5'h1; // @[Counter.scala 77:24]
  wire  wrap_1 = deq_ptr_value == 5'h17; // @[Counter.scala 73:24]
  wire [4:0] _value_T_3 = deq_ptr_value + 5'h1; // @[Counter.scala 77:24]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  `else
  assign ram_io_deq_bits_MPORT_data = ram_io_deq_bits_MPORT_addr >= 5'h18 ? _RAND_1[7:0] :
    ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 273:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 303:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 302:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 310:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 273:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 5'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 286:16]
      if (wrap) begin // @[Counter.scala 87:20]
        enq_ptr_value <= 5'h0; // @[Counter.scala 87:28]
      end else begin
        enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 5'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 290:16]
      if (wrap_1) begin // @[Counter.scala 87:20]
        deq_ptr_value <= 5'h0; // @[Counter.scala 87:28]
      end else begin
        deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[Decoupled.scala 276:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 276:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 293:27]
      maybe_full <= do_enq; // @[Decoupled.scala 294:16]
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
  for (initvar = 0; initvar < 24; initvar = initvar+1)
    ram[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enq_ptr_value = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  deq_ptr_value = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SIntFIFO(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [7:0] io_enq_bits,
  input        io_deq_ready,
  output       io_deq_valid,
  output [7:0] io_deq_bits
);
  wire  fifo_clock; // @[Decoupled.scala 375:21]
  wire  fifo_reset; // @[Decoupled.scala 375:21]
  wire  fifo_io_enq_ready; // @[Decoupled.scala 375:21]
  wire  fifo_io_enq_valid; // @[Decoupled.scala 375:21]
  wire [7:0] fifo_io_enq_bits; // @[Decoupled.scala 375:21]
  wire  fifo_io_deq_ready; // @[Decoupled.scala 375:21]
  wire  fifo_io_deq_valid; // @[Decoupled.scala 375:21]
  wire [7:0] fifo_io_deq_bits; // @[Decoupled.scala 375:21]
  Queue fifo ( // @[Decoupled.scala 375:21]
    .clock(fifo_clock),
    .reset(fifo_reset),
    .io_enq_ready(fifo_io_enq_ready),
    .io_enq_valid(fifo_io_enq_valid),
    .io_enq_bits(fifo_io_enq_bits),
    .io_deq_ready(fifo_io_deq_ready),
    .io_deq_valid(fifo_io_deq_valid),
    .io_deq_bits(fifo_io_deq_bits)
  );
  assign io_enq_ready = fifo_io_enq_ready; // @[Decoupled.scala 379:17]
  assign io_deq_valid = fifo_io_deq_valid; // @[SIntFIFO.scala 14:10]
  assign io_deq_bits = fifo_io_deq_bits; // @[SIntFIFO.scala 14:10]
  assign fifo_clock = clock;
  assign fifo_reset = reset;
  assign fifo_io_enq_valid = io_enq_valid; // @[Decoupled.scala 377:22]
  assign fifo_io_enq_bits = io_enq_bits; // @[Decoupled.scala 378:21]
  assign fifo_io_deq_ready = io_deq_ready; // @[SIntFIFO.scala 14:10]
endmodule
