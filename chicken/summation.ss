(define (sum term next a b)
  (define (iter a res)
    (if (> a b)
      res
      (iter (next a) (+ (term a) res))))
  (iter a 0))

(define (pi-sum a b)
  (define (pi-term x)
    (/ 1.0 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term pi-next a b))
