#!/usr/bin/env ruby

foo = (0..10).to_a
max_index = foo.size - 1
chunk_size = (foo.size / 4.0).round

left, right = 0, 0 + chunk_size
4.times do |num|
  p [left, right]
  break if right >= max_index
  left = right + 1
  right = left + chunk_size
  right = right < max_index ? right : max_index
end
