(ns clj.rect
  (:require [clojure.contrib.math :as m])
  (:import [javax.swing JFrame JPanel]
           [java.awt Color]
           [java.awt.event WindowAdapter]))

(defn create-panel []
  "Creates a panel, fills it with a red rectangle
  and returns created panel."
  (proxy [JPanel] []
    (paintComponent [g]
                    (let [dimension (.getSize this)
                          max-x (dec (.width dimension))
                          max-y (dec (.height dimension))]
                      (proxy-super paintComponent g)
                      (doto g
                        (.drawString (str "max-x =" max-x) 10 30)
                        (.drawString (str "max-y =" max-y) 10 60)
                        (.setPaint (Color/RED))
                        (.drawRect 0 0 max-x max-y))))))

(defn create-frame []
  "Creates a frame with default closing operation set."
  (let [frame (JFrame.)]
    (.setDefaultCloseOperation frame JFrame/EXIT_ON_CLOSE)
    frame))

(defn -main [& args]
  (let [frame (create-frame)
        panel (create-panel)]
    (doto frame
      (.setSize 200 100)
      (.add panel)
      (.show))))
