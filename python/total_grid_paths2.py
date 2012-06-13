#!/usr/bin/env python
from collections import defaultdict

def gen_neighour(start, end):
    directions = [[-1, 0], [1, 0], [0, 1], [0, -1], [-1, 1], [-1, -1], [1, 1], [1, -1]]
    def neighours(current):
        return ((current[0] + d[0], current[1] + d[1]) for d in directions
                if (start[0] <= (current[0] + d[0]) <= end[0]) and (start[1] <= (current[1] + d[1]) <= end[1]))
    return neighours

def count_paths(start, end):
    neighours = gen_neighour(start, end)
    path_count = 0
    queue = [start]
    prev = defaultdict(list)
    while queue:
        node = queue.pop()
        if node[0] == end[0] and node[1] == end[1]:
            path_count += 1
            continue
        for neighour in neighours(node):
            if not is_prev(neighour, node, prev):
                prev[neighour].append(node)
                queue.append(neighour)
    return path_count

def is_prev(neighour, node, prev):
    p = [node]
    while p:
        if neighour in p:
            return True
        p = prev.get(p)
    return False

print count_paths((1, 1), (3, 3))
