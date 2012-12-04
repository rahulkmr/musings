package main

import (
    "fmt"
    "math"
)

type Vertex struct {
    X, Y float64
}

func (v *Vertex) Abs() float64 {
    return math.Sqrt(v.X*v.X + v.Y*v.Y)
}

func (v Vertex) Foo() {
    v.X = 10
}

func (v *Vertex) Bar() {
    v.X = 10
}
func main() {
    v := &Vertex{3, 4}
    fmt.Println(v.Abs())
    v.Foo()
    fmt.Println(v.X)
    v.Bar()
    fmt.Println(v.X)
    v2 := Vertex{3, 4}
    v2.Bar()
    fmt.Println(v2.X)
}
