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

def graph_search(graph, initial, queue)
  queue.enqueue(initial)
  seen = {}
  while not queue.empty?
    node = queue.dequeue
    puts node
    seen[node] = true
    if graph[node]
      graph[node].each {|child| queue.enqueue child unless seen[child] }
    end
  end
end

def dfs_search(graph, initial)
  stack = Array.new 
  def stack.enqueue(el); push(el); end
  def stack.dequeue; pop; end
  graph_search(graph, initial, stack)
end

def bfs_search(graph, initial)
  queue = Array.new
  def queue.enqueue(el); push(el); end
  def queue.dequeue; shift; end
  graph_search(graph, initial, queue)
end
