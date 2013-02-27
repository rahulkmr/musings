#!/usr/bin/env ruby
require 'continuation'

$backtrack_stack = []

def backtrack
  raise "Back tracking stack exhausted" if $backtrack_stack.empty?
  backtrack_point = $backtrack_stack.shift
  backtrack_point.call backtrack_point
end

def pick(choices)
  cc = callcc {|cc| cc }
  backtrack if choices.empty?
  $backtrack_stack.unshift cc
  choices.shift
end

def assert(condition)
  backtrack unless condition
end

a = pick [9, 4, 12, 33]
b = pick [1, 22, 3, 47]
c = pick [5, 2, 93, 5]

assert (a*a + b*b == c*c)
assert (a > b)

puts "#{a} #{b} #{c}"
