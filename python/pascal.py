#!/usr/bin/env python

def pascal(num):
    prev = [1]
    yield prev
    for row in range(1, num):
        curr = [1]
        for idx in range(1, row):
            curr.append(prev[idx-1] + prev[idx])
        curr.append(1)
        yield curr
        prev = curr

for row in pascal(10):
    print '{0:^60s}'.format(' '.join(str(x) for x in row))
