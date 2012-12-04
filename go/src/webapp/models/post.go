package models

import (
    "time"
    "github.com/coopernurse/gorp"
)

type Post struct {
    Id int  `db:"id"`
    Name string `db:"name"`
    Title string    `db:"title"`
    Content string  `db:"content"`
    Created int64   `db:"created"`
    Updated int64   `db:"updated"`
}

func (p *Post) PreInsert(s gorp.SqlExecutor) error {
    p.Created = time.Now().UnixNano()
    p.Updated = p.Created
    return nil
}

func (p *Post) PreUpdate(s gorp.SqlExecutor) error {
    p.Updated = time.Now().UnixNano()
    return nil
}

