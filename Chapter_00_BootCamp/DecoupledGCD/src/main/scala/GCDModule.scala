import chisel3._
import chisel3.util._

class GcdInputBundle(val w: Int) extends Bundle {
  val value1 = UInt(w.W)
  val value2 = UInt(w.W)
}

class GcdOutputBundle(val w: Int) extends Bundle {
  val value1 = UInt(w.W)
  val value2 = UInt(w.W)
  val gcd    = UInt(w.W)
}

class GCDModule(width: Int) extends Module{

  val input = IO(Flipped(Decoupled(new GcdInputBundle(width))))
  val output = IO(Decoupled(new GcdOutputBundle(width)))

  val xInitial = Reg(UInt())
  val yInitial = Reg(UInt())

  val x           = Reg(UInt())
  val y           = Reg(UInt())
  val busy        = RegInit(false.B)
  val resultValid = RegInit(false.B)

  //initialize the internal signals input --> valid --> Data(bits)
  input.ready := ! busy
  output.valid := resultValid
  output.bits := DontCare

  when (busy){
    when (x>y){
    x := x - y
    }.otherwise{
    y := y - x
    }
    when(y === 0.U){
      output.bits.value1 := xInitial
      output.bits.value2 := yInitial
      output.bits.gcd := x
      output.valid := true.B
      busy := ! output.ready
    }
  }.otherwise{
    //input valid provided from the input not initialized
    when(input.valid){
      // valid data available and no computation in progress, grab new values and start
      val bundle = input.deq()
      x := bundle.value1
      y := bundle.value2
      xInitial := bundle.value1
      yInitial := bundle.value2
      busy := true.B
      resultValid := false.B
    }
  }
}

object GCDModuleMain extends App{
  println("Generate the verilog file.")
  emitVerilog(new GCDModule(8))
}