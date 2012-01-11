(try
  (Class/forName "klass")
  (catch ClassNotFoundException ex
    (.toString ex))
  (finally
    (println "Finally")))
