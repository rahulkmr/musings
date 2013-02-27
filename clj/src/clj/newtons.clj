(ns clj.newtons)

(defn abs
  [n]
  (if (< n 0)
    (* -1 n)
    n))

(defn avg
  [a b]
  (/ (+ a b) 2))

(defn good-enough?
  [number guess]
  (let [diff (- (* guess guess) number)]
    (if (< (abs diff) 0.001)
      true
      false)))

(defn sqrt
  ([number] (sqrt number 1.0))
  ([number guess]
   (if (good-enough? number guess)
     guess
     (sqrt number (avg guess (/ number guess))))))

(println (sqrt 25))
