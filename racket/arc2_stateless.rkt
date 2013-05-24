#lang web-server 
(require web-server/servlet-env)

(define-syntax page
  (syntax-rules ()
                [(page x ...)
                 (response/xexpr `(html (body ,x ...)))]))

(define (ask action kont-field msg)
  (page
    `(form [(action ,(url->string action)) (method "post")]
           ,msg
           ,kont-field
           (input [(name "get")])
           (input [(type "submit")]))))

(define (get req field)
  (extract-binding/single field (request-bindings req)))

(define (challenge req)
  (define ret-req (send/suspend/hidden (lambda (k-url kont-field)
                                         (ask k-url kont-field "Your name: "))))
  (define name (get ret-req 'get))
  (send/suspend (lambda (k-url)
                  (page `(a ((href ,k-url)) "Click here"))))
  (page "Hi " name))

(define (start req)
  (challenge req))

(serve/servlet start #:port 7070 #:servlet-path "/" #:launch-browser? #f
               #:stateless? #t)
