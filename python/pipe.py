#!/usr/bin/env python
from pbs import ls, wc

def p(val, *fns):
    for fn in fns:
        val = fn(val)
    return val

print p(ls(), wc())
