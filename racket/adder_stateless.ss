#lang web-server
(require web-server/servlet-env web-server/managers/lru)

(define-syntax html-page
  (syntax-rules ()
    [(html-page x ...)
     (response/xexpr `(html (body ,x ...)))]))

(define (ask msg action)
  (html-page
    `(form [(action ,action) (method "post")]
           ,msg
           (input ((name "number")))
           (input ((type "submit"))))))

(define (get req field) (extract-binding/single field (request-bindings req)))

(define (send-and-get msg)
  (define ret-req (send/suspend
                    (λ (k-url)
                      (ask msg k-url))))
  (string->number (get ret-req 'number)))

(define (start req)
  (define res (+ (send-and-get "Enter first number: ")
                 (send-and-get "Enter second number: ")))
  (html-page "Sum: " `(strong ,(number->string res))))

(serve/servlet start #:port 7070 #:servlet-path "/" #:launch-browser? #f
               #:stateless? #t)
