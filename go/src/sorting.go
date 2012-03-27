package main

import "fmt"

type Sortable interface {
    Len() int
    Less(i, j int) bool
    Swap(i, j int)
}

func Sort(data Sortable) {
    for i := 1; i < data.Len(); i++ {
        for j := i; j > 0 && data.Less(j, j-1); j-- {
            data.Swap(j, j-1)
        }
    }
}

type IntSlice []int
func (p IntSlice) Len() int { return len(p) }
func (p IntSlice) Less(i, j int) bool { return p[i] < p[j] }
func (p IntSlice) Swap(i, j int) { p[i], p[j] = p[j], p[i] }

func main() {
    data := IntSlice([]int{100, 5, -1, -3, 99, 1, 3})
    Sort(data)
    fmt.Println(data)
}
