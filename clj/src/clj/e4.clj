(ns clj.e4
  (:use [clojure.contrib.math :only (expt)])
  (:require [clojure.string :as str]))

(defn- palindrome?
  [num]
  (let [str_num (str num)]
    (= str_num (str/reverse str_num))))

(defn largest-palindrome
  [digits]
  (let [max-digits (- digits 1)
        lower (expt 10 max-digits)
        upper (expt 10 (+ 1 max-digits))]
    (apply max-key first
           (for [n1 (range lower upper)
                 n2 (range lower (+ 1 upper)) :when (palindrome? (* n1 n2))]
             [(* n1 n2) n1 n2]))))
