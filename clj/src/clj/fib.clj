(ns clj.fib)

(defn fib-step 
  [[a b]]
  [b (+ a b)])

(defn fib-seq
  []
  (map first (iterate fib-step [0 1])))
