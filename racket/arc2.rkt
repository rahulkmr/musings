#lang racket
(require web-server/servlet web-server/servlet-env)

(define-syntax page
  (syntax-rules ()
                [(page x ...)
                 (response/xexpr `(html (body ,x ...)))]))

(define (ask action msg)
  (page
    `(form ((action ,action) (method "post"))
           ,msg
           (input ((name "get")))
           (input ((type "submit"))))))

(define (get req field)
  (extract-binding/single field (request-bindings req)))

(define (challenge req)
  (define ret-req (send/suspend (lambda (k-url)
                                  (ask k-url "Your name: "))))
  (define name (get ret-req 'get))
  (send/suspend (lambda (k-url)
                  (page `(a ((href ,k-url)) "Click here"))))
  (send/finish (page "Hi " name)))

(define (start req)
  (challenge req))

(serve/servlet start #:port 7070 #:servlet-path "/" #:launch-browser? #f)
