module fp32Arithmetic(
  input         clock,
  input         reset,
  input  [31:0] io_fpNumberA,
  input  [31:0] io_fpNumberB,
  input  [1:0]  io_operation,
  output        io_signA,
  output [7:0]  io_expA,
  output [22:0] io_mantissaA,
  output        io_signB,
  output [7:0]  io_expB,
  output [22:0] io_mantissaB,
  output [7:0]  io_mag
);
  assign io_signA = io_fpNumberA[31]; // @[fp32Arithmetic.scala 69:27]
  assign io_expA = io_fpNumberA[30:23]; // @[fp32Arithmetic.scala 70:26]
  assign io_mantissaA = io_fpNumberA[22:0]; // @[fp32Arithmetic.scala 71:31]
  assign io_signB = io_fpNumberB[31]; // @[fp32Arithmetic.scala 74:27]
  assign io_expB = io_fpNumberB[30:23]; // @[fp32Arithmetic.scala 75:26]
  assign io_mantissaB = io_fpNumberB[22:0]; // @[fp32Arithmetic.scala 76:31]
  assign io_mag = 8'h0; // @[fp32Arithmetic.scala 79:10]
endmodule
