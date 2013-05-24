#lang racket

(require "toy-factory-sig.ss")

(define-unit simple-factory@
             (import)
             (export toy-factory^)
             (printf "Factory started")
             (define-struct toy (color) #:transparent)
             (define (build-toys n)
               (for/list [ (i (in-range n)) ]
                         (make-toy 'blue)))
             (define (repaint t col)
               (make-toy col)))
(provide simple-factory@)
