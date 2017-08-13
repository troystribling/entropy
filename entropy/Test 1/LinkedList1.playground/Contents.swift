//: Playground - noun: a place where people can play

import UIKit

class LLNode {
    var value: Int
    var next: LLNode?
    init(value: Int) {
        self.value = value
    }
}

func simpleList() -> LLNode {
    let root = LLNode(value: 1)
    let n1 = LLNode(value: 2)
    let n2 = LLNode(value: 3)
    let n3 = LLNode(value: 4)
    let n4 = LLNode(value: 5)
    let n5 = LLNode(value: 6)
    root.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    n4.next = n5
    return root
}

func cyclicList() -> LLNode {
    let root = LLNode(value: 1)
    let n1 = LLNode(value: 2)
    let n2 = LLNode(value: 3)
    let n3 = LLNode(value: 4)
    let n4 = LLNode(value: 5)
    let n5 = LLNode(value: 6)
    root.next = n1
    n1.next = n2
    n2.next = root
    n3.next = n4
    n4.next = n1
    n5.next = root
    return root
}

func lhsList() -> LLNode {
    let n1 = LLNode(value: 9)
    let n2 = LLNode(value: 8)
    let n3 = LLNode(value: 9)
    n1.next = n2
    n2.next = n3
    return n1
}

func rhsList() -> LLNode {
    let n1 = LLNode(value: 1)
    let n2 = LLNode(value: 2)
    n1.next = n2
    return n1
}
