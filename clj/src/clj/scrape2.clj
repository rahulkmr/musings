(ns clj.scrape2
  (:require [net.cgrand.enlive-html :as html]))

(def *base-url* "http://news.ycombinator.com/")

(defn- fetch-url [url]
  (html/html-resource (java.net.URL. url)))

(defn- hn-headlines-and-points []
  (let [headline-points #{[:td.title :a] [:td.subtext html/first-child]}
        hn-data (html/select (fetch-url *base-url*) headline-points)]
    (map html/text hn-data)))

(defn print-all []
  (defn break-headlines-points [[ h s]]
    (str h "( " s ") "))
  (doseq [line 
          (->> (hn-headlines-and-points)
            (partition 2)
            (map break-headlines-points))]
    (println line)))
