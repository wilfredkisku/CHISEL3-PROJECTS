module FxP8_ADD(
  input        clock,
  input        reset,
  input  [7:0] io_inputA,
  input  [7:0] io_inputB,
  output [8:0] io_output
);
  wire [7:0] _io_output_T_2 = $signed(io_inputA) + $signed(io_inputB); // @[FIXED8_ADD.scala 14:26]
  assign io_output = {{1{_io_output_T_2[7]}},_io_output_T_2}; // @[FIXED8_ADD.scala 14:13]
endmodule
