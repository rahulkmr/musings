#lang lazy

(define fibs
  (list* 1 1 (map + fibs (cdr fibs))))

(print (list-ref fibs 1000))
