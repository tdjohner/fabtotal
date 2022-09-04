package main

import (
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	router := getRouter()
	http.ListenAndServe(":8080", router)
}

func getRouter() *mux.Router {
	r := mux.NewRouter().StrictSlash(true)
	r.HandleFunc("/", home)
	return r
}

func home(w http.ResponseWriter, r *http.Request) {
	//return home page
}
