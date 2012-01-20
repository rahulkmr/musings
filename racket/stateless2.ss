#lang web-server
(require web-server/servlet-env)

(define (start request)
  (send/suspend/dispatch
    (lambda (k-url)
      (response/xexpr
        `(html (body (a ((href ,(k-url start))) "Hello!")))))))

(serve/servlet start
               #:port 7070
               #:servlet-path "/"
               #:launch-browser? #f
               #:listen-ip #f
               #:stateless? #t)
