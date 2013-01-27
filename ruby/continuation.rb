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

baker = pick (1..5).to_a 
cooper = pick (1..5).to_a 
fletcher = pick (1..5).to_a 
miller = pick (1..5).to_a 
smith = pick (1..5).to_a 

backtrack unless [baker, cooper, fletcher, miller, smith].uniq.size == 5 and
  baker != 5 and
  cooper != 1 and
  fletcher != 5 and
  fletcher != 1 and
  miller > cooper and
  (smith - fletcher).abs != 1 and
  (fletcher - cooper).abs != 1

puts "baker: #{baker} cooper: #{cooper} fletcher: #{fletcher} miller: #{miller} smith: #{smith}"
