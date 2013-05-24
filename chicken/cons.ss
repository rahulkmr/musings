(define (my-cons x y)
  (lambda (idx)
    (cond
      [(= idx 0) x]
      [(= idx 1) y]
      [else (error "Invalid item")])))

(define (my-car pair) (pair 0))
(define (my-cdr pair) (pair 1))
