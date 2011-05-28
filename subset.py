#!/usr/bin/env python

a = [1, 2, 3, 4]
subsets = {}

for i in range(len(a)):
    for k in subsets.keys():
        subsets[k + (a[i],)] = True
    subsets[ (a[i],) ] = True

print subsets.keys()
