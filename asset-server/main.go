 
package main

import (
	"net/http"
	"log"
)

func main() {
  fs := http.FileServer(http.Dir("./public"))
  http.Handle("/", fs)

	log.Println("listening on :2000")
	
  err := http.ListenAndServe(":2000", nil)
  if err != nil {
    log.Fatal(err)
	}
}