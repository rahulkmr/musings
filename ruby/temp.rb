def top_n(input, limit)
  res = []
  input.each do |n|
    if res.count < limit or n > res[0]
      res.push(n)
      res.sort!
      res.shift if res.count > limit
    end
  end
  res
end

input = (1..50).to_a.shuffle
puts top_n(input, 5)
