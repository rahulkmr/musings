#!/usr/bin/env python

thunk = lambda fn, *args, **kwargs: lambda: fn(*args, **kwargs)
identity = lambda x: x

def trampoline(fn):
    def _trampoline(bouncer):
        while callable(bouncer):
            bouncer = bouncer()
        return bouncer
    return lambda *args, **kwargs: _trampoline(fn(*args, **kwargs))

@trampoline
def factorial(n):
    def _fact(n, k):
        if n == 0:
            return k(1)
        else:
            return thunk(_fact, n-1, lambda v: thunk(k, n*v))
    return _fact(n, identity)

print factorial(1000)
