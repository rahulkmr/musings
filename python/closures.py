#!/usr/bin/env python
from flask import Flask, request
app = Flask(__name__)

fnids = {}
idx = 0

def new_fnid(fn):
    global idx
    idx += 1
    fnids[idx] = fn
    return idx

def w_link():
    name = request.values['name']
    fnid = new_fnid(lambda: "Hello %s" % name)
    return '<a href="?fnid=%s">Click here</a>' % (fnid)

def aform():
    fnid = new_fnid(w_link)
    return '''
        <form method="post">
            <input type="hidden" name="fnid" value="%s" />
            <input name="name" />
            <input type="submit" />
        </form>
    ''' % (fnid)

@app.route('/', methods=['GET', 'POST'])
def enter():
    if request.values.get('fnid'):
        return fnids[int(request.values['fnid'])]()
    return aform()

if __name__ == '__main__':
    app.run()
