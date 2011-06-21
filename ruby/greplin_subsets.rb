#!/usr/bin/env ruby

a = [3, 4, 9, 14, 15, 19, 28, 37, 47, 50, 54, 56, 59, 61, 70, 73, 78, 81, 92, 95, 97, 99]
total_desired_subsets = 0

3.upto(a.size-1) do |n|
  a.combination(n) do |c|
    max = c.max
    total_desired_subsets += 1 if max == c.reject {|x| x == max}.reduce(0, :+)
  end
end

puts total_desired_subsets
