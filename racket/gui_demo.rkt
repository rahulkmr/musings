#lang racket/gui

(define frame (new frame% [label "Example"] [width 300] [height 300]))
(define msg (new message% [parent frame] [label "No events so far"]))
(new button% [parent frame] [label "Click me"]
     (callback (λ (button evt) (send msg set-label "Button click"))))

(define my-canvas%
  (class canvas%
         (super-new)
         (define/override (on-event event)
                         (send msg set-label "Canvas mouse"))
         (define/override (on-char event)
                          (send msg set-label "Canvas keyboard"))))
(new my-canvas% [parent frame]
     [paint-callback
       (λ (canvas dc)
          (send dc set-scale 3 3)
          (send dc set-text-foreground "blue")
          (send dc draw-text "Don't panic" 0 0))])


(define panel (new horizontal-panel% [parent frame]))
(new button% [parent panel] [label "left"]
     [callback (λ (button event)
                  (send msg set-label "Left Click"))])
(new button% [parent panel] [label "right"]
     [callback (λ (button event)
                  (send msg set-label "Right Click"))])

(send frame show #t)
