package main
import (
    "fmt"
    "net"
)

func main() {
    fmt.Println(net.InterfaceAddrs())
    fmt.Println(net.Interfaces())
    fmt.Println(net.LookupAddr("23.21.253.218"))
    fmt.Println(net.LookupCNAME("www.thoughtnirvana.com"))
    fmt.Println(net.LookupIP("www.thoughtnirvana.com"))
    fmt.Println(net.LookupMX("www.thoughtnirvana.com"))
}
