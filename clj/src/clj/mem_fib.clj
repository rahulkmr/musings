(ns clj.mem_fib)

(defn my-memoize [f]
  (def mem (atom {}))
  (fn [& args]
    (if-let [e (find @mem args)]
      (val e)
      (let [ret (apply f args)]
        (swap! mem assoc args ret)
        ret))))

(defn fib [n]
  (if (<= n 1)
    n
    (+ (fib (dec n)) (fib (- n 2)))))

(defn -main [& args]
  (time (fib 35))
  (def fib (my-memoize fib))
  (time (fib 35)))
