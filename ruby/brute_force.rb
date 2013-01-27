#!/usr/bin/env ruby

a = [9, 4, 12, 33]
b = [1, 22, 3, 47]
c = [5, 2, 93, 15]

a.each do |x1|
  b.each do |x2|
    c.each do |x3|
      if (x1 > x2) and (x1*x1 + x2*x2 == x3*x3)
        puts "#{x1} #{x2} #{x3}"
      end
    end
  end
end
