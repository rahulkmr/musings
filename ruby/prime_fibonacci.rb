#!/usr/bin/env ruby

def prime_fib(limit)
  a, b = 0, 1
  loop {
    return a if a > limit and prime?(a)
    a, b = b, a + b 
  }
end

def prime?(num)
  for divisor in (2..Math::sqrt(num))
    return false if num % divisor == 0
  end
  return true
end

def prime_divisors(num)
  divisors = []
  for d in (2..(num/2))
    if num % d == 0 and prime?(d)
      divisors << d
    end
  end
  return divisors
end

puts prime_divisors(prime_fib(227000) + 1).reduce(0, :+)
