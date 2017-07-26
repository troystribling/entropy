//: Playground - noun: a place where people can play

import UIKit
import entropy

// Balanced BST
var bstRoot = BTNode(value: 12)
var bst1 = BTNode(value: 8)
var bst2 = BTNode(value: 5)
var bst3 = BTNode(value: 4)
var bst4 = BTNode(value: 11)
var bst5 = BTNode(value: 18)
var bst6 = BTNode(value: 17)
bstRoot.left = bst1
bst1.left = bst2
bst2.left = bst3
bst1.right = bst4
bstRoot.right = bst5
bst5.left = bst6

// Binary tress
var btRoot = BTNode(value: 1)
var bt1 = BTNode(value: 3)
var bt2 = BTNode(value: 7)
var bt3 = BTNode(value: 9)
var bt4 = BTNode(value: 10)
var bt5 = BTNode(value: 20)
var bt6 = BTNode(value: 16)
btRoot.left = bt1
bt1.left = bt2
bt2.left = bt3
bt1.right = bt4
btRoot.right = bt5
bt5.right = bt6

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
