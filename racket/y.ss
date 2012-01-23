#lang racket
; Y combinator
(define (Y h)
  ((lambda (f) (f f))
  (lambda (f) (h (lambda args (apply (f f) args))))))

; Definition of factorial for y-combinator's consumption.
(define (fact recur)
  (lambda (n)
    (if (< n 1)
      1
      (* n (recur (sub1 n))))))
