import chisel3._
import chisel3.util._

import scala.collection.immutable

class mantissaAdder extends Module{
  val io = IO(new Bundle {
    val numLarge = Input(UInt((32-9).W))
    val numSmall = Input(UInt((32-9).W))
    val op = Input(Bool())
    val numC = Output(UInt((32-9).W))
  })

  when(io.op)
  {
  io.numC := io.numLarge + io.numSmall
  }
    .otherwise
  {
    io.numC := io.numLarge - io.numSmall
  }
}
class signModule extends Module{
  val io = IO(new Bundle{
    //exponents input
    val expA = Input(UInt(8.W))
    val expB = Input(UInt(8.W))
    //sign input
    val signA = Input(Bool())
    val signB = Input(Bool())
    //numbers
    val mantissaA = Input(UInt((32-9).W))
    val mantissaB = Input(UInt((32-9).W))
  })

   val normA = Wire(UInt((32 - 9).W))
   val normB = Wire(UInt((32 - 9).W))

  when (io.expA <= io.expB)
  {

    normB := io.mantissaB
  }
    .otherwise
  {
    normB := io.mantissaB >> (io.expA - io.expB)
    normA := io.mantissaA
  }

}


class fp32Arithmetic extends Module{
val io = IO(new Bundle{
    val fpNumberA = Input(UInt(32.W))
    val fpNumberB = Input(UInt(32.W))
    val operation = Input(UInt(2.W))

    val signA = Output(Bool())
    val expA = Output(UInt(8.W))
    val mantissaA = Output(UInt((32 - 9).W))
    val signB = Output(Bool())
    val expB = Output(UInt(8.W))
    val mantissaB = Output(UInt((32 - 9).W))
    val mag = Output(UInt(8.W))
})

  //extract A
  io.signA := io.fpNumberA(31)
  io.expA := io.fpNumberA(30,23)
  io.mantissaA := io.fpNumberA(22,0)

  //extract B
  io.signB := io.fpNumberB(31)
  io.expB := io.fpNumberB(30,23)
  io.mantissaB := io.fpNumberB(22,0)

  val add::sub::mul::div::Nil = Enum(4)
  io.mag := 0.U(8.W)
  //evaluate the magnitude
  switch (io.operation)
  {
    is(add)
    {

    }
    is(sub)
    {

    }
    is(mul)
    {

    }
    is(div)
    {

    }
  }

}

object fp32ArithmeticMain extends App {
  println("Generate the Verilog file!")
  (new chisel3.stage.ChiselStage).emitVerilog(new fp32Arithmetic())
}