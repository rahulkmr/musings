#!/usr/bin/env ruby

module Enumerable
 def conmap(&block)
   threads = []
   self.each do |item|
     threads << Thread.new { block.call(item) }
   end
   threads.map {|t| t.value }
 end
end


N = {
  a: { b:2, c:1, d:3, e:9, f:4 },
  b: { c:4, e:3 },
  c: { d:8 },
  d: { e:7 },
  e: { f:5 },
  f: { c:2, g:2, h:2 },
  g: { f:1, h:6 },
  h: { f:9, g:8 }
}
