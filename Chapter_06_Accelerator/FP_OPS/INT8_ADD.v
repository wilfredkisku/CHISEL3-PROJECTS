module INT8_ADD(
  input        clock,
  input        reset,
  input  [7:0] io_inputA,
  input  [7:0] io_inputB,
  output [8:0] io_output
);
  wire [7:0] _io_output_T_2 = $signed(io_inputA) + $signed(io_inputB); // @[INT8_ADD.scala 12:24]
  assign io_output = {{1{_io_output_T_2[7]}},_io_output_T_2}; // @[INT8_ADD.scala 12:11]
endmodule
