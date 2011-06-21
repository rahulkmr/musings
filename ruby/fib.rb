limit = 10 ** 999

fib_gen =   Enumerator.new {|y|
  a, b = 0, 1
  loop {
    y << a
    a, b = b, a + b
  }
}

fib_gen.take_while {|f| f < limit }.each {|f| puts f}
