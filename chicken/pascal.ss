(define (pascal row col)
  (cond
    [(= row 1) 1]
    [(= row col) 1]
    [(= col 1) 1]
    [else (+ (pascal (sub1 row) col)
             (pascal (sub1 row) (sub1 col)))]))
