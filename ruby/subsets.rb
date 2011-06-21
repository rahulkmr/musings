#!/usr/bin/env ruby

a =[3, 4, 9, 14, 15, 19, 28, 37, 47, 50, 54, 56, 59, 61, 70, 73, 78, 81, 92, 95, 97, 99]
desired_subsets = []
(2..a.size).each do |i|
  a.combination(i).each do |c|
    max = c.max
    if max == c.reject { |x| x == max }.reduce(0, :+)
      desired_subsets << c
    end
  end
end
print desired_subsets.size
