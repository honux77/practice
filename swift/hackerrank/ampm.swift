import Foundation

// Read the string
let s = readLine()!

let idx = s.index(s.endIndex, offsetBy: -2)
let time = s.substring(to: idx)
let ampm = s.substring(from: idx)

let houridx = time.index(time.startIndex, offsetBy: 2)
var hour = time.substring(to: houridx)

var minsec = time.substring(from: houridx)

if (ampm == "AM" && hour == "12") {
    hour = "00"
}
else if (ampm == "PM" && !(hour == "12")) {
    hour = String(Int(hour)! + 12)
}

let result = hour + minsec

print(result)
