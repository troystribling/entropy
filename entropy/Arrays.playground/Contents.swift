//: Playground - noun: a place where people can play

import Foundation
import entropy

// Reverse array in place
var testArray = [1,2,3,4,5]
testArray.reverseInPlace()
testArray

// Return reversed arry
testArray = [1,2,3,4,5,6]
testArray.reverseCopy()

// Reverse range in place
testArray = [1,2,3,4,5,6]
testArray.reverseInPlace(lo: 1, hi: 4)

// Binary Search
testArray = [1,2,3,4,5, 6]
binarySearch(array: testArray, value: 1)
binarySearch(array: testArray, value: 10)
binarySearch(array: testArray, value: 6)

// Merge sorted arrays
testArray = [2,4,6,8,10,12,14]
var testArray2 = [1,3,5,7,9]
merge(array1: testArray, array2: testArray2)

// Rotate array
testArray = [1,2,3,4,5, 6]
rotate(array: &testArray, pivot: 2)
testArray = [1,2,3,4,5, 6]
rotate(array: &testArray, pivot: 1)
testArray = [1,2,3,4,5, 6]
rotate(array: &testArray, pivot: 5)

testArray = [1,2,3,4,5, 6]
rotate2(array: &testArray, pivot: 2)
testArray = [1,2,3,4,5, 6]
rotate2(array: &testArray, pivot: 1)
testArray = [1,2,3,4,5, 6]
rotate2(array: &testArray, pivot: 5)

// has substring
"This is a test string".isSubsequence(subSequence: "isstring")
"This is a test string".isSubsequence(subSequence: "zip")

"zip".isSubsequence(subSequence: "zip")

"This is a test string".isSubstring(substring: "isstring")
"This is a test string".isSubstring(substring: "is")
