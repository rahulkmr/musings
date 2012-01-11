#!/usr/bin/env ruby

def merge(a, b)
  merged = []
  iter_a, iter_b = a.each, b.each

  loop do
    if iter_a.peek < iter_b.peek 
      merged << iter_a.next
    else
      merged << iter_b.next 
    end
  end

  loop { merged << iter_a.next }
  loop { merged << iter_b.next }

  merged
end

a = [1, 9, 15, 16, 18, 25]
b = [9, 10, 15, 19, 23, 25, 30]
print merge(a, b)
