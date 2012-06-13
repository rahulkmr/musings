(ns clj.swing-hello1
  (:import [javax.swing JFrame JLabel JTextField JButton]
	   [java.awt.event ActionListener]
	   [java.awt GridLayout]))

(defn celsius []
  (let [frame (JFrame. "Karl Converter")
	temp-text (JTextField.)
	celsius-label (JLabel. "Celsius")
	convert-button (JButton. "Convert")
	fahrenheit-label (JLabel. "Fahrenheit")]

    (.addActionListener
     convert-button
     (reify ActionListener
	    (actionPerformed [this evt]
	       (let [c (Double/parseDouble (.getText temp-text))
		     fahr-text (str (+ 32 (* 1.8 c)) " Fahrenheit")]
		 (.setText fahrenheit-label fahr-text)))))
    
    (doto frame
      (.setLayout (GridLayout. 2 2 3 3))
      (.add temp-text) (.add celsius-label)
      (.add convert-button) (.add fahrenheit-label)
      (.setSize 300 80) (.setVisible true))))
