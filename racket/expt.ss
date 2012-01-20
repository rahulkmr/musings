#lang racket

(define (expt a n)
  (cond
    [(even? n) (sqr (expt a (/ n 2)))]
    [else (* a (expt a (sub1 n)))]))
