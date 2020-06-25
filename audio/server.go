package main

import (
	"log"
	"net/http"
	"os"
)

type justFilesFilesystem struct {
	Fs http.FileSystem
}

func (fs justFilesFilesystem) Open(name string) (http.File, error) {
	f, err := fs.Fs.Open(name)

	if err != nil {
		return nil, err
	}

	stat, err := f.Stat()
	if stat.IsDir() {
		return nil, os.ErrNotExist
	}

	return f, nil
}

func main() {
	fs := justFilesFilesystem{http.Dir("./public")}

	log.Println("listening on :2000")

	err := http.ListenAndServe(":2000", http.FileServer(fs))
	if err != nil {
		log.Fatal(err)
	}
}
