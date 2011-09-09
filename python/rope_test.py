class AClass(object):

    def __init__(self):
        self.new_attr = 1

    def a_method(self, arg):
        print self.new_attr, arg

def create_aclass(*args, **kwds):
    return AClass(*args, **kwds)

a_var = create_aclass()
a_var.a_method(a_var.new_attr)

def a_func(new_param):
    print new_param

a_func(new_param=10)
a_func(10)

class A(object):

    def a_method(self):
        pass

class B(object):

    def __init__(self):
        self.attr = A()

b = B()
b.attr.a_method()

def b_func():
    a = 1
    b = 2 * a
    c = refact(a, b)
    print a, b, c

def refact(a, b):
    return a * 2 + b * 3

if True:
    x = 2 * 3
else:
    x = 2 * 3 + 1
