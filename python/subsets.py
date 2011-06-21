#!/usr/bin/env python
from itertools import *

a = [3, 4, 9, 14, 15, 19, 28, 37, 47, 50, 54, 56, 59, 61, 70, 73, 78, 81, 92, 95, 97, 99]
desired_subsets = []

def subset_sum_check(subset):
    max_num = max(subset)
    without_max_sum = sum(filter(lambda x: x != max_num, subset))
    return max_num == without_max_sum

subsets = chain.from_iterable(combinations(a, r) for r in range(3, len(a) + 1))
desired_subsets = ifilter(subset_sum_check, subsets)
print len(list(desired_subsets))
