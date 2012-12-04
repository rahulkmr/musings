package main

import (
    "fmt"
    "point"
)

func main() {
    p := point.New(3, 4, "Pythagoras")
    fmt.Println(p.Abs())
    p.Hello()
}
