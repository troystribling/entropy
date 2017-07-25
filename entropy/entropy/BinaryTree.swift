//
//  BinaryTree.swift
//  entropy
//
//  Created by Troy Stribling on 7/22/17.
//  Copyright © 2017 Troy Stribling. All rights reserved.
//

import Foundation

public class BSTNode : CustomStringConvertible {

    fileprivate var value: Int
    public var left: BSTNode?
    public var right: BSTNode?

    internal init(value: Int) {
        self.value = value
    }

    public var description: String {
        return "\(value)"
    }

    public func isBST(node: BSTNode?, previous: BSTNode? = nil) -> Bool {
        // node is leaf since it has no left or right
        guard let node = node else {
            return true
        }
        // Back track from left node
        guard isBST(node: left, previous: previous) else {
            return false
        }
        // Should not happen
        guard let previous = previous else {
            return false
        }
        // Node is left of previous
        if previous.value > node.value {
            return false
        }
        return isBST(node: right, previous: node)
    }

    public func printInOrder(node: BSTNode?, previous: BSTNode?) {
        // node is leaf since it has no left or right
        guard let node = node else {
            return
        }
        // Backtrack from left node
        printInOrder(node: left, previous: previous)
        print("value = \(value)")
        printInOrder(node: right, previous: node)
    }
}

