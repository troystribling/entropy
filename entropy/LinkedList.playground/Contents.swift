//: Playground - noun: a place where people can play

import UIKit
import entropy

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

// Print lists
print("Print LL")
var simple = simpleList()
simple.printInOrder()

// Find node with value
print("\nFind Node")
simple = simpleList()
var nodeWithValue = simple.find(value: 4)
print("found node=\(String(describing: nodeWithValue?.value)), \(String(describing: nodeWithValue?.next))")

// Delete node
print("\nDelete LL node with Value")
simple = simpleList()
let newHead = simple.delete(value: 2)
newHead?.printInOrder()

print("\nDelete LL node with node")
simple = simpleList()
nodeWithValue = simple.find(value: 5)
simple.delete(node: nodeWithValue)
simple.printInOrder()

// Detect Cycle
simple = simpleList()
var cyclic = cyclicList()
simple.isCyclic()
cyclic.isCyclic()
cyclic.isCyclic2()

// Reverse List
print("\nReverse LL")
simple = simpleList()
simple.reverse().printInOrder()

print("\nReverse In Place LL")
simple.reverseInPlace()
simple.printInOrder()



