#!/usr/bin/env python
from Tkinter import *

class App(object):
    def __init__(self, master):
        frame = Frame(master, bg='white')
        frame.pack()

        self.button = Button(frame, text='Quit' ,command=frame.quit)
        self.button.pack(side=LEFT)

        self.hi_there = Button(frame, text='Hello', command=self.hi)
        self.hi_there.pack(side=LEFT)

    def hi(self):
        print "Hi there!"

root = Tk()
app = App(root)
root.mainloop()
