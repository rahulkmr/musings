(ns clj.fact)

(defn fact-iter [product counter max-count]
  (if (> counter max-count)
    product
    (recur (* counter product) (inc counter) max-count)))

(defn factorial [n]
  (fact-iter 1 1 n))

(defn factorial-iter [n]
  (loop [n n accum 1M]
    (if (= n 1)
      accum
      (recur (dec n) (* accum n)))))
