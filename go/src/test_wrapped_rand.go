package main

import (
    "fmt"
    "wrapped_rand"
)

func main() {
    wrapped_rand.Seed(5)
    fmt.Println(wrapped_rand.Random())
}
