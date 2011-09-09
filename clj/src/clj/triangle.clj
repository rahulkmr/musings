(ns clj.rect
  (:require '[clojure.contrib.math :as m])
  (:import [javax.swing JFrame JPanel]
           [java.awt Color]
           [java.awt.event WindowAdapter]))

(defn create-panel []
  "Panel factory."
  (proxy [JPanel] []
    (paintComponent [g]
                    (let [dimension (.getSize this)
                          max-x (dec (.width dimension))
                          max-y (dec (.height dimension))
                          min-max-xy (min max-x max-y)
                          x-center (/ max-x 2)
                          y-center (/ max-y 2)
                          device-x #(m/round %1)
                          device-y #(max-y - (m/round %1))]
                      (proxy-super paintComponent g)
                      (doto g
                        (.drawString (str "max-x =" max-x) 10 30)
                        (.drawString (str "max-y =" max-y) 10 60)
                        (.setPaint (Color/RED))
                        (.drawRect 0 0 max-x max-y))))))

(defn create-frame []
  "Frame factory."
  (let [frame (JFrame.)]
    (doto frame
      (.setDefaultCloseOperation JFrame/EXIT_ON_CLOSE)
      (.setSize 600 400))))

(defn -main [& args]
  (let [frame (create-frame)
        panel (create-panel)]
    (doto frame
      (.add panel)
      (.show))))
