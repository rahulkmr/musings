(ns clj.fn-browser
  (:import (javax.swing JList JFrame JScrollPane
                        JButton JOptionPane JTextArea)
           java.util.Vector))

(defonce fn-names (->> (ns-publics 'clojure.core)
                    (map key)
                    sort
                    Vector.
                    JList.))
(declare window)

(defn show-info
  []
  (when-let [selected-fn (.getSelectedValue fn-names)]
    (JOptionPane/showMessageDialog
      window
      (-> (ns-resolve 'clojure.core selected-fn)
        meta
        :doc
        (JTextArea. 10 40)
        JScrollPane.)
      (str "Doc string for clojure.core/" selected-fn)
      JOptionPane/INFORMATION_MESSAGE)))

(defonce window (doto (JFrame. "Interactive Development")
                  (.setSize (java.awt.Dimension. 400 300))
                  (.add (JScrollPane. fn-names))
                  (.add java.awt.BorderLayout/SOUTH
                        (doto (JButton. "Show Info")
                          (.addActionListener (reify java.awt.event.ActionListener
                                                (actionPerformed [_ e] (show-info))))))
                  (.setVisible true)))
