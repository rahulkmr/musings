package main

import (
	"fmt"
)

func main() {
	test := func (who string) string {
		return "Hello, " + who
	}
	fmt.Println(test("World!"))

	func (who string) {
		fmt.Println("Hello,", who)
	}("World!")
}
