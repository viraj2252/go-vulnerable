package main

import "fmt"

// #cgo LDFLAGS: -Wl,-unresolved-symbols=ignore-all
import "C"

func main() {
	fmt.Printf("hello world")
}
