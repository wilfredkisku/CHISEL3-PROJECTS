module Queue(
  input        clock,
  input        reset,
  output       io_enq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  input        io_enq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  input  [8:0] io_enq_bits, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  input        io_deq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  output       io_deq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  output [8:0] io_deq_bits // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
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
  reg [8:0] ram [0:199]; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire  ram_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire [7:0] ram_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire [8:0] ram_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire [8:0] ram_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire [7:0] ram_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire  ram_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire  ram_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  reg [7:0] enq_ptr_value; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  reg [7:0] deq_ptr_value; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  reg  maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 277:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[src/main/scala/chisel3/util/Decoupled.scala 278:33]
  wire  empty = ptr_match & ~maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 279:25]
  wire  full = ptr_match & maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 280:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  wrap = enq_ptr_value == 8'hc7; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [7:0] _value_T_1 = enq_ptr_value + 8'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  wire  wrap_1 = deq_ptr_value == 8'hc7; // @[src/main/scala/chisel3/util/Counter.scala 73:24]
  wire [7:0] _value_T_3 = deq_ptr_value + 8'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:24]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  `else
  assign ram_io_deq_bits_MPORT_data = ram_io_deq_bits_MPORT_addr >= 8'hc8 ? _RAND_1[8:0] :
    ram[ram_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[src/main/scala/chisel3/util/Decoupled.scala 304:19]
  assign io_deq_valid = ~empty; // @[src/main/scala/chisel3/util/Decoupled.scala 303:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 311:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      enq_ptr_value <= 8'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (do_enq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 287:16]
      if (wrap) begin // @[src/main/scala/chisel3/util/Counter.scala 87:20]
        enq_ptr_value <= 8'h0; // @[src/main/scala/chisel3/util/Counter.scala 87:28]
      end else begin
        enq_ptr_value <= _value_T_1; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
      end
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      deq_ptr_value <= 8'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (do_deq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 291:16]
      if (wrap_1) begin // @[src/main/scala/chisel3/util/Counter.scala 87:20]
        deq_ptr_value <= 8'h0; // @[src/main/scala/chisel3/util/Counter.scala 87:28]
      end else begin
        deq_ptr_value <= _value_T_3; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
      end
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Decoupled.scala 277:27]
      maybe_full <= 1'h0; // @[src/main/scala/chisel3/util/Decoupled.scala 277:27]
    end else if (do_enq != do_deq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 294:27]
      maybe_full <= do_enq; // @[src/main/scala/chisel3/util/Decoupled.scala 295:16]
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
  for (initvar = 0; initvar < 200; initvar = initvar+1)
    ram[initvar] = _RAND_0[8:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enq_ptr_value = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  deq_ptr_value = _RAND_3[7:0];
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
module QueueModule(
  input        clock,
  input        reset,
  output       in_ready, // @[IdeaProjects/BootCamp/QueueModule/src/main/scala/DequeueModule.scala 7:14]
  input        in_valid, // @[IdeaProjects/BootCamp/QueueModule/src/main/scala/DequeueModule.scala 7:14]
  input  [8:0] in_bits, // @[IdeaProjects/BootCamp/QueueModule/src/main/scala/DequeueModule.scala 7:14]
  input        out_ready, // @[IdeaProjects/BootCamp/QueueModule/src/main/scala/DequeueModule.scala 8:15]
  output       out_valid, // @[IdeaProjects/BootCamp/QueueModule/src/main/scala/DequeueModule.scala 8:15]
  output [8:0] out_bits // @[IdeaProjects/BootCamp/QueueModule/src/main/scala/DequeueModule.scala 8:15]
);
  wire  out_q_clock; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  out_q_reset; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  out_q_io_enq_ready; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  out_q_io_enq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire [8:0] out_q_io_enq_bits; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  out_q_io_deq_ready; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  out_q_io_deq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire [8:0] out_q_io_deq_bits; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  Queue out_q ( // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
    .clock(out_q_clock),
    .reset(out_q_reset),
    .io_enq_ready(out_q_io_enq_ready),
    .io_enq_valid(out_q_io_enq_valid),
    .io_enq_bits(out_q_io_enq_bits),
    .io_deq_ready(out_q_io_deq_ready),
    .io_deq_valid(out_q_io_deq_valid),
    .io_deq_bits(out_q_io_deq_bits)
  );
  assign in_ready = out_q_io_enq_ready; // @[src/main/scala/chisel3/util/Decoupled.scala 380:17]
  assign out_valid = out_q_io_deq_valid; // @[IdeaProjects/BootCamp/QueueModule/src/main/scala/DequeueModule.scala 9:7]
  assign out_bits = out_q_io_deq_bits; // @[IdeaProjects/BootCamp/QueueModule/src/main/scala/DequeueModule.scala 9:7]
  assign out_q_clock = clock;
  assign out_q_reset = reset;
  assign out_q_io_enq_valid = in_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 378:22]
  assign out_q_io_enq_bits = in_bits; // @[src/main/scala/chisel3/util/Decoupled.scala 379:21]
  assign out_q_io_deq_ready = out_ready; // @[IdeaProjects/BootCamp/QueueModule/src/main/scala/DequeueModule.scala 9:7]
endmodule
