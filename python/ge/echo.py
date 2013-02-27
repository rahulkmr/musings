from gevent import monkey; monkey.patch_all()
from gevent.server import StreamServer
from gevent.socket import tcp_listener
from multiprocessing import cpu_count, Process

def echo(socket, addr):
    fileobj = socket.makefile()
    while True:
        line = fileobj.readline()
        if not line or line.strip().lower() == 'quit':
            break
        socket.send(line)

def serve_forever(listener):
    StreamServer(listener, echo).serve_forever()

if __name__ == '__main__':
    listener = tcp_listener(('0.0.0.0', 6000))
    for i in range(cpu_count()):
        p = Process(target=serve_forever, args=(listener, )).start()
