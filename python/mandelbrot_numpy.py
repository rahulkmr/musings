#!/bin/env python


def mandelcheck(c):
    """
Takes a complex coordinate and returns the number of iterations it

takes to determine whether that point is outside of the Mandelbrot set.

Returns 'maxit' (set below) when the point is probably _in_ the set.

"""
    z = c
    it, maxit = 0, 2**8
    while abs(z) < 2 and it < maxit:
        z = z*z + c # for some reason, z*z is significantly faster than z**2
        it += 1
        return it

minX,  maxX   = -2.2, 0.8
minY,  maxY   = -1.5, 1.5
width, height = 2**10, 2**10

import numpy
mandelbrot = numpy.zeros([height,width], dtype=numpy.uint16)
for i,y in enumerate( numpy.linspace(minY, maxY, height) ):
    for j,x in enumerate( numpy.linspace(minX, maxX, width) ):
        mandelbrot[i,j] = mandelcheck(complex(x,y))

from matplotlib import pyplot
pyplot.imshow(mandelbrot, cmap='spectral')
pyplot.show()
