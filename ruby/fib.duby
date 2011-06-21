def fib(a:int):int
  if a < 2
    a
  else
    fib(a-1) + fib(a-2)
  end
end

puts fib(10)
