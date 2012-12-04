package main

import (
    "flag"
    "log"
    s "webapp/settings"
)

func main() {
    flag.Parse()
    for _, v := range flag.Args() {
        switch(v) {
        case "syncdb":
            s.Dbmap.CreateTables()
        case "dropdb":
            s.Dbmap.DropTables()
        default:
            log.Fatal("Not a valid command")
        }
    }
}
