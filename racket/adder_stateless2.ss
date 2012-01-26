#lang web-server
(require web-server/servlet-env)

(define-syntax html-page
  (syntax-rules ()
    [(html-page x ...)
     (response/xexpr `(html (body ,x ...)))]))

(define (ask msg action form-field)
  (html-page
    `(form [(action ,(url->string action)) (method "post")]
           ,msg
           ,form-field
           (input [(name "number")])
           (input [(type "submit")]))))

(define (send-and-get msg)
  (define (get req field) (extract-binding/single field (request-bindings req)))
  (define ret-req (send/suspend/hidden
                    (λ (k-url form-field)
                      (ask msg k-url form-field))))
  (string->number (get ret-req 'number)))

(define (start req)
  (define res (+ (send-and-get "Enter first number: ")
                 (send-and-get "Enter second number: ")))
  (html-page "Sum: " `(strong ,(number->string res))))

(serve/servlet start #:port 7070 #:servlet-path "/" #:launch-browser? #f
               #:stateless? #t)
