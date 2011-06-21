#!/usr/bin/env ruby

def qsort(a)
  return a if a.size <= 1
  pivot = a[rand a.size]
  lt, gte = *a.partition {|el| el < pivot }
  qsort(lt) + [pivot] + qsort(gte - [pivot])
end


all_perms = Enumerator.new do |it, y|
  if it.size <= 1
    y << it
  else
    all_perms(it[1..-1]).each do |p|
      0.upto(p.size + 1) {|i| y << p[0...i] + it[0,1] + p[i..-1] }
    end
  end
end
