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
