class Node:
    def __init__(self, val, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

def nth_bst(root, limit):
    res = []
    def _fn(el):
        if el == None:
            return
        _fn(el.left)
        _fn.n += 1
        if _fn.n == limit:
            res = [el]
        else:
            _fn(el.right)
    _fn.n = 0
    _fn(root)
    return res[0]

tree = Node(10,
            Node(7,
                 Node(3,
                      Node(1)),
                 Node(8,
                      None,
                      Node(9))),
            Node(13,
                 Node(11),
                 Node(14)))

print nth_bst(tree, 4)
