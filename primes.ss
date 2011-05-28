#!/usr/bin/env racket
#lang lazy

; all natural numbers
(define nats (cons 2 (map add1 nats)))

; all primes
; Stream[Number] -> Stream[Number]
; generative: eliminate all first elements from the rest of the
; stream, then recur
(define (sieve s)
  (define fst (first s))
  (cons fst (sieve (filter
                     (lambda (m) (not (= (remainder m fst) 0)))
                     s))))

(define primes (sieve nats))

(define (print-primes n)
  (for-each (lambda (x) (displayln x)) (!list (take n primes))))

(print-primes 10)
