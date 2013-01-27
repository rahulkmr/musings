require 'continuation'

$cont = nil

def test
  i = 0
  callcc {|c| $cont = c }
  i += 1
end

puts test
puts $cont.call 
