(ns clj.doors
  (require [clojure.contrib.str-utils2 :as su]))

(defn doors
  [n]
  (reduce
    #(update-in %1 [%2] not)
    (into [] (repeat n false))
    (for [pass (range 1 n)
          i (range pass (inc n) pass)
          :while (< i (inc n))]
      i)))

(defn open-doors
  [num]
  (for [[d n] (map
                vector (doors num) (iterate inc 1)) :when d]
    n))

(defn print-open-doors
  [num]
  (println
    (su/join ", " (open-doors num))))

(print-open-doors 50)
