#lang racket

(define (map1 f lst)
  (define (iter lst accum)
    (if (empty? lst) (reverse accum)
      (iter (rest lst) (cons (f (first lst)) accum))))
  (iter lst empty))


(define (map2 f lst)
  (for/list ([i lst])
            (f i)))

(define (list-sum l k)
  (if (null? l)
    (k 0)
    (list-sum (cdr l) 
              (lambda (s) (k (+ s (car l)))))))

(define (counter start)
  (set! start (- start 1))
  (lambda ()
    (set! start (+ start 1))
    start))

(cond
  [(equal? "hello" "hi") "how?"]
  [else "yeah"])

(define f
  (lambda (x)
    (let ([y 5])
      (+ x y))))
