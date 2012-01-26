#!/usr/bin/env python
from flask import Flask, request
app = Flask(__name__)
app.debug = True

fnids = {}
idx = 0

def store_fnid(fn):
    global idx
    idx += 1
    fnids[idx] = fn
    return idx

def dispatch_fn():
    fn = fnids.get(int(request.values['fnid']))
    if fn:
        return fn()
    else:
        return 'Unknown or expired link'

@app.before_request
def check_fnid():
    if request.values.get('fnid'):
        return dispatch_fn()

@app.route('/', methods=['POST'])
def w_link():
    name = request.values['name']
    fnid = store_fnid(lambda: "Hello %s" % name)
    return '<a href="?fnid=%s">Click here</a>' % (fnid)

@app.route('/')
def aform():
    return '''
        <form method="post">
            <input name="name" />
            <input type="submit" />
        </form>
    '''

if __name__ == '__main__':
    app.run()
