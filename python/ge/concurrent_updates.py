#!/usr/bin/env python
import gevent, gevent.pool

def propogate():
    common = {'foo': 'bar', 'bar': 'foo'}
    pool = gevent.pool.Pool(10)
    pool.spawn(change_foo, common)
    pool.spawn(change_bar, common)
    pool.join()
    print common

def change_foo(common):
    common['foo'] = 'foo_updated'

def change_bar(common):
    common['bar'] = 'bar_updated'

if __name__ == '__main__':
    propogate()
