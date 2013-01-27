#lang racket
(require web-server/servlet web-server/servlet-env)

(define cc (make-parameter #f))
(define-syntax page
  (syntax-rules ()
                [(page x ...)
                 (send/suspend (lambda (k-url)
                                 (cc k-url)
                                 (response/xexpr `(html (body ,x ...)))))]))

(define (ask)
  (page
    `(form ((action ,(cc)) (method "post"))
           "Your name: "
           (input ((name "get")))
           (input ((type "submit"))))))

(define (get req field)
  (extract-binding/single field (request-bindings req)))

(define (challenge req)
  (define name (get (ask) 'get))
  (page `(a ((href ,(cc))) "Click here"))
  (send/finish (page "Hi " name)))
    
(define (start req)
  (challenge req))

(serve/servlet start #:port 7070 #:servlet-path "/" #:launch-browser? #f)
