object StringUtil {
  def joiner(strings: List[String], sep: String = " ") = 
  	strings.mkString(sep)
}

import StringUtil._
println(joiner(List("Programming", "Scala")))
