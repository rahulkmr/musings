(ns clj.f-to-c
  (:import [javax.swing JFrame JPanel JLabel JTextField]
	   [javax.swing.event DocumentListener]
	   [java.awt GridBagLayout GridBagConstraints Insets]))

(defn- f-to-c [f]
  (* (- f 32) 5/9))

(defn- c-to-f [c]
  (+ (* c 9/5) 32))

(defn- parse [s]
  (try (Double/parseDouble (.trim s))
    (catch NumberFormatException e nil)))

(defn- display [n]
  (str (Math/round (float n))))

(defn- update-temp [src target convert]
  (when (.isFocusOwner src)
    (if-let [n (parse (.getText src))]
      (.setText target (display (convert n)))
      (.setText target ""))))

(defn- listen-temp [src target f]
  (.. src getDocument
    (addDocumentListener
      (proxy [DocumentListener] []
        (insertUpdate [e] (update-temp src target f))
        (removeUpdate [e] (update-temp src target f))
        (changedUpdate [e] )))))
