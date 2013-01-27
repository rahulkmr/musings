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
                         (grow (send other-fish get-size)))))

(define charlie (new fish% [size 10]))
(displayln (send charlie get-size))
(send charlie grow 10)
(displayln (send charlie get-size))

(define hungry-fish% (class fish% (super-new)
                            (inherit eat)
                            (define/public (eat-more fish1 fish2)
                                           (eat fish1)
                                           (eat fish2))))
(define h1 (new hungry-fish%))
(define h2 (new hungry-fish%))
(define h3 (new hungry-fish%))
(displayln (send h1 get-size))
(send h1 eat-more h1 h2)
(displayln (send h1 get-size))
(define get-size (generic fish% get-size))
(displayln (send-generic h1 get-size))

(define picky-fish% (class fish% (super-new)
                           (define/override (grow amt)
                                            (super grow (* 3/4 amt)))))
(define daisy (new picky-fish% [size 20]))
(send daisy eat charlie)
(displayln (send-generic daisy get-size))

(define (picky-mixin %)
  (class % (super-new)
         (define/override (grow amt) (super grow (* 3/4 amt)))))

(define (hungry-mixin %)
  (class % (super-new)
         (inherit eat)
         (define/public (eat-more fish1 fish2)
                        (eat fish1) (eat fish2))))

(define (picky-hungry-fish %)
  (hungry-mixin (picky-mixin %)))
