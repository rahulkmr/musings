#lang racket

(define (sqrt x)
  (define (sqrt-iter guess)
    (if (good-enough? guess)
      guess
      (sqrt-iter (improve guess))))

  (define (good-enough? guess)
    (< (abs (- (sqr guess) x)) 0.001))

  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))

  (sqrt-iter 1.0))
