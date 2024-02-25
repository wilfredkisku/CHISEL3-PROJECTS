module fp32Arithmetic(
  input         clock,
  input         reset,
  input  [31:0] io_fpNumber,
  output        io_sign,
  output [7:0]  io_exp,
  output [22:0] io_mantissa
);
  assign io_sign = io_fpNumber[31]; // @[fp32Arithmetic.scala 12:25]
  assign io_exp = io_fpNumber[30:23]; // @[fp32Arithmetic.scala 13:24]
  assign io_mantissa = io_fpNumber[22:0]; // @[fp32Arithmetic.scala 14:29]
endmodule
