(ns clj.scrap
  (:require [clojure.java.io :as io] [clojure.string :as s]
            [clojure.xml :as xml]))

(defn twitter-followers
  [username]
  (->> (str "https://api.twitter.com/1/users/show.xml?screen_name=" username)
    xml/parse
    :content
    (filter (comp #{:followers_count} :tag))
    first
    :content
    first
    Integer/parseInt))

(defn -main [& args]
  (println (twitter-followers "rahulsinner")))
