(ns clj.xors
  (:import [java.awt Color Dimension]
          [javax.swing JFrame]))

(defn f-values [f xs ys]
  (for [x (range xs) y (range ys)]
    [ x y (rem (f x y) 256)]))

; Initialize frame.
(def frame (JFrame.))
(.setSize frame (Dimension. 200 200))
(.setVisible frame true)

(def gfx (.getGraphics frame))

(defn clear [g] (.clearRect g 0 0 200 200))

(defn draw-values [f xs ys]
  (clear gfx)
  (.setSize frame (Dimension. xs ys))
  (doseq [[x y v] (f-values f xs ys)]
    (.setColor gfx (Color. v v v))
    (.fillRect gfx x y 1 1)))

(defn -main [& args]
  (draw-values bit-and 256 256)
  (draw-values bit-or 256 256)
  (draw-values bit-xor 256 256)
  (draw-values + 256 256)
  (draw-values * 256 256))
