#!/usr/bin/env python

class Meta(type):
    def __new__(meta, classname, supers, classdict):
        return type.__new__(meta, classname, supers, classdict)

    def __init__(cls, classname, supers, classdict):
        pass

class Klass(object):
    __metaclass__ = Meta
