import sys

def show(*args):
    for obj in args:
        frame = sys._getframe(1)
        for k, v in frame.f_locals.iteritems():
            if v is obj:
                print "%s=%r" % (k, v)

a = "test"
b = "test"
show(a)

c = 10
d = 10
show(c)
