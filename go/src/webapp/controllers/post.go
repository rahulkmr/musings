package controllers

import (
    "net/http"
    m "webapp/models"
    s "webapp/settings"
    h "webapp/helpers"
)

func PostIndex(w http.ResponseWriter, r *http.Request) {
    posts, _ := s.Dbmap.Select(m.Post{}, "select * from post")
    h.RenderTemplate(w, "post_index.html", posts)
}
