object Upper {
  def upper(strings: String*) = strings.map(_.toUpperCase())
}

println(Upper.upper("A", "first", "scala", "program"))
