(ns clj.macros)

(defmacro nif
  [expr pos zero neg]
  `(cond
     (> ~expr 0) ~pos
     (= ~expr 0) ~zero
     :else ~neg))

(defmacro our-when
  [expr & body]
  `(if ~expr
     (do ~@body)))

(defmacro our-for
  [var start stop & body]
  `(loop [~var ~start limit# ~stop]
     (when (< ~var limit#)
       ~@body
       (recur (inc ~var) limit#))))

(defmacro aif
  ([expr then]
   `(aif ~expr ~then nil))
  ([expr then else]
   `(let [~'it ~expr]
      (if ~'it
        ~then
        ~else))))
