#lang racket

(define fish%
  (class object%
         (super-new)
         (init size)

         (define current-size size)

         (define/public (get-size) current-size)
         (define/public (grow amt)
                        (set! current-size (+ amt current-size)))
         (define/public (eat other-fish)
                        (grow (send other-fish get-size)))
         ))
