#lang racket
(provide (except-out (all-from-out racket) #%module-begin)
         (rename-out [module-begin #%module-begin]))

(define-syntax-rule (module-begin expr ...)
                    (#%module-begin
                     (define page `(html expr ...))
                     (provide page)))
