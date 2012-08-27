package main
import (
    "net/http"
    "flag"
    "log"
)

func main() {
    flag.Parse()
    root := "."
    port := ":8080"
    if flag.NArg() > 0 {
        switch flag.NArg() {
        case 1:
            root = flag.Arg(0)
        case 2:
            root = flag.Arg(0)
            port = flag.Arg(1)
        }
    }
    http.Handle("/", http.FileServer(http.Dir(root)))
    if err := http.ListenAndServe(port, nil); err != nil {
        log.Fatal("ListenAndServe: ", err)
    }
}
