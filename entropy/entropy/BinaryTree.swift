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

    public func printStack() {
        var nodes = [BTNode]()
        nodes.append(self)
        while nodes.count > 0 {
            let node = nodes.removeFirst()
            if let rightNode = node.right {
                nodes.insert(rightNode, at: 0)
            }
            if let leftNode = node.left {
                nodes.insert(leftNode, at: 0)
            }
            print("node=\(node.value)")
        }
    }

    public func printStackInOrder() {
        var nodes = [BTNode]()
        var currentNode: BTNode? = self
        while nodes.count > 0 || currentNode != nil {
            if currentNode != nil {
                nodes.insert(currentNode!, at: 0)
                currentNode = currentNode?.left
            } else {
                let node = nodes.removeFirst()
                currentNode = node.right
                print("node = \(node)")
            }
        }
    }

    public func reverse() {
        _ = reverse(node: self)
    }

    public func reverse(node: BTNode?) -> BTNode? {
        guard let node = node else {
            return nil
        }
        print("INPUT: node=\(node.value), left=\(String(describing: node.left?.value)), right=\(String(describing: node.right?.value))")
        let tmpLeft = node.left
        node.left = reverse(node: node.right)
        node.right = reverse(node: tmpLeft)
        print("OUTPUT: node=\(node.value), left=\(String(describing: node.left?.value)), right=\(String(describing: node.right?.value))")
        return node
    }

    public func height() -> Int {
        return height(node: self)
    }

    public func height(node: BTNode?) -> Int {
        guard let node = node else {
            return 0
        }
        let leftHeight = height(node: node.left)
        let rightHeight = height(node: node.right)
        return leftHeight < rightHeight ? leftHeight : rightHeight
    }

    public func printRows() {
        printRows(node: self, rows: [])
    }

    public func printRows(node: BTNode?, rows: [BTNode]) {
        
    }
}

