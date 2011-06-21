#lang racket

; Base declarations.
(struct account (balance))
(define amount/c natural-number/c)

; Contracts.
(provide/contract
  [create (-> amount/c account?)]
  [balance (-> account? amount/c)]
  [report-cost (-> number? number? string?)]
  [withdraw (->i ([acc account?]
                  [amt (acc) (and/c amount/c (<=/c (balance acc)))])
                 [result (acc amt)
                         (and/c account?
                                (lambda (res)
                                  (>= (balance res)
                                      (+ (balance acc) amt))))])])

; Function definitions.
(define balance account-balance)
(define (create amt) (account amt))
(define (withdraw a amt)
  (account (- (account-balance a) amt)))
(define (deposit a amt)
  (account (+ (account-balance a) amt)))

(define (report-cost lo hi)
  (format "Between ~a and ~a" lo hi))
