(ns clj.echo_server
  (require
    [lamina.core :as lm]
    [aleph.tcp :as al]))

(defn echo-handler [channel client-info]
  (lm/siphon channel channel))

(defn -main [& args]
  (al/start-tcp-server echo-handler {:port 1234}))
