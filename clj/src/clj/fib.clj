(ns clj.fib)

(defn fib-seq
  []
  (map first (iterate 
               (fn [[a b]] [b (+ a b)])
               [0M 1M])))

