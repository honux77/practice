//function, print array
func printArray(arr:Array<Any>)
{
    for i in arr {
        print(i)
    }

}

//Array
var arr = [1,2,3,4,5]

for i in 0..<arr.count {
    arr[i] = arr[i] + 1
    print("Array [\(i)]: \(arr[i])")
}

var someInts = [Int]()
someInts.append(3)
print("someInts is of type [Int] with \(someInts.count) items.")

//test sets
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a")

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
if (favoriteGenres.contains("Rock")) {
    print("Let's Rock & Roll");
}

var dict: [String : String] = ["name": "honux", "age": "25"]
// let dict = ["name": "honux", "age": "25"] error

print(dict["name"]!)
print(dict["name"] ?? "NaN")
print(dict["zizi"] ?? "NaN")






