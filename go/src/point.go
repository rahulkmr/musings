package main

import(
 "fmt"
 "math"
)

type Point struct {
    x, y float64
}
func (p *Point) Abs() float64 {
    return math.Sqrt(p.x*p.x + p.y*p.y)
}

type NamedPoint struct {
    Point
    name string
}
func (n *NamedPoint) Abs() float64 {
    return n.Point.Abs() * 100;
}

func main() {
    p := &NamedPoint{Point{3, 4}, "Pythagoras"}
    fmt.Println(p.Abs())
}
