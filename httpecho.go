package main

import (
	"fmt"
	"github.com/julienschmidt/httprouter"
	"net/http"
)

func main() {
	router := httprouter.New()
	router.GET("/echo/:phrase", echoHandler)

	http.ListenAndServe(":8080", router)
}

func echoHandler(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	phrase := ps.ByName("phrase")
	fmt.Printf("received %s\n", phrase)
	fmt.Fprintf(w, "%s", phrase)
}
