#lang web-server/insta

(define cc (make-parameter #f))

(define (input name) `(input ((type "text") (name ,(format "~a" name)))))
(define (submit) `(input ((type "submit"))))
(define (form . body) `(form ((action ,(cc))) ,@body))
(define (a ref . body) `(a ((href ,ref)) ,@body))
(define-syntax page
  (syntax-rules ()
                [(page x ...) (send/suspend (lambda (k) (cc k) (response/xexpr `(html (body ,x ...)))))]))
(define (get name req)
  (extract-binding/single name (request-bindings req)))

(define (start initial-request)
  (define foo (get 'foo (page (form (input 'foo) (submit)))))
  (page (a (cc) "click here"))
  (page "you said: " foo))
