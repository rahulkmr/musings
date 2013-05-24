#lang racket
(require web-server/servlet web-server/servlet-env)

(define-syntax page
  (syntax-rules ()
                [(page x ...)
                 (response/xexpr `(html (body ,x ...)))]))

(define (ask msg action)
  (page
    `(form [(action ,action) (method "post")]
           ,msg
           (input [(name "number")])
           (input [(type "submit")]))))

(define (get req field)
  (extract-binding/single field (request-bindings req)))

(define (send-and-get msg)
  (define ret-req (send/suspend
                    (λ (k-url)
                      (ask msg k-url))))
  (string->number (get ret-req 'number)))

(define (start req)
  (define res (+ (send-and-get "Enter first number: ")
                 (send-and-get "Enter second number: ")))
  (send/back (page "Sum: " `(strong ,(number->string res)))))

(serve/servlet start #:port 7070 #:servlet-path "/" #:launch-browser? #f)
