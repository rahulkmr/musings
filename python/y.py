#!/usr/bin/env python

def Y(h):
    return (lambda f: f(f))(lambda f: h(lambda *args, **kwargs: f(f)(*args, **kwargs)))

def fact(recur):
    return lambda n: 1 if n < 1 else n * recur(n-1)

print Y(fact)(10)
