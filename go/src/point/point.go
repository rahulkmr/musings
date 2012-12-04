package point

import (
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
	return n.Point.Abs() * 100
}
func (n *NamedPoint) Hello() {
	fmt.Println(n.name, "says hola")
}
func (n *NamedPoint) Hi() {
	fmt.Println(n.name, "says hi")
}

func New(x, y float64, name string) *NamedPoint {
	return &NamedPoint{Point{x, y}, name}
}
