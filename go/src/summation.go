package main

import "fmt"

type IntVector []int
func (v IntVector) Sum() (s int) {
    for _, x := range v { s += x }
    return
}

func main() {
    data := IntVector([]int{1, 3, 5, 15, 25})
    fmt.Println(data.Sum())
}
