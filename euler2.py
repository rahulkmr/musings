#!/usr/bin/env python

def fib_gen():
    a, b = 1, 2
    while a <= 4000000:
        # yield even fibs.
        if not a & 01:
            yield a
        a, b = b, a+b

print sum(fib_gen())
