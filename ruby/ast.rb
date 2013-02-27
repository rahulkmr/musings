#!/usr/bin/env ruby

def eval_ast(expr)
  return expr unless expr.is_a? Array
  op = expr[0].is_a?(Proc) ? expr[0] : expr[0].to_proc
  op[*expr[1..-1].map {|v| eval_ast v }]
end

log, sin = Math.method(:log), Math.method(:sin)
puts eval_ast [:+, [:*, [:-@, 4], [log, 3]], [:/, [sin, 15], 5]]
