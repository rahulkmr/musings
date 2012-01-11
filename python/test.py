from functools import partial
from itertools import *

def pipe(cur_val, *fns):
    for fn in fns:
        cur_val = fn(cur_val)
    return cur_val

print pipe(
    count(),
    partial(dropwhile, lambda x: x < 500),
    partial(takewhile, lambda x: x < 510),
    partial(reduce, lambda a, b: a + b)
)

