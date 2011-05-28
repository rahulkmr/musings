(ns clj.e3
  (:use [clojure.contrib.lazy-seqs :only (primes)] 
        [clojure.contrib.math :only (sqrt floor)]))

(defn max-factor
  "Returns the largest prime factor for the given number."
  [num]
  (let [limit (floor (sqrt num))]
    (apply max -1
           (for [p primes :while (< p limit)
                 :when (= 0 (mod num p))] p))))

