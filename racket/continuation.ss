#lang racket

(define (current-continuation)
  (call/cc (lambda (cc) (cc cc))))

(define fail-stack '())

(define (fail)
  (if (not (pair? fail-stack))
    (error "back-tracking stack exhausted")
    (begin
      (let ([back-track-point (car fail-stack)])
        (set! fail-stack (cdr fail-stack))
        (back-track-point back-track-point)))))

(define (amb choices)
  (let ([cc (current-continuation)])
    (cond
      ([null? choices] (fail))
      ([pair? choices] (let ([choice (car choices)])
                         (set! choices (cdr choices))
                         (set! fail-stack (cons cc fail-stack))
                         choice)))))

(define (assert condition)
  (if (not condition)
    (fail)
    #t))

(let ([a (amb (list 1 2 3 4 5 6 7))]
      [b (amb (list 1 2 3 4 5 6 7))]
      [c (amb (list 1 2 3 4 5 6 7))])
    
  ; We're looking for dimensions of a legal right
  ; triangle using the Pythagorean theorem:
  (assert (= (* c c) (+ (* a a) (* b b))))
  ; And, we want the second side to be the shorter one:
  (assert (< b a))

  ; Print out the answer:
  (display (list a b c))
  (newline))
