(ns clj.e7
  (:use [clojure.contrib.lazy-seqs :only (primes)]))

(defn nth-prime
  [n]
  (nth primes (dec n)))
