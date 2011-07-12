import sys
from urllib2 import Request, urlopen
req = Request(sys.argv[1])
req.get_method = lambda: 'HEAD'
print urlopen(req).url
