#!/usr/bin/env ruby

class Fiber
  include Enumerable
  def each
    loop { yield self.resume }
  end
end

def fib_gen
  Fiber.new {
    a, b = 0, 1
    while true 
      Fiber.yield a
      a, b = b, a + b
    end
  }
end

def prime?(num)
  2.upto(Math.sqrt num) do |d|
    return false if num % d == 0
  end
  return true
end

desired_fib = fib_gen.find {|x| x > 227000 and prime? x }
next_num = desired_fib + 1
prime_divisors_sum = 2.upto(next_num/2).select {|d| next_num %d == 0 and prime? d}.reduce(0, :+)
puts desired_fib, prime_divisors_sum
