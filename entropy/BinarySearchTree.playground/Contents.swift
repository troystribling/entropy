//: Playground - noun: a place where people can play

import UIKit
import entropy

// Balanced BST
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

// Print in order
print("BST")
bstRoot.printInOrder()
print("\nNot BST")
btRoot.printInOrder()

// Validate BST
bstRoot.isBST()
btRoot.isBST()

// Reverse BT
print("\nBT")
bstRoot.printInOrder()

print("\nReversed BT")
bstRoot.reverse()
bstRoot.printInOrder()

bstRoot = bst()
print("\nBST print Stack")
bstRoot.printIterative()
print("\nBST print Stack In Order")
bstRoot.printIterativeInOrder()

// BST Height
bstRoot.maxHeight()
bstRoot.minHeight()

// Breadth First Search
print("\nBST Breadth First")
bstRoot.printRows()

print("\nBST Iterative Breadth First")
bstRoot.printIterativeRows()

print("\nBST Breadth First")
btRoot.printBreadth()

print("\nBT Breadth First")
btRoot.printRows()

print("\nBT Iterative Breadth First")
bstRoot.printIterativeRows()

// Symetric Tree
print("\nSymetric BT")
var symmetricBT = symetric()
symmetricBT.printRows()
symmetricBT.isSymetric()
bstRoot.isSymetric()

// Ballanced Tree
bstRoot.isBalanced()
symmetricBT.isBalanced()
btRoot.isBalanced()




