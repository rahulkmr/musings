#lang racket

(define-signature toy-factory^
  (build-toys repaint toy? toy-color))

(provide toy-factory^)
