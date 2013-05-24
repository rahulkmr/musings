#lang racket
(let [(saw (make-hash))]
  (for [(line (in-lines))]
       (unless (hash-ref saw line #f)
         (hash-set! saw line #t)
         (displayln line))))
