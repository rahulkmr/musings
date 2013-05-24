#lang web-server
(require web-server/servlet-env web-server/page)

(define (start req)
  (page
    (response/xexpr `(html (body "hello")))))

(serve/servlet start #:port 7070 #:servlet-path "/" #:launch-browser? #f)
