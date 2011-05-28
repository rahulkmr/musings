#!/usr/bin/env ruby
a = [3, 4, 9, 14, 15, 19, 28, 37, 47, 50, 54, 56, 59, 61, 70, 73, 78, 81, 92, 95, 97, 99]
subsets = {[a[0]] => true}
last_idx = a.size - 1
desired_subsets = []

(1..last_idx).each do |i|
  subsets.keys.each do |k|
      new_set = k + [a[i]]
      subsets[new_set] = true
      max = new_set.max
      desired_subsets << new_set if max == new_set.reject {|x| x == max }.reduce(0, :+) 
  end
  subsets[[a[i]]] = true
end
puts desired_subsets.size
