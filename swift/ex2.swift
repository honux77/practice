//http://seorenn.blogspot.kr/2014/06/swift-structure.html 

import Darwin

struct Point
{
    var x:Double = 0
    var y:Double = 0
    
    func getDistance(p2:Point) -> Double
    {
        return sqrt(pow(self.x - p2.x, 2.0) + pow(self.y - p2.y, 2))
        
    }
    
}

struct Rectangle
{
    var topLeft:Point
    var bottomRight:Point
    var area:Double {
        return abs((topLeft.x - bottomRight.x) * (topLeft.y - bottomRight.y))
    }
}
let ORIGIN = Point(x:0, y:0)
let point = Point(x:2, y: -2)
let rect = Rectangle(topLeft: ORIGIN, bottomRight: point)
print("x: \(point.x) y: \(point.y), distance from origin: \(point.getDistance(p2: ORIGIN))")
print("Area of rect \(rect) is \(rect.area).")

