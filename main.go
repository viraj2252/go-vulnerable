package main

// #cgo LDFLAGS: -Wl,-R,--plugin=./evil.so
import "C"

func main() {
	println("Hello, world!")
}
