(ns clj.hello-ring
  (use ring.adapter.jetty))

(defn app [req]
  {:status 200
   :headers {"Content-Type" "text/html"}
   :body "Hello World from Ring."})

(defonce server
  (future (run-jetty #'app {:port 8080 :join? false})))

(defn -main [& args]
  server)
