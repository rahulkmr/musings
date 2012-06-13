#!/usr/bin/env python

def gen_neighour(start, end):
    directions = [[-1, 0], [1, 0], [0, 1], [0, -1], [-1, 1], [-1, -1], [1, 1], [1, -1]]
    def neighours(current):
        return ((current[0] + d[0], current[1] + d[1]) for d in directions
                if (start[0] <= (current[0] + d[0]) <= end[0]) and (start[1] <= (current[1] + d[1]) <= end[1]))
    return neighours

def num_paths(start, end):
    neighours = gen_neighour(start, end)
    count = [0]
    parent = {}

    def should_visit(node, neighour):
        """
        `neighour` shouldn't be parent of `node`.
        """
        p = node
        while p:
            if p == neighour:
                return False
            p = parent.get(p)
        return True

    def print_path(node):
        result = []
        p = node
        while p:
            result.append(p)
            p = parent.get(p)
        result.reverse()
        print result

    def count_targets(node):
        if node[0] == end[0] and node[1] == end[1]:
            print_path(node)
            count[0] += 1
            return
        for neighour in (n for n in neighours(node) if should_visit(node, n)):
            parent[neighour] = node
            count_targets(neighour)

    count_targets(start)
    return count[0]

print num_paths((1, 1), (3, 3))
