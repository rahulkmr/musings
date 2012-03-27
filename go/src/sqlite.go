package main
import "github.com/kuroneko/gosqlite3"

func main() {
    db, err := sqlite3.Open("test.db")
    if err != nil { panic(err) }
    defer db.Close()
}
