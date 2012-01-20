#lang web-server
(require web-server/servlet-env)

(define (start req)
  (send/suspend
    (lambda (k-url)
      (response/xexpr
        `(html (body (a ([href ,k-url]) "Hello world!")))))))

(serve/servlet start #:port 7070 #:servlet-path "/" #:launch-browser? #f
               #:stateless? #t)
