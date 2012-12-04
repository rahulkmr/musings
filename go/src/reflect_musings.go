package main

import (
    "fmt"
    "reflect"
)

func main() {
    x := 3.4
    typeof, value := reflect.TypeOf(x), reflect.ValueOf(x)
    fmt.Println(typeof, value, value.Type(), value.Kind(), value.Float())

    type MyInt int
    y := 7
    fmt.Println(reflect.ValueOf(y).Kind(), reflect.ValueOf(y).Type(), reflect.TypeOf(y))

    fmt.Println(value.Interface().(float64))
    fmt.Println(value.Interface())
}
