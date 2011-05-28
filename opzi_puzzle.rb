#!/usr/bin/env ruby

# Check if the room number matches the criteria.
# Wikipedia says this is called weird number.
def room?(num)
  divisor_sum = 0
  # The values aren't used. 
  subsets = {0 => true}
  for d in 1..(num/2)
    next unless num % d == 0
    divisor_sum += d
    subsets.keys.each do |s|
      return false if s + d == num
      # This is the reason why we couldn't use arrays.
      # array.each and modifying array inside the block won't work.
      # However, iterating over hash keys and modifying hash works.
      subsets[s + d] = true
    end
  end
  divisor_sum > num
end

puts (1..553).select {|n| room?(n) }
