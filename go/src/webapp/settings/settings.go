package settings

import (
    "database/sql"
    _ "github.com/mattn/go-sqlite3"
    "github.com/coopernurse/gorp"
    m "webapp/models"
)

const (
    DbDriver = "sqlite3"
    DbDsn = "dev.db"

    TemplatesDir = "views"
    TemplateExt = ".html"
)

var (
    DbDialect = gorp.SqliteDialect{}
    Dbmap = connect()
    DbTables = map[string]interface{}{"post": m.Post{}}
)

func connect() *gorp.DbMap {
    db, err := sql.Open(DbDriver, DbDsn)
    if err != nil {
        panic("Error connecting to db" + err.Error())
    }
    return &gorp.DbMap{Db: db, Dialect: DbDialect}
}

func addTables() {
    for name, val := range DbTables {
        Dbmap.AddTableWithName(val, name).SetKeys(true, "Id")
    }
}

func init() {
    addTables()
}
