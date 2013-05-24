(define fail-stack '())

(define (fail)
  (if (not (pair? fail-stack))
    (error "back-tracking stack exhausted")
    (begin
      (let ([back-track-point (car fail-stack)])
        (set! fail-stack (cdr fail-stack))
        (back-track-point back-track-point)))))

(define (amb choices)
  (let ([cc (call/cc (lambda (cc) cc))])
    (cond
      ([null? choices] (fail))
      ([pair? choices] (let ([choice (car choices)])
                         (set! choices (cdr choices))
                         (set! fail-stack (cons cc fail-stack))
                         choice)))))

(define (check condition)
  (if (not condition)
    (fail)
    #t))

(let ([a (amb (list 9 12 33 49 4 16 77))]
      [b (amb (list 1 22 3 47 51 65 17))]
      [c (amb (list 11 2 93 5 25 36 47))])

  ; We're looking for dimensions of a legal right
  ; triangle using the Pythagorean theorem:
  (check (= (* c c) (+ (* a a) (* b b))))
  ; And, we want the second side to be the shorter one:
  (check (< b a))

  ; Print out the answer:
  (print (list a b c))
  (newline))
