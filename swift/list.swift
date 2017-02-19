//  Created by 정호영 on 2017. 2. 14..
//  Copyright © 2017년 watple. All rights reserved.

import Foundation

class MyNode <T> {
    var item:T
    var next:MyNode?
    
    init(_ item:T) {
        self.item = item
    }
}

let node = MyNode("hello")
print(node, node.item, node.next ?? "null")


struct MyList <T> {
    var head:MyNode<T>
    var count:Int = 0
    
    init(_ item:T) {
        self.head = MyNode(item)
    }ㅌㅂ
    
    mutating func addFirst(_ item:T) {
        let node = MyNode(item)
        node.next = self.head
        self.head = node
        self.count += 1
    }
    
}

var list = MyList(1)
list.addFirst(2)
list.addFirst(3)
print(list.head.item)
print(list.head.next!.item)
print(list.count)
