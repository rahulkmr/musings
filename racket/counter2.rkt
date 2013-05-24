#lang racket
(require web-server/servlet
         web-server/servlet-env)

(define (start req)
  (show-counter 0 req))

(define (render-page n)
    (define (res-gen url-for)
      (response/xexpr
        `(html (head (title "Counter"))
               (body
                 (p ,(number->string n))
                 (p  (a ((href ,(url-for (next-num n)))) "+"))
                 (p  (a ((href ,(url-for (prev-num n)))) "-"))))))
    (send/suspend/dispatch res-gen))

(define (next-num n)
  (lambda (req) (show-counter (add1 n) req)))

(define (prev-num n)
  (lambda (req) (show-counter (sub1 n) req)))

(define (show-counter n req)
  (render-page n))

(serve/servlet start
               #:port 7070
               #:servlet-path "/"
               #:launch-browser? #f
               #:listen-ip #f)
