(ns clj.ring_request
  (require [clojure.contrib.string :as s])
  (use ring.util.serve)
  (use ring.adapter.jetty))

(defn app [req]
  {:status 200
   :headers {"Content-Type" "text/html"}
   :body
   (for [txt [(:server-port req) (:server-name req) (:remote-add req)
              (:uri req) (:query-string req) (:scheme req)
              (:request-method req) (:content-type req) (:headers req)]]
     (str "<p>" txt "</p>"))})

(defn -main [& args]
  (serve app {:port} 8080))
