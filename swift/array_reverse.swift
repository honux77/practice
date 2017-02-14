import Foundation

func myswap(src:inout Array<Int>,idx1:Int, idx2:Int) {
    let temp = src[idx1]
    src[idx1] = src[idx2]
    src[idx2] = temp
}

var arr=Array<Int>() //same as [Int]() 

for i in stride(from: 9, to: 0, by: -2) {
    arr.append(i)
}

for i in 0...(arr.count / 2) {
    myswap(src: &arr, idx1: i, idx2: arr.count - 1 - i)
}

print(arr)
