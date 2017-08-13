//: Playground - noun: a place where people can play

import UIKit

extension Array {

    mutating func reverseinPlace() {

    }

    mutating func reverseInPlace(lo: Int, hi: Int) {

    }

    func reverseCopy() -> Array {
        return self
    }

    func extema(by: (Element, Element) -> Bool) -> Element? {
        return nil
    }

    mutating func rotate(pivot: Int) {
    }

    mutating func rotateBetter(pivot: Int) {
    }
}

func binarySearch<T>(array: [T], value: T) -> Int? where T: Comparable {
    return binarySearch(array: array, value: value, lo: 0, hi: array.count - 1)
}

func binarySearch<T>(array: [T], value: T, lo: Int, hi: Int) -> Int? where T: Comparable {
    return nil
}

func merge<T>(array1: [T], array2: [T]) -> [T] where T: Comparable {
    return array1
}

// Reverse array in place
var testArray = [1,2,3,4,5]

// Return reversed arry
testArray = [1,2,3,4,5,6]

// Reverse range in place
testArray = [1,2,3,4,5,6]

// extrema

// Binary Search
testArray = [1,2,3,4,5, 6]

// Merge sorted arrays
testArray = [2,4,6,8,10,12,14]

// Rotate array
testArray = [1,2,3,4,5, 6]

testArray = [1,2,3,4,5, 6]

testArray = [1,2,3,4,5, 6]

testArray = [1,2,3,4,5, 6]

testArray = [1,2,3,4,5, 6]

testArray = [1,2,3,4,5, 6]
