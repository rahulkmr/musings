import gevent
from gevent import monkey
monkey.patch_all()

import urllib2

def print_head(url):
    print 'Starting %s' % url
    data = urllib2.urlopen(url).read()
    print '%s: %s bytes: %r' % (url, len(data), data[:50])

urls = ['http://www.google.com', 'http://www.yandex.com', 'http://www.python.org']
jobs = [gevent.spawn(print_head, url) for url in urls]
gevent.joinall(jobs)
