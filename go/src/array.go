package main

import "fmt"

func main() {
	x := [...]float64{98, 93, 77, 82, 83}
	total := 0.0
	for _, val := range x {
		total += val
	}
	fmt.Println(total / float64(len(x)))
}
