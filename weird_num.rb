!/usr/bin/ruby

# Break early version, checking if a number is weird
def weird_number(n)
  sum = 0
  subset_sums = Hash.new
  subset_sums[0] = true
  for d in 1...n
    next unless n % d == 0
    # Calculate sum of all divisors
    sum += d
    # Calculate sums for all subsets
    subset_sums.keys.each do | s |
      return false if s + d == n
      subset_sums[s + d] = true
    end
  end
  sum > n
end

def weird_numbers(range)
  range.select { | n | weird_number(n) }
end

# Argument parsing
raise "Input exactly one number" unless ARGV.length == 1

max = ARGV[0].to_i

# Call it
puts weird_numbers(1..max)
