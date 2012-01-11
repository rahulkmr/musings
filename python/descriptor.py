#!/usr/bin/env python

class D(object):
    def __init__(self, attr_name):
        self.attr_name = attr_name

    def __get__(self, instance, cls):
        print 'fetch'
        return getattr(cls, self.attr_name)

    def __set__(self, instance, val):
        print 'set'
        setattr(instance.__class__, self.attr_name, val)

class C(object):
    _test = 10
    test = D('_test')

C.test
C.test = 20
