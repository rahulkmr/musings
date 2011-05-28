(ns clj.e1)

(def limit 1000)
(def sum (apply +
                (for [num (range 3 limit):when (or (= (mod num 3) 0)
                                                   (= (mod num 5) 0))]
                  num)))
