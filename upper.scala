class Upper {
  def Upper(strings: String*): Seq[String] = {
    strings.map((s:String) => s.toUpperCase())
  }
}

val up = new Upper
Console.println(up.Upper("A", "First", "Scala", "Program"))
