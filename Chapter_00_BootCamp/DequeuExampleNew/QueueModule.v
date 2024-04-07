module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  input         io_enq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  input  [31:0] io_enq_bits, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  input         io_deq_ready, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  output        io_deq_valid, // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
  output [31:0] io_deq_bits // @[src/main/scala/chisel3/util/Decoupled.scala 273:14]
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram [0:1]; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire  ram_io_deq_bits_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire  ram_io_deq_bits_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire [31:0] ram_io_deq_bits_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire [31:0] ram_MPORT_data; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire  ram_MPORT_addr; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire  ram_MPORT_mask; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  wire  ram_MPORT_en; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
  reg  enq_ptr_value; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  reg  deq_ptr_value; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
  reg  maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 277:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[src/main/scala/chisel3/util/Decoupled.scala 278:33]
  wire  empty = ptr_match & ~maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 279:25]
  wire  full = ptr_match & maybe_full; // @[src/main/scala/chisel3/util/Decoupled.scala 280:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 52:35]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[src/main/scala/chisel3/util/Decoupled.scala 274:95]
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
      enq_ptr_value <= 1'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (do_enq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 287:16]
      enq_ptr_value <= enq_ptr_value + 1'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
    end
    if (reset) begin // @[src/main/scala/chisel3/util/Counter.scala 61:40]
      deq_ptr_value <= 1'h0; // @[src/main/scala/chisel3/util/Counter.scala 61:40]
    end else if (do_deq) begin // @[src/main/scala/chisel3/util/Decoupled.scala 291:16]
      deq_ptr_value <= deq_ptr_value + 1'h1; // @[src/main/scala/chisel3/util/Counter.scala 77:15]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module QueueModule(
  input         clock,
  input         reset,
  output        io_a_ready, // @[IdeaProjects/BootCamp/DequeueExampleNew/src/main/scala/DequeueModule.scala 5:14]
  input         io_a_valid, // @[IdeaProjects/BootCamp/DequeueExampleNew/src/main/scala/DequeueModule.scala 5:14]
  input  [31:0] io_a_bits, // @[IdeaProjects/BootCamp/DequeueExampleNew/src/main/scala/DequeueModule.scala 5:14]
  output        io_b_ready, // @[IdeaProjects/BootCamp/DequeueExampleNew/src/main/scala/DequeueModule.scala 5:14]
  input         io_b_valid, // @[IdeaProjects/BootCamp/DequeueExampleNew/src/main/scala/DequeueModule.scala 5:14]
  input  [31:0] io_b_bits, // @[IdeaProjects/BootCamp/DequeueExampleNew/src/main/scala/DequeueModule.scala 5:14]
  input         io_z_ready, // @[IdeaProjects/BootCamp/DequeueExampleNew/src/main/scala/DequeueModule.scala 5:14]
  output        io_z_valid, // @[IdeaProjects/BootCamp/DequeueExampleNew/src/main/scala/DequeueModule.scala 5:14]
  output [31:0] io_z_bits // @[IdeaProjects/BootCamp/DequeueExampleNew/src/main/scala/DequeueModule.scala 5:14]
);
  wire  qa_q_clock; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  qa_q_reset; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  qa_q_io_enq_ready; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  qa_q_io_enq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire [31:0] qa_q_io_enq_bits; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  qa_q_io_deq_ready; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  qa_q_io_deq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire [31:0] qa_q_io_deq_bits; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  qb_q_clock; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  qb_q_reset; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  qb_q_io_enq_ready; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  qb_q_io_enq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire [31:0] qb_q_io_enq_bits; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  qb_q_io_deq_ready; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire  qb_q_io_deq_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire [31:0] qb_q_io_deq_bits; // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
  wire [31:0] _T_3 = qa_q_io_deq_bits + qb_q_io_deq_bits; // @[IdeaProjects/BootCamp/DequeueExampleNew/src/main/scala/DequeueModule.scala 26:23]
  Queue qa_q ( // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
    .clock(qa_q_clock),
    .reset(qa_q_reset),
    .io_enq_ready(qa_q_io_enq_ready),
    .io_enq_valid(qa_q_io_enq_valid),
    .io_enq_bits(qa_q_io_enq_bits),
    .io_deq_ready(qa_q_io_deq_ready),
    .io_deq_valid(qa_q_io_deq_valid),
    .io_deq_bits(qa_q_io_deq_bits)
  );
  Queue qb_q ( // @[src/main/scala/chisel3/util/Decoupled.scala 376:21]
    .clock(qb_q_clock),
    .reset(qb_q_reset),
    .io_enq_ready(qb_q_io_enq_ready),
    .io_enq_valid(qb_q_io_enq_valid),
    .io_enq_bits(qb_q_io_enq_bits),
    .io_deq_ready(qb_q_io_deq_ready),
    .io_deq_valid(qb_q_io_deq_valid),
    .io_deq_bits(qb_q_io_deq_bits)
  );
  assign io_a_ready = qa_q_io_enq_ready; // @[src/main/scala/chisel3/util/Decoupled.scala 380:17]
  assign io_b_ready = qb_q_io_enq_ready; // @[src/main/scala/chisel3/util/Decoupled.scala 380:17]
  assign io_z_valid = qa_q_io_deq_valid & qb_q_io_deq_valid & io_z_ready; // @[IdeaProjects/BootCamp/DequeueExampleNew/src/main/scala/DequeueModule.scala 25:30]
  assign io_z_bits = qa_q_io_deq_valid & qb_q_io_deq_valid & io_z_ready ? _T_3 : 32'h0; // @[IdeaProjects/BootCamp/DequeueExampleNew/src/main/scala/DequeueModule.scala 12:13 25:45 src/main/scala/chisel3/util/Decoupled.scala 66:19]
  assign qa_q_clock = clock;
  assign qa_q_reset = reset;
  assign qa_q_io_enq_valid = io_a_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 378:22]
  assign qa_q_io_enq_bits = io_a_bits; // @[src/main/scala/chisel3/util/Decoupled.scala 379:21]
  assign qa_q_io_deq_ready = qa_q_io_deq_valid & qb_q_io_deq_valid & io_z_ready; // @[IdeaProjects/BootCamp/DequeueExampleNew/src/main/scala/DequeueModule.scala 25:30]
  assign qb_q_clock = clock;
  assign qb_q_reset = reset;
  assign qb_q_io_enq_valid = io_b_valid; // @[src/main/scala/chisel3/util/Decoupled.scala 378:22]
  assign qb_q_io_enq_bits = io_b_bits; // @[src/main/scala/chisel3/util/Decoupled.scala 379:21]
  assign qb_q_io_deq_ready = qa_q_io_deq_valid & qb_q_io_deq_valid & io_z_ready; // @[IdeaProjects/BootCamp/DequeueExampleNew/src/main/scala/DequeueModule.scala 25:30]
endmodule
