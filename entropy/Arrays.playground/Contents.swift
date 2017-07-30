//: Playground - noun: a place where people can play

import Foundation
import entropy

// Reverse array in place
var testArray = [1,2,3,4,5]
testArray.reverseInPlace()
testArray

// Return reversed arry
testArray = [1,2,3,4,5, 6]
testArray.reverseCopy()

// BInary Search
testArray = [1,2,3,4,5, 6]
binarySearch(array: testArray, value: 1)
binarySearch(array: testArray, value: 10)
binarySearch(array: testArray, value: 6)


