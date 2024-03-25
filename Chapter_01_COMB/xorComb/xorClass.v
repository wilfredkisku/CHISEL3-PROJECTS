module xorClass(
  input   clock,
  input   reset,
  input   io_a,
  input   io_b,
  output  io_c
);
  assign io_c = io_a ^ io_b; // @[xorClass.scala 12:16]
endmodule
