package main

import "fmt"

func main() {
	n := 0
	for {
		n++
		fmt.Println("go", n)
		if (n == 16384) {
			break
		}
	}
}
