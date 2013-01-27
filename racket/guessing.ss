#lang racket/gui

(define f (new frame% [label "guess"]))
(define n (random 5))
(send f show #t)
(define ((check i) btn evt)
  (message-box "." (if (= i n) "Yes" "No")))
(for [ (i (in-range 5)) ]
     (make-object button% (format "~a" i) f (check i)))
