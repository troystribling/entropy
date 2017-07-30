//
//  LinkedList.swift
//  entropy
//
//  Created by Troy Stribling on 7/29/17.
//  Copyright © 2017 Troy Stribling. All rights reserved.
//

import Foundation

public class LLNode: CustomStringConvertible, Hashable {

    public var value: Int
    public var next: LLNode?
    public var previous: LLNode?

    public var description: String {
        return String(value)
    }

    public var hashValue: Int {
        return Int(arc4random())
    }

    public init(value: Int = 0) {
        self.value = value
    }

    public static func == (lhs: LLNode, rhs: LLNode) -> Bool {
        return rhs.value == lhs.value
    }

    public func tail() -> LLNode? {
        guard self.next != nil else {
            return self
        }
        var currentNode: LLNode? = self
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        return currentNode
    }

    public func printInOrder() {
        var node: LLNode? = self
        while node != nil {
            print("value = \(String(describing: node))")
            node = node?.next
        }
    }

    public func find(value: Int) -> LLNode? {
        var currentNode: LLNode? = self
        while currentNode != nil {
            if currentNode?.value == value {
                return currentNode
            }
            currentNode = currentNode?.next
        }
        return nil
    }

    public func delete(value: Int) -> LLNode? {
        guard self.value != value else {
            let newHead = self.next
            self.next = nil
            return newHead

        }
        var current: LLNode? = self
        var previous: LLNode?
        while current != nil {
            if current?.value == value {
                previous?.next = current?.next
                current?.next = nil
                return self
            }
            previous = current
            current = previous?.next
        }
        return self
    }

    public func delete(node: LLNode?) -> LLNode? {
        guard let node = node, let nextNode = node.next else {
            return nil
        }
        node.value = nextNode.value
        node.next = nextNode.next
        return node
    }

    public func isCyclic() -> Bool {
        var previousNextNodes = Set<LLNode>()
        var node: LLNode? = self
        while node != nil {
            guard let next = node?.next else {
                break
            }
            if previousNextNodes.contains(next) {
                return true
            }
            previousNextNodes.insert(next)
            node = next
        }
        return false
    }

    public func isCyclic2() -> Bool {
        var slowRunner = self
        var fastRunner = self

        while let nextSlowRunner = slowRunner.next, let nextFastRunner = fastRunner.next?.next {
            slowRunner = nextSlowRunner
            fastRunner = nextFastRunner
            if slowRunner === fastRunner {
                return true
            }
        }

        return false
    }

    public func reverse() -> LLNode {
        var reversedNode = LLNode(value: value)
        var currentNode: LLNode? = self
        while let nextNode = currentNode?.next {
            let newNode = LLNode(value: nextNode.value)
            newNode.next = reversedNode
            reversedNode = newNode
            currentNode = nextNode
        }
        return reversedNode
    }

    public func reverseInPlace() -> LLNode? {
        var previousNode: LLNode?
        var currentNode: LLNode? = self
        while currentNode != nil {
            let nextNode = currentNode?.next
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
        }
        return previousNode
    }
}

public func addLL(lhs: LLNode, rhs: LLNode) -> LLNode {
    let firstTotalSum = lhs.value + rhs.value
    let firstSum = firstTotalSum % 10
    var sumCarry = firstTotalSum / 10
    let sumRootNode: LLNode = LLNode(value: firstSum)
    var sumNextNode: LLNode? = sumRootNode
    var lhsNextNode = lhs.next
    var rhsNextNode = rhs.next
    while lhsNextNode != nil || rhsNextNode != nil || sumCarry > 0 {
        let lhsValue = lhsNextNode?.value ?? 0
        let rhsValue = rhsNextNode?.value ?? 0
        let totalSum = lhsValue + rhsValue + sumCarry
        let sum = totalSum % 10
        sumCarry = totalSum / 10
        sumNextNode?.next = LLNode(value: sum)
        sumNextNode = sumNextNode?.next
        lhsNextNode = lhsNextNode?.next
        rhsNextNode = rhsNextNode?.next
    }
    return sumRootNode
}


