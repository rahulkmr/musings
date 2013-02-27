package main

import "fmt"

func main() {
	els := map[string]map[string]string{
		"H":  map[string]string{"name": "Hydrogen", "state": "gas"},
		"He": map[string]string{"name": "Helium", "state": "gas"},
		"Li": map[string]string{"name": "Lithium", "state": "solid"},
	}
	fmt.Println(els["Li"])
	if val, ok := els["Un"]; ok {
		fmt.Println(val)
	}
}
