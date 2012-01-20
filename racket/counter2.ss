#lang web-server/insta

(define (start req)
  (show-counter 0 req))

(define (show-counter n req)
  (define (res-gen embed/url)
    (response/xexpr
      `(html (head (title "Counter"))
             (body
               (a ((href ,(embed/url next-num)))
                  ,(number->string n))))))
  (define (next-num req)
    (show-counter (add1 n) req))
  (send/suspend/dispatch res-gen))
