from gevent.server import StreamServer

def echo(socket, addr):
    print 'New connection from %s:%s' % addr
    fileobj = socket.makefile()
    fileobj.write('Welcome to echo server. Type quit to exit.\r\n')
    fileobj.flush()
    while True:
        line = fileobj.readline()
        if not line:
            print 'Client disconnected.'
            break
        if line.strip().lower() == 'quit':
            print 'Client quit.'
            break
        fileobj.write(line)
        fileobj.flush()
        print 'Echoed %s' % line

if __name__ == '__main__':
    server = StreamServer(('0.0.0.0', 6000), echo)
    print 'Starting echo server on port 6000'
    server.serve_forever()
