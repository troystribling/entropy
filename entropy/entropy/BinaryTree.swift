//
//  BinaryTree.swift
//  entropy
//
//  Created by Troy Stribling on 7/22/17.
//  Copyright © 2017 Troy Stribling. All rights reserved.
//

import Foundation

public class BTNode : CustomStringConvertible {

    public var value: Int
    public var left: BTNode?
    public var right: BTNode?

    public init(value: Int) {
        self.value = value
    }

    public var description: String {
        return "\(value)"
    }

    public func isBST() -> Bool {
        return isBST(node: self, minValue: Int.min, maxValue: Int.max)
    }

    public func isBST(node: BTNode?, minValue: Int, maxValue: Int) -> Bool {
        // node has no right or left
        guard let node = node else {
            return true
        }
        print("node=\(node), maxValue=\(maxValue), minValue=\(minValue)")
        if node.value >= maxValue || node.value <= minValue {
            return false
        }
        return isBST(node: node.left, minValue: minValue, maxValue: node.value) &&
               isBST(node: node.right, minValue: node.value, maxValue: maxValue)
    }

    public func printInOrder() {
        printInOrder(node: self)
    }

    public func printInOrder(node: BTNode?) {
        guard let node = node else {
            return
        }
        printInOrder(node: node.left)
        print("value = \(node.value)")
        printInOrder(node: node.right)
    }
}

