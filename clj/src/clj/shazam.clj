(ns clj.shazam
  (require [clj-time.core :as ct])
  (import [javax.sound.sampled AudioFormat TargetDataLine AudioSystem]
          [java.io ByteArrayOutputStream]))

; Initializes microphone.
(defn init-mic [fmt]
  (let [mic (AudioSystem/getTargetDataLine fmt)]
    (.open mic)
    mic))

; Reads from the mic and return read data as
; ByteArrayOutputStream.
(defn read-mic [mic duration]
  (let [buf-size (/ (.getBufferSize mic) 5)
        buffer (byte-array buf-size)
        out (ByteArrayOutputStream.)
        start-time (ct/now)]
    (.start mic)
    (loop [mic mic]
      (let [cnt (.read mic buffer 0 buf-size)]
        ; Record for given `duration`. 
        (if (< (ct/in-secs (ct/interval start-time (ct/now))) duration)
          (when (> cnt 0)
            (.write out buffer 0 cnt)
            (recur mic)))))
    (.stop mic)
    out))

; Entry point.
(defn -main [& args]
  (let [fmt (AudioFormat. 44100 8 1 true true)
        mic (init-mic fmt)
        audio (.toByteArray (read-mic mic 2))]
    audio))
