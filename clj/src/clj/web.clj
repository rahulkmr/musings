(ns clj.web
  (:import (com.sun.net.httpserver HttpHandler HttpExchange HttpServer)
           (java.net InetSocketAddress HttpURLConnection)
           (java.io IOException FilterOutputStream)
           (java.util Arrays)))

(defn new-server [port path handler]
  (doto (HttpServer/create (InetSocketAddress. port) 0)
    (.createContext path handler)
    (.setExecutor nil)
    (.start)))

(defn default-handler [txt]
  (proxy [HttpHandler] []
    (handle [exchange]
            (.sendResponseHeaders exchange HttpURLConnection/HTTP_OK 0)
            (doto (.getResponseBody exchange)
              (.write (.getBytes txt))
              (.close)))))

(def server (new-server 8123
                        "/clj/hello"
                        (default-handler "Hello Clojureland")))
