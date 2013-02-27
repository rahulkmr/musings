package main

import (
	"fmt"
)

func test() interface{} {
	return 5
}

func foo(i int) {
	fmt.Println("foo", i)
}

func main() {
	i := test()
	fmt.Println(i)
	foo(i.(int))
}
