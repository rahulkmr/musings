#lang racket

(define-syntax-rule (swap x y)
                    (let [(tmp x)]
                      (set! x y)
                      (set! y tmp)))

(define-syntax rotate
  (syntax-rules ()
    [(rotate a b ...) (shift-to (b ... a) (a b ...))]))

(define-syntax shift-to
  (syntax-rules ()
    [(shift-to (from0 from ...) (to0 to ...))
     (let [(tmp from0)]
       (set! to from) ...
       (set! to0 tmp))]))

(define-syntax clock
  (syntax-id-rules (set!)
                   [(set! clock e) (put-clock! e)]
                   [(clock a ...) ((get-clock) a ...)]
                   [clock (get-clock)]))

(define-syntax-rules (define-get-put id get put!)
                     (define-syntax id
                       (syntax-id-rules (set!)
                                        [(set! id e) (put! e)]
                                        [(id a (... ...)) ((get) (... ...))]
                                        [id (get)])))

(define-syntax (swap-case stx)
  (syntax-case stx ()
    [(swap x y)
     #'(let [(tmp x)]
         (set! x y)
         (set! y tmp))]))
