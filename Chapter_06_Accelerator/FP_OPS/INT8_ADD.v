module INT8_ADD(
  input        clock,
  input        reset,
  input  [7:0] io_inputA,
  input  [7:0] io_inputB,
  output [7:0] io_output
);
  assign io_output = $signed(io_inputA) + $signed(io_inputB); // @[INT8_ADD.scala 12:24]
endmodule
