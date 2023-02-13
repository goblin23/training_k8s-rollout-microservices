package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"time"
)

var (
	name       string
	secretname string
	shouldDie  bool
)

func handler(w http.ResponseWriter, r *http.Request) {
	str := "Hello World"
	h, err := os.Hostname()

	if err == nil {
		str = fmt.Sprintf("%s\n\nHostname: %s", str, h)
	}

	if name != "" {
		str = fmt.Sprintf("%s\nName: %s", str, name)
	}

	if secretname != "" {
		str = fmt.Sprintf("%s\nSecretname:  %s", str, secretname)
	}

	w.Write([]byte(str))
}

func die(w http.ResponseWriter, r *http.Request) {
	go func() {
		time.Sleep(2 * time.Second)
		log.Fatalln("somebody wants me to die....")
	}()
	w.Write([]byte("Bye Bye World"))
}

func dieInXSec() {
	time.Sleep(1 * time.Second)
	panic("ich will sterben")
}

func main() {
	name = os.Getenv("NAME")
	secretname = os.Getenv("SECRETNAME")
	http.HandleFunc("/", handler)
	http.HandleFunc("/die", die)
	if shouldDie {
		dieInXSec()
	}
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal(err)
	}
}
