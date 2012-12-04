#!/usr/bin/env python

def changer(amount, coins):
    cache = {}
    def _cc(amount, coins):
        if cache.get(amount) and cache[amount].get(tuple(coins)):
            return cache[amount][tuple(coins)]
        elif amount < 0 or not coins:
            val = 0
        elif amount == 0:
            val = 1
        else:
            val = _cc(amount - coins[0], coins) + _cc(amount, coins[1:])
        cache[amount] = {tuple(coins): val}
        return val
    return _cc(amount, coins)
