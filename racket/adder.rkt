#lang racket
(require web-server/servlet web-server/servlet-env)

(define (page contents)
  (response/xexpr `(html (body ,contents))))

(define (ask action)
  (page
    `(form ((action ,action) (method "post"))
           (input ((name "number")))
           (input ((type "submit"))))))

(define (start req)
  (define nums '())

  (define (get req) (extract-binding/single 'number (request-bindings req)))
  (define (extractor req)
    (set! nums (cons (string->number (get req)) nums))
    (if (= (length nums) 2)
      (send/finish (page `(p "Sum: " (strong ,(number->string (apply + nums))))))
      (send/suspend/dispatch input-page)))

  (define (input-page url-for)
    (ask (url-for extractor)))
  (send/suspend/dispatch input-page))

(serve/servlet start #:port 7070 #:servlet-path "/" #:launch-browser? #f)
