#!/usr/bin/env python
import gevent
from flask import Flask, Response

app = Flask(__name__)

@app.route('/')
def stream():
    def gen():
        i = 0
        while 1:
            yield 'data: %d\r\n' % i
            gevent.sleep(1)
            i += 1
    return Response(gen(), mimetype='text/event-stream',
         direct_passthrough=True)

