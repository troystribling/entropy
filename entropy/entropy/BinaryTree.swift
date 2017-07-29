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

    public func printIterative() {
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

    public func printIterativeInOrder() {
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
        let tmpLeft = node.left
        node.left = reverse(node: node.right)
        node.right = reverse(node: tmpLeft)
        return node
    }

    public func maxHeight() -> Int {
        return maxHeight(node: self)
    }

    public func maxHeight(node: BTNode?) -> Int {
        guard let node = node else {
            return 0
        }
        let leftHeight = maxHeight(node: node.left)
        let rightHeight = maxHeight(node: node.right)
        return (leftHeight > rightHeight ? leftHeight : rightHeight) + 1
    }

    public func minHeight() -> Int{
        return minHeight(node: self)
    }

    public func minHeight(node: BTNode?) -> Int {
        guard let node = node else {
            return 0
        }
        let leftHeight = minHeight(node: node.left)
        let rightHeight = minHeight(node: node.right)
        if leftHeight == 0 {
            return rightHeight + 1
        }
        if rightHeight == 0 {
            return leftHeight + 1
        }
        return (leftHeight < rightHeight ? leftHeight : rightHeight) + 1
    }

    public func isBalanced() -> Bool {
        return isBalanced(node: self)
    }

    public func isBalanced(node: BTNode?) -> Bool {
        guard let node = node else {
            return true
        }
        let leftHeight = maxHeight(node: node.left)
        let rightHeight = maxHeight(node: node.right)
        if abs(leftHeight - rightHeight) > 1 {
            return false
        }
        let leftBalanced = isBalanced(node: node.left)
        let rightBalanced = isBalanced(node: node.right)
        if  leftBalanced && rightBalanced {
            return true
        }
        return false
    }

    public func printBreadth() {
        printBreadth(nodes: [self])
    }

    public func printBreadth(nodes: [BTNode]) {
        guard nodes.count > 0 else {
            return
        }
        var children = [BTNode]()
        for node in nodes {
            print("node=\(node.value)")
            if let left = node.left {
                children.append(left)
            }
            if let right = node.right {
                children.append(right)
            }
        }
        printBreadth(nodes: children)
    }

    public func printRows() {
        printRows(nodes: [self])
    }

    public func printRows(nodes: [BTNode]) {
        guard nodes.count > 0 else {
            return
        }
        var children = [BTNode]()
        let values = nodes.map { String($0.value) }.joined(separator: ",")
        print(values)
        for node in nodes {
            if let left = node.left {
                children.append(left)
            }
            if let right = node.right {
                children.append(right)
            }
        }
        printRows(nodes: children)
    }

    public func printIterativeRows() {
        var nodes = [BTNode]()
        nodes.append(self)
        while nodes.count > 0 {
            let values = nodes.map { String($0.value) }.joined(separator: ",")
            print(values)
            let count = nodes.count
            for _ in 0..<count {
                let node = nodes.removeFirst()
                if let left = node.left {
                    nodes.append(left)
                }
                if let right = node.right {
                    nodes.append(right)
                }
            }
        }
    }

    public func isSymetric() -> Bool {
        return isSymetric(node1: self.right, node2: self.left)
    }

    public func isSymetric(node1: BTNode?, node2: BTNode?) -> Bool {
        if node1 == nil || node2 == nil {
            return true
        }
        if node1 == nil || node2 == nil {
            return false
        }
        if node1?.value == node2?.value {
            return isSymetric(node1: node1?.left, node2: node2?.right) && isSymetric(node1: node1?.right, node2: node2?.left)
        }
        return false
    }
}

