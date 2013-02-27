#!/usr/bin/env python
import gevent
from gevent.pywsgi import WSGIServer
from gevent import monkey
monkey.patch_all()

from flask import Flask, Response

app = Flask(__name__)

@app.route('/')
def stream():
    def gen():
        for i in range(10):
            yield 'data: %d\r\n' % i
            gevent.sleep(1)
    return Response(gen(), mimetype='text/event-stream', direct_passthrough=True)

if __name__ == '__main__':
    http = WSGIServer(('', 5000), app)
    http.serve_forever()
