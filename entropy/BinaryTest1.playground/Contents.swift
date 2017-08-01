//: Playground - noun: a place where people can play

import UIKit

class BTNode: CustomStringConvertible {
    var value: Int
    var left: BTNode?
    var right: BTNode?
    init(value: Int) {
        self.value = value
    }

    var description: String {
        return String(value)
    }

    func printInOrder() {
        printInOrder(node: self)
    }

    func printInOrder(node: BTNode?) {
        guard let node = node else {
            return
        }
        printInOrder(node: node.left)
        print(node)
        printInOrder(node: node.right)
    }

    func printInOrderIterative() {
        var nodes = [BTNode]()
        var currentNode: BTNode? = self
        while !nodes.isEmpty || currentNode != nil {
            if currentNode != nil {
                nodes.append(currentNode!)
                currentNode = currentNode?.left
            } else {
                let node = nodes.removeLast()
                currentNode = node.right
                print(node)
            }
        }
    }

    func printRows() {
        printRows(nodes: [self])
    }

    func printRows(nodes: [BTNode]) {
        guard !nodes.isEmpty else {
            return
        }
        var children = [BTNode]()
        let row = nodes.map { String($0.value) }.joined(separator: ",")
        print(row)
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

    func printRowsInterative() {
        var nodes = [BTNode]()
        nodes.append(self)
        while !nodes.isEmpty {
            let row = nodes.map { String($0.value) }.joined(separator: ",")
            print(row)
            let count = nodes.count
            for _ in (0..<count) {
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

    func isBST() -> Bool {
        return isBST(node: self, max: Int.max, min: Int.min)
    }
    func isBST(node: BTNode?, max: Int, min: Int) -> Bool {
        guard let node = node else {
            return true
        }
        if node.value < max && node.value > min {
            return isBST(node: node.left, max: node.value, min: min) &&
                   isBST(node: node.right, max: max, min: node.value)
        }
        return false
    }

    func reverse() {
        _ = reverse(node: self)
    }
    func reverse(node: BTNode?) -> BTNode? {
        guard let node = node else {
            return nil
        }
        let tmpLeft = node.left
        node.left = reverse(node: node.right)
        node.right = reverse(node: tmpLeft)
        return node
    }

    func maxHeight() -> Int {
        return maxHeight(node: self)
    }
    func maxHeight(node: BTNode?) -> Int {
        guard let node = node else {
            return 0
        }
        let leftHeight = maxHeight(node: node.left)
        let rightHeight = maxHeight(node: node.right)
        return max(leftHeight, rightHeight) + 1
    }

    func minHeight() -> Int {
        return minHeight(node: self)
    }
    func minHeight(node: BTNode?) -> Int {
        guard let node = node else {
            return 0
        }
        let leftHeight = minHeight(node: node.left)
        if leftHeight == 0 {
            return minHeight(node: node.right) + 1
        }
        let rightHeight = minHeight(node: node.right)
        if rightHeight == 0 {
            return minHeight(node: node.left) + 1
        }
        return min(leftHeight, rightHeight) + 1
    }

}

func bst() -> BTNode {
    let root = BTNode(value: 12)
    let bst1 = BTNode(value: 8)
    let bst2 = BTNode(value: 5)
    let bst3 = BTNode(value: 4)
    let bst4 = BTNode(value: 11)
    let bst5 = BTNode(value: 18)
    let bst6 = BTNode(value: 17)
    root.left = bst1
    bst1.left = bst2
    bst2.left = bst3
    bst1.right = bst4
    root.right = bst5
    bst5.left = bst6
    return root
}

// Binary Tree
func bt() -> BTNode {
    let root = BTNode(value: 1)
    let bt1 = BTNode(value: 3)
    let bt2 = BTNode(value: 7)
    let bt3 = BTNode(value: 9)
    let bt4 = BTNode(value: 10)
    let bt5 = BTNode(value: 20)
    let bt6 = BTNode(value: 16)
    let bt7 = BTNode(value: 11)
    root.left = bt1
    bt1.left = bt2
    bt2.left = bt3
    bt3.right = bt7
    bt1.right = bt4
    root.right = bt5
    bt5.right = bt6
    return root
}

// Symetric Binary Tree
func symetric() -> BTNode {
    let root = BTNode(value: 1)
    let bt1 = BTNode(value: 2)
    let bt2 = BTNode(value: 4)
    let bt3 = BTNode(value: 5)
    let bt4 = BTNode(value: 2)
    let bt5 = BTNode(value: 5)
    let bt6 = BTNode(value: 4)
    root.left = bt1
    bt1.left = bt2
    bt1.right = bt3
    root.right = bt4
    bt4.left = bt5
    bt4.right = bt6
    return root
}

var bstRoot = bst()
var btRoot = bt()
var symetricRoot = symetric()

print("Print In Order")
bstRoot.printInOrder()

print("\nPrint In Order Iterative")
bstRoot.printInOrderIterative()

print("\nPrint Rows")
bstRoot.printRows()

print("\nPrint Rows Interative")
bstRoot.printRowsInterative()

print("\nIsBST")
print(bstRoot.isBST())
print(btRoot.isBST())

print("\nReverse")
print("Initial")
bstRoot.printInOrder()
print("Final")
bstRoot.reverse()
bstRoot.printInOrder()

print("\nMax Height")
print(bstRoot.maxHeight())
print(btRoot.maxHeight())
print(symetricRoot.maxHeight())

print("\nMin Height")
print(bstRoot.minHeight())
print(btRoot.minHeight())
print(symetricRoot.minHeight())

