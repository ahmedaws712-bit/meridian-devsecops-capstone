package main

import (
"log"
"net/http"
)

func main() {
fileServer := http.FileServer(http.Dir("/app"))

http.Handle("/", fileServer)

log.Println("Meridian static app running on port 8080")
if err := http.ListenAndServe(":8080", nil); err != nil {
log.Fatal(err)
}
}
