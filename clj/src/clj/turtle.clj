(ns clj.turtle
  (:import (java.awt Color Graphics2D)
           (java.awt.image BufferedImage)
           (javax.swing JFrame JPanel)))

(defprotocol PTurtle
  "Turtle protocol.
  Basic opearions a turtle can do."
  (move [this dist])
  (turn [this deg]))

(defrecord Turtle
  [x y dir canvas panel]
  ;Turtle object.
  PTurtle
  (move [{:keys [x y dir canvas panel]} dist]
        "Moves the object by distance `dist`."
        (let [dx (+ x (* dist (Math/cos (Math/toRadians dir))))
              dy (+ y (* dist (Math/sin (Math/toRadians dir))))]
          (.drawLine canvas x y dx dy)
          (.repaint panel)
          (Turtle. dx dy dir canvas panel)))
  (turn [{:keys [x y dir canvas panel]} deg]
        "Turns the object by `deg` degrees."
        (Turtle. x y (+ dir deg) canvas panel)))

(defn turtle-motion [turtle motions]
  "Applies `motions` to `turtle` where `motions` are of
  the form `[step angle]`."
  (let [move-turtle (fn [current [step angle]]
                      (-> current (move step) (turn angle)))
        new-positions (iterate #(reduce move-turtle % motions) turtle)
        limit (inc (count motions))]
    (nth new-positions limit)))

;(defn turtle-motion [turtle motions]
  ;"Applies `motions` to `turtle` where `motions` are of
  ;the form `[step angle]`."
  ;(let [move-turtle (fn [current [step angle]]
                      ;(-> current (move step) (turn angle)))]
      ;(if (seq motions)
        ;(recur (move-turtle turtle (first motions)) (rest motions))
        ;turtle)))

(defn render-scene [#^Graphics2D g #^BufferedImage bi]
  (.drawImage g bi 0 0 nil))

(defn figures [w h turtle gfx panel]
  (doseq [angle (range 180)]
    (turtle-motion turtle
                   [[90 (- angle)]
                    [30 (- angle)]
                    [60 angle]
                    [30 angle]
                    [60 (- angle)]])
    (Thread/sleep (if (or (= angle 90) (= angle 120)) 500 100))
    (doto gfx
      (.setColor Color/BLACK)
      (.fillRect 0 0 w h))
    (.repaint panel)
    (.setColor gfx Color/WHITE)))

(defn init-turtle [w h]
  (let [bi (BufferedImage. w h BufferedImage/TYPE_INT_RGB)
        gfx (.getGraphics bi)
        scene (atom gfx)
        panel (proxy [JPanel] [] (paint [g] (render-scene g bi)))
        turtle (Turtle. (/ w 2) (/ h 2) 0 gfx panel)]
    (doto (JFrame. "Turtles Playground")
      (.setDefaultCloseOperation JFrame/EXIT_ON_CLOSE)
      (.setSize w h) .pack .show (.add panel))
    (future (while true (.repaint panel) (Thread/sleep 50)))
    (.setColor gfx Color/WHITE)
    (figures w h turtle gfx panel)))

(defn -main [& args]
  (init-turtle 300 300))
