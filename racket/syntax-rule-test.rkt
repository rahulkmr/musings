#lang racket

(define-syntax-rule (swap x y)
                    (let [(tmp x)]
                      (set! x y)
                      (set! y tmp)))

(define-syntax define-my-syntax-rule
  (syntax-rules ()
    [(define-my-syntax-rule (id args ...) forms ...)
     (define-syntax id
       (syntax-rules ()
         [(id args ...) forms ...]))]))

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

(define-syntax (swap-case stx)
  (syntax-case stx ()
    [(swap x y)
     #'(let [(tmp x)]
         (set! x y)
         (set! y tmp))]))

(define-syntax-rule (null! a)
                    (set! a null))

(define-syntax syntax-null!
  (syntax-rules ()
    [(my-null! var) (set! var '())]))

(define-syntax (syntax-case-null! stx)
  (syntax-case stx ()
    [(syntax-case-null! var)
     (display "Syntax case")
     #'(set! var null)]))

(define-syntax-rule (nif expr pos zero neg)
                    (cond
                      [(> expr 0) pos]
                      [(= expr 0) zero]
                      [else neg]))

(define-syntax-rule (my-when pred forms ...)
                    (if pred
                      (begin forms ...)
                      '()))

(define-syntax my-for
  (syntax-rules (from to in)
    [(my-for var from low to high in forms ...)
     (let loop [(var low) (high-val high)]
       (if (> var high-val)
         'done
         (begin
           forms ...
           (loop (add1 var) high-val))))]))
