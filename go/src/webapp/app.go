package main

import (
	"github.com/gorilla/mux"
	"net/http"
	c "webapp/controllers"
)

func main() {
	r := mux.NewRouter()

	s := r.PathPrefix("/posts").Subrouter()
	s.HandleFunc("/", c.PostIndex).Methods("GET").Name("posts")

	http.Handle("/", r)
	http.ListenAndServe(":9090", nil)
}
