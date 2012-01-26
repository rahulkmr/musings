#lang racket/base
(require rackunit "factorial.ss")

(test-case
  "Factorial tests"
  (check-equal? (fact 5) 120 "Simple test")
  (check-equal? (fact 20) 2432902008176640000 "Slightly large number"))
