#!/usr/bin/env python
import cPickle

class Closure(object):
    def __init__(self, fn_closure):
        self.fn_closure = fn_closure

    def __call__(self, *args, **kwargs):
        return self.fn_closure(*args, **kwargs)

name = "Rahul"
greet = lambda: "Hello %s" % name
for_pickle = Closure(greet)
print for_pickle()
