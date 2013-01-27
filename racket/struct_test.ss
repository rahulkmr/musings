#lang racket

(struct thing (name)
        #:transparent
        #:property prop:procedure
        (lambda (self other)
          (string-append "Hi " other ", I'm " (thing-name self)))
        #:guard (lambda (name type-name)
                  (cond 
                    [(string? name) name]
                    [(symbol? name) (symbol->string name)]
                    [else (error type-name "bad name ~e" name)])))

(define foo (thing "foo"))
(displayln (foo "bar"))
(define foobar (thing 1))
