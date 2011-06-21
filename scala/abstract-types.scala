import java.io._

abstract class BulkReader {
  type In
  val source: In
  def read: String
}

class FileBulkReader(val source: File) extends BulkReader {
  type In = File
  def read = {
  	val in = new BufferedInputStream(new FileInputStream(source))
  	val numBytes = in.available()
  	val bytes = new Array[Byte](numBytes)
  	in.read(bytes, 0, numBytes)
  	new String(bytes)
  }
}

println(new FileBulkReader(new File("abstract-types.scala")).read)
