#lang racket

(provide fact)

(define (fact n)
  (define (fact-iter accum n)
    (if (= n 1)
      accum
      (fact-iter (* accum n) (sub1 n))))
  (fact-iter 1 n))
