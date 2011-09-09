#!/usr/bin/env ruby

def eval_ast(expr)
  return expr unless expr.is_a? Array
  op, *vals = expr[0], *expr[1..-1]
  operands = vals.map {|v| eval_ast v }
  return op.to_proc.call(*operands)
end

expr = [:+, [:*, 4, 3], [:/, 15, 5]]
puts eval_ast(expr)
