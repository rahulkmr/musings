$graph = { a: [:b, :c], b: [:d, :e], c: [:f, :g] }

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
  stack = [node]
  seen = {}
  while stack.size > 0
    node = stack.pop
    puts node
    seen[node] = true
    if $graph[node]
      $graph[node].each {|child| stack.push child unless seen[child] }
    end
  end
end

def graph_search(graph, initial, fringe)
  fringe.put(initial)
  seen = {}
  while not fringe.empty?
    puts node = fringe.get
    seen[node] = true
    graph[node].each {|child| fringe.put(child) unless seen[child] } if graph[node]
  end
end

def dfs_search(graph, initial)
  stack = Array.new 
  def stack.put(el); push(el); end
  def stack.get; pop; end
  graph_search(graph, initial, stack)
end

def bfs_search(graph, initial)
  queue = Array.new
  def queue.put(el); push(el); end
  def queue.get; shift; end
  graph_search(graph, initial, queue)
end

dfs_search($graph, :a)
bfs_search($graph, :a)
