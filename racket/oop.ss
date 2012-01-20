#lang racket

(define fish-interface (interface () get-size grow eat))
(define fish%
  (class* object% (fish-interface)
         (init [size 10])
         (super-new)

         (define current-size size)

         (define/public (get-size) current-size)
         (define/public (grow amt)
                        (set! current-size (+ amt current-size)))
         (define/public (eat other-fish)
                        (grow (send other-fish get-size)))
         ))
