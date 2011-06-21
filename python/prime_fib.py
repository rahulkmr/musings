#!/usr/bin/env python
import math
from itertools import *

def fib_gen():
    a, b = 0, 1
    while True:
        yield a
        a, b = b, a + b

def is_prime(num):
    for d in range(2, int(math.sqrt(num) + 1)):
        if num % d == 0: return False
    return True

limit = 227000
desired_fib_gen = dropwhile(lambda x: x < limit or not is_prime(x),
                       fib_gen())
desired_fib = list(islice(desired_fib_gen, 1))[0]
print desired_fib

next_fib = desired_fib + 1
prime_divisors_sum = sum(d for d in range(2, next_fib/2) if next_fib % d == 0
                         and is_prime(d))
print prime_divisors_sum
