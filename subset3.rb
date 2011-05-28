#!/usr/bin/env ruby

a = (1..4).to_a
subsets = {}

(0..a.size-1).each do |idx|
  subsets.keys.each do |k|
    subsets[k + [a[idx]]] = true
  end
  subsets[ [a[idx]] ] = true
end

print subsets.keys
