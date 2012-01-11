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
