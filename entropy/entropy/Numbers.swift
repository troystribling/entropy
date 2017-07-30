//
//  Numbers.swift
//  entropy
//
//  Created by Troy Stribling on 7/30/17.
//  Copyright © 2017 Troy Stribling. All rights reserved.
//

import Foundation

public func fibonacci(n: Int) -> Int {
    guard n > 1 else {
        return n
    }
    return fibonacci(n: n - 2) + fibonacci(n: n - 1)
}

public func fibonacciIterative(n: Int) -> Int {
    guard n > 1 else {
        return n
    }
    var previous2 = 0
    var previous1 = 1
    var currentValue = 0

    for _ in (0...n-2) {
        currentValue = previous2 + previous1
        previous2 = previous1
        previous1 = currentValue
    }
    return currentValue
}

public func fibonacciDynamic(n: Int) -> Int {
    guard n > 1 else {
        return n
    }
    var numbers = [Int](repeating: 0, count: n + 1)
    numbers[0] = 0
    numbers[1] = 1
    for i in (2...n) {
        numbers[i] = numbers[i-2] + numbers[i-1]
    }
    return numbers[n]
}



