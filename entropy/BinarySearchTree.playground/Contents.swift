//: Playground - noun: a place where people can play

import UIKit
import entropy

// Balanced BST
func bst() -> BTNode {
    let bstRoot = BTNode(value: 12)
    let bst1 = BTNode(value: 8)
    let bst2 = BTNode(value: 5)
    let bst3 = BTNode(value: 4)
    let bst4 = BTNode(value: 11)
    let bst5 = BTNode(value: 18)
    let bst6 = BTNode(value: 17)
    bstRoot.left = bst1
    bst1.left = bst2
    bst2.left = bst3
    bst1.right = bst4
    bstRoot.right = bst5
    bst5.left = bst6
    return bstRoot
}

// Binary tree
func bt() -> BTNode {
    let btRoot = BTNode(value: 1)
    let bt1 = BTNode(value: 3)
    let bt2 = BTNode(value: 7)
    let bt3 = BTNode(value: 9)
    let bt4 = BTNode(value: 10)
    let bt5 = BTNode(value: 20)
    let bt6 = BTNode(value: 16)
    btRoot.left = bt1
    bt1.left = bt2
    bt2.left = bt3
    bt1.right = bt4
    btRoot.right = bt5
    bt5.right = bt6
    return btRoot
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
bstRoot.printStack()
print("\nBST print Stack In Order")
bstRoot.printStackInOrder()
