//
//  Arrays.swift
//  entropy
//
//  Created by Troy Stribling on 7/22/17.
//  Copyright © 2017 Troy Stribling. All rights reserved.
//

import Foundation
    
extension Array {

    public mutating func reverseInPlace() {
        let size = count
        let mid = size / 2
        for i in 0..<mid {
            let low = self[i]
            let hi = self[size - 1 - i]
            self[i] = hi
            self[size - 1 - i] = low
        }

    }

    public mutating func reverseInPlace(lo: Int, hi: Int) {
        let width = hi - lo
        guard width > 0 && width < count else {
            return
        }
        let mid = width / 2
        for i in (0..<mid) {
            let i1 = i + lo
            let i2 = hi - i
            let tmp = self[i1]
            self[i1] = self[i2]
            self[i2] = tmp
        }
    }

    public func reverseCopy() -> Array {
        var upper = count - 1
        var lower = 0
        var result = Array(repeating: self[1], count: count)
        while lower < upper {
            result[upper] = self[lower]
            result[lower] = self[upper]
            lower += 1
            upper -= 1
        }
        return result
    }

}

public func binarySearch<T>(array: [T], value: T) -> Int? where T: Comparable {
    return binarySearch(array: array, value: value, start: 0, end: array.count-1)
}

func binarySearch<T>(array: [T], value: T, start: Int, end: Int) -> Int? where T: Comparable {
    let midIndex = start + (end - start) / 2
    guard midIndex < array.count else {
        return nil
    }
    guard array[midIndex] != value else {
        return midIndex
    }
    if array[midIndex] > value {
        return binarySearch(array: array, value: value, start: start, end: midIndex - 1)
    }
    if array[midIndex] < value {
        return binarySearch(array: array, value: value, start: midIndex + 1, end: end)
    }
    return nil
}

public func merge<T>(array1: [T], array2: [T]) -> [T] where T: Comparable {
    let mergedLength = array1.count + array2.count
    guard mergedLength > 0 else {
        return []
    }
    var mergedArray = [T](repeating: array1[0], count: mergedLength)
    var i1 = 0, i2 = 0
    for i in (0..<mergedLength) {
        if i1 >= array1.count {
            mergedArray[i] = array2[i2]
            i2 += 1
        } else if i2 >= array2.count {
            mergedArray[i] = array1[i1]
            i1 += 1
        } else if array1[i1] <= array2[i2] {
            mergedArray[i] = array1[i1]
            i1 += 1
        } else {
            mergedArray[i] = array2[i2]
            i2 += 1
        }
    }
    return mergedArray
}

public func rotate<T>(array: inout [T], pivot: Int) {
    let length = array.count
    guard pivot <= length  else {
        return
    }
    let tmp = array[0..<pivot]
    for i in (pivot..<length) {
        array[i - pivot] = array[i]
    }
    for i in (0..<pivot) {
        array[length - pivot + i] = tmp[i]
    }
}

public func rotate2<T>(array: inout [T], pivot: Int) {
    array.reverseInPlace()
    array.reverseInPlace(lo: 0, hi: array.count - pivot - 1)
    array.reverseInPlace(lo: array.count - pivot, hi: array.count - 1)
}

