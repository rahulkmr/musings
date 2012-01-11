(ns clj.proxy
  (:import [org.xml.sax InputSource]
           [org.xml.sax.helpers DefaultHandler]
           [java.io StringReader]
           [javax.xml.parsers SAXParserFactory]))

(def print-element-handler
  (proxy [DefaultHandler] []
    (startElement
      [uri local qname attrs]
      (println (format "Saw element %s" qname)))))

(defn demo-sax-parse [source handler]
  (let [parser (-> (SAXParserFactory/newInstance) .newSAXParser)
        src  (-> (StringReader. source) InputSource.)]
    (-> parser (.parse src handler))))

(defn -main [& args]
  (demo-sax-parse
    "<foo><bar>bar body</bar></foo>" print-element-handler))
