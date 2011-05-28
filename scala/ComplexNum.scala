class Complex(real: Double, imaginary: Double) {
  def re = real
  def im = imaginary
}

object ComplexNum {
  def main(args: Array[String]) {
    val c = new Complex(1.2, 3.4)
    println("Imaginary part: " + c.im)
  }
}
