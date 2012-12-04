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
    nargs := flag.NArg()
    switch {
    case nargs == 1:
        root = flag.Arg(0)
    case nargs > 1:
        root = flag.Arg(0)
        port = flag.Arg(1)
    }
    http.Handle("/", http.FileServer(http.Dir(root)))
    if err := http.ListenAndServe(port, nil); err != nil {
        log.Fatal("ListenAndServe: ", err)
    }
}
