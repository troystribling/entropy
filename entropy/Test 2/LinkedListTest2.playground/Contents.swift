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
        var currentNode: LLNode? = self
        while currentNode != nil {
            print(String(describing: currentNode))
            currentNode = currentNode?.next
        }
    }

    func tail() -> LLNode? {
        var currentNode: LLNode? = self
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        return currentNode
    }

    func find(value: Int) -> LLNode? {
        var currentNode: LLNode? = self
        while currentNode != nil {
            if currentNode?.value == value {
                return currentNode
            }
            currentNode = currentNode?.next
        }
        return nil
    }

    func delete(value: Int) -> LLNode? {
        guard self.value != value else {
            return next
        }
        var currentNode: LLNode? = next
        var previousNode: LLNode?
        while currentNode != nil {
            if currentNode?.value == value {
                previousNode?.next = currentNode?.next
                break
            }
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        return self
    }

    func delete(node: LLNode) {
        guard let nextNode = node.next else {
            return
        }
        node.value = nextNode.value
        node.next = nextNode.next
    }

    func isCyclic() -> Bool {
        var slowReference: LLNode? = self
        var fastReference = next?.next
        while fastReference != nil {
            if fastReference === slowReference {
                return true
            }
            slowReference = slowReference?.next
            fastReference = fastReference?.next?.next
        }
        return false
    }

    func reverse() -> LLNode {
        var reversedNode = LLNode(value: value)
        var currentNode = next
        while currentNode != nil {
            let newNode = LLNode(value: currentNode!.value)
            newNode.next = reversedNode
            reversedNode = newNode
            currentNode = currentNode?.next
        }
        return reversedNode
    }

    func reverseInPlace() -> LLNode? {
        var currentNode: LLNode? = self
        var previousNode: LLNode?
        while currentNode != nil {
            let nextNode = currentNode?.next
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
        }
        return previousNode
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
print(String(describing: list.tail()))
print(String(describing: small.tail()))

// return node with value
print("\nLL with value")
print(String(describing: list.find(value: 3)))
print(String(describing: list.find(value: 10)))

// delete node
print("\nLL delete node with value")
var newList = list.delete(value: 3)
newList?.printInOrder()
newList = list.delete(value: 10)
print("\n")
newList?.printInOrder()
newList = small.delete(value: 1)
print("\n")
newList = list.delete(value: 1)
newList?.printInOrder()
print("\n")
newList = list.delete(value: 6)
newList?.printInOrder()
print("\n")
print(String(describing: newList))

list = simpleList()

print("\nLL delete node")
let deleteNode = list.find(value: 4)
list.delete(node: deleteNode!)
list.printInOrder()

// reverse
print("\nLL reverse")
var reversedList = list.reverse()
reversedList.printInOrder()
print("\n")
reversedList = small.reverse()
reversedList.printInOrder()

print("\nLL reverse in place")
list.reverseInPlace()?.printInOrder()
print("\n")
small.reverseInPlace()?.printInOrder()

list = simpleList()

// cyclic test
print("\nLL cyclic test")
print(cyclic.isCyclic())
print(list.isCyclic())

// LL adding machine
print("\nLL add nodes")

