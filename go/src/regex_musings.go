package main

import (
	"fmt"
	"regexp"
)

func main() {
	byte_src, str_src := []byte("rahul kumar"), "rahul kumar"

	match, _ := regexp.Match(`\w+\s+\w+`, byte_src)
	fmt.Println(match)

	match, _ = regexp.MatchString(`\w+\s+\w+`, str_src)
	fmt.Println(match)

	r := regexp.MustCompile(`(\w+)\s+(\w+)`)
	byte_tmpl, str_tmpl := []byte("$2, $1"), "$2, $1"
	dst := []byte("Nice to meet you. ")

	fmt.Printf("%s\n", r.Expand(dst, byte_tmpl, byte_src, r.FindSubmatchIndex(byte_src)))
	fmt.Printf("%s\n", r.ExpandString(dst, str_tmpl, str_src, r.FindStringSubmatchIndex(str_src)))

	r = regexp.MustCompile(`(\w+)`)
    fmt.Printf("%s\n", r.Find(byte_src))
    fmt.Printf("%s\n", r.FindAll(byte_src, -1))
    fmt.Printf("%v\n", r.FindAllIndex(byte_src, -1))
    fmt.Printf("%s\n", r.FindAllString(str_src, -1))
    fmt.Printf("%v\n", r.FindAllStringIndex(str_src, -1))
    fmt.Printf("%s\n", r.FindStringSubmatch(str_src))
    fmt.Printf("%s\n", r.FindAllStringSubmatch(str_src, -1))
    fmt.Printf("%v\n", r.FindAllStringSubmatchIndex(str_src, -1))
}
