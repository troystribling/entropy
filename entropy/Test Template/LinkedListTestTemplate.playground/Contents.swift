//: Playground - noun: a place where people can play

import UIKit

class LLNode: CustomStringConvertible {
    var value: Int
    var next: LLNode?

    var description: String {
        return String(value)
    }

    init(value: Int) {
        self.value = value
    }

    func printInOrder() {

    }

    func tail() -> LLNode? {
        return nil
    }

    func find(value: Int) -> LLNode? {
        return nil
    }

    func delete(value: Int) -> LLNode? {
        return nil
    }

    func delete(node: LLNode?) -> LLNode? {
        return nil
    }

    func isCyclic() -> Bool {
        return false
    }

    func isCyclicBetter() -> Bool {
        return false
    }

    func reverse() -> LLNode {
        return self
    }

    func reverseInPlace() -> LLNode? {
        return nil
    }
}

func addLL(lhs: LLNode, rhs: LLNode) -> LLNode {
    return lhs
}

// Create Linked Lists
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

func shortList() -> LLNode {
    let root = LLNode(value: 1)
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

var list = simpleList()
var small = shortList()
var cyclic = cyclicList()

// print linked list
list.printInOrder()

// return tail
print("\nLL Tail")

// return node with value
print("\nLL with value")

// delete node
print("\nLL delete node with value")

print("\nLL delete node")

// reverse
print("\nLL reverse")

print("\nLL reverse in place")

// cyclic test
print("\nLL cyclic test")

// LL adding machine
print("\nLL add nodes")

