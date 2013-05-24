#lang web-server
(require web-server/page
         web-server/servlet-env)

; start: request -> response
(define (start request)
  (show-counter 0 request))

; show-counter: number request -> doesn't
; Displays a number that's hyperlinked: when the link is pressed,
; returns a new page with the incremented number.
(define (show-counter n request)
  (page
    (response/xexpr
      `(html (head (title "Counting example"))
             (body
               (a
                 ([href ,(embed/url
                           (lambda (req)
                             (show-counter (add1 n) req)))])
                 ,(number->string n)))))))

(serve/servlet start
               #:port 7070
               #:servlet-path "/"
               #:launch-browser? #f
               #:listen-ip #f)
