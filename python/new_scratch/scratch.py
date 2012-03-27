class AClass(object):

    def __init__(self):
        self.new_attr = 1

    def new_method(self, arg):
        print self.new_attr, arg

a_var = AClass()
a_var.new_method(a_var.new_attr)
