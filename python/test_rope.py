#!/usr/bin/env python
def pow(x, y):
    result = 1
    for i in range(y):
        result *= x
    return result

print pow(2, 3)
