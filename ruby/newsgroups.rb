#!/usr/bin/env ruby

root_dir = '/home/rahul/musings/python'

t1 = Time.now

h = {}
Dir.glob("#{root_dir}/**/*.py") do |file|
  # Spawn threads to calcualte word count.
  h[file] = Thread.new do 
    counts = Hash.new(0)
    IO.foreach(file) do |line|
      line.scan(/\w+/) {|word| counts[word.downcase] += 1 }
    end
    counts
  end
end

# Merge counts.
counts = h.inject({}) do |counts, (filename, thread)|
  counts.merge(thread.value) {|key, c, t| c + t }
end

open('count-decreasing', 'w') do |out|
  counts.sort {|a, b| b[1] <=> a[1] }.each {|k, v| out << "#{k}\t#{v}\n" }
end

open('count-alphabetic', 'w') do |out|
  counts.sort {|a, b| a[0] <=> b[0] }.each {|k, v| out << "#{k}\t#{v}\n" }
end

t2 = Time.now

puts "Finished in #{(t2 - t1).to_s} seconds"
