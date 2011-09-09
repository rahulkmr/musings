import sys, gevent
from gevent import socket
from gevent.pool import Pool

N = 1000
pool = Pool(100)
finished = 0

def job(url):
    global finished
    try:
        try:
            ip = socket.gethostbyname(url)
            print '%s = %s' % (url, ip)
        except socket.gaierror:
            ex = sys.exc_info()[1]
            print '%s failed with %s' % (url, ex)
    finally:
        finished += 1

with gevent.Timeout(2, False):
    for x in range(10, 10 + N):
        pool.spawn(job, '%s.com' % x)
    pool.join()

print 'finished within 2 seconds: %s/%s' % (finished, N)
