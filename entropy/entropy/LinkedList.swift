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

    public init(value: Int) {
        self.value = value
    }

    public static func == (lhs: LLNode, rhs: LLNode) -> Bool {
        return rhs.value == lhs.value
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

    public func reverseInPlace() {
        var previousNode: LLNode? = self
        var currentNode: LLNode? = self.next
        while currentNode != nil {
            let nextNode = currentNode?.next
            currentNode?.next = previousNode
            previousNode = currentNode
            currentNode = nextNode
        }
    }
}


