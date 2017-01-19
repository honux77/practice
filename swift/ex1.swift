//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

//for loop 1
for i in 1..<5 {
    print(i, terminator:" ")
}

print("\n---")

//for loop 2
for i in 1...5 {
    print(i, terminator:" ")
}

print("\n---")

//star
func star(_ size:Int)
{
    for i in 1...size {
        for _ in 1...i {
            print("*", terminator: " ")
        }
        print()
    }
}

star(5)
