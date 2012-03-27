package main
import (
    "net/http"
    "flag"
)

func main() {
    flag.Parse()
    root := "."
    if flag.NArg() > 0 {
        root = flag.Arg(0)
    }
    http.Handle("/", http.FileServer(http.Dir(root)))
    http.ListenAndServe(":8080", nil)
}
