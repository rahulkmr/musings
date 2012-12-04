#!/usr/bin/python
import sys
from PySide.QtCore import *
from PySide.QtGui import *

def say_hello():
    print "Hello World"

# Create a Qt application
app = QApplication(sys.argv)
# Create a Label and show it
button = QPushButton("Click Me")
button.clicked.connect(say_hello)
button.show()

# Enter Qt application main loop
app.exec_()
sys.exit()
