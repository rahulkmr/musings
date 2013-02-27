#lang racket
;; Visualize a sum of two 3D Gaussians as concentric isosurfaces
;; Note: this example requires Racket 5.2 or later
 
(require plot)
 
;; Returns an R x R x R -> R Gaussian function centered at (cx,cy,cz)
(define ((gaussian cx cy cz) x y z)
  (exp (- (+ (sqr (- x cx)) (sqr (- y cy)) (sqr (- z cz))))))
 
;; Lifts + to operate on three-argument functions
(define ((f3+ g h) x y z) (+ (g x y z) (h x y z)))
 
;; Constructs an image value representing the sum of two Gaussians
(plot3d (isosurfaces3d (f3+ (gaussian 0 0 0) (gaussian 1.5 -1.5 0))
                       -1 2.5 -2.5 1 -1 1
                       #:label "g"))  ; labeling adds a legend
