(ns clj.e2)

(def fib-seq
  ((fn rfib [a b]
     (lazy-seq (cons a (rfib b (+ a b)))))
     1 1))

(def limit 400000)

(def sum
  (apply + (for [num fib-seq :when (even? num)
                 :while (< num limit)] num)))

