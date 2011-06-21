$graph = {a: [:b, :c], b: [:d, :e], c: [:f, :g]}

def dfs(root)
  seen = {}
  dfs_ = lambda {|node|
    puts node
    seen[node] = true
    $graph[node].each {|child| dfs_[child] unless seen[child] } if $graph[node]
  }
  dfs_[root]
end

def bfs(node)
  queue = [node]
  seen = {}
  while queue.size > 0
    node = queue.shift
    puts node
    seen[node] = true
    if $graph[node]
      $graph[node].each {|child| queue.push child unless seen[child] }
    end
  end
end

def dfs_nr(node)
  queue = [node]
  seen = {}
  while queue.size > 0
    node = queue.pop
    puts node
    seen[node] = true
    if $graph[node]
      $graph[node].each {|child| queue.push child unless seen[child] }
    end
  end
end

puts "Graph: #$graph"
puts "Recursive dfs:"
dfs :a
puts "Non-recursive dfs:"
dfs_nr :a
puts "bfs:"
bfs :a
