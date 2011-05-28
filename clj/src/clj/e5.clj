(ns clj.e5)

(def divisors)
(defn- divisible?
  [num]
  (every? #(= (mod num %) 0) divisors))

(defn by-1-10
  []
  (binding [divisors (range 1 10)]
    (first (for [num (iterate inc 40) 
                :when (divisible? num)] num))))
