(ns clj.hello_ring
  (use ring.util.serve)
  (use ring.adapter.jetty))

(defn app [req]
  {:status 200
   :headers {"Content-Type" "text/html"}
   :body "Hello World from Ring."})

(defn -main [& args]
  (serve app))
