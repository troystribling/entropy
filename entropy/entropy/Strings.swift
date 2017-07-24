//
//  Strings.swift
//  entropy
//
//  Created by Troy Stribling on 7/23/17.
//  Copyright © 2017 Troy Stribling. All rights reserved.
//

import Foundation

public func reverseInPlace(string: inout String) {
    reverseInPlace(string: &string, start: 0, end: string.characters.count)
}

public func reverseInPlace(string: inout String, start: Int, end: Int) {
    let mid = (end - start)/2
    for offset in 0..<mid {
        let startIndex = string.index(string.startIndex, offsetBy: start)
        var endIndex = string.index(string.startIndex, offsetBy: end)
        let lowIndex = string.index(startIndex, offsetBy: offset)
        var hiIndex = string.index(endIndex, offsetBy: -offset - 1)
        let lowCharacter = string.characters[lowIndex]
        let hiCharacter = string.characters[hiIndex]
        string.replaceSubrange(lowIndex...lowIndex, with: String(hiCharacter))
        endIndex = string.index(string.startIndex, offsetBy: end)
        hiIndex = string.index(endIndex, offsetBy: -offset - 1)
        string.replaceSubrange(hiIndex...hiIndex, with: String(lowCharacter))
    }
}

public func reverseWordsInPlace(string: inout String) {
    reverseInPlace(string: &string)
    let length = string.characters.count
    var wordStartIndex = string.startIndex
    for i in 0...length {
        let currentIndex = string.index(string.startIndex, offsetBy: i)
        if i == length || string.characters[currentIndex] == " " {
            let start = string.distance(from: string.startIndex, to: wordStartIndex)
            let end = string.distance(from: string.startIndex, to: currentIndex)
            reverseInPlace(string: &string, start: start, end: end)
            wordStartIndex = string.index(currentIndex, offsetBy: 1, limitedBy: string.endIndex) ?? string.endIndex
        }
    }
}

public func parentheticals(string: String, first: Int) -> Int {
    var parenCount = 0
    var closingParen = -1
    for i in first..<string.characters.count {
        let stringIndex = string.index(string.startIndex, offsetBy: i)
        let char = string.characters[stringIndex]
        if char == "(" {
            parenCount += 1
        } else if char == ")" {
            parenCount -= 1
        }
        if parenCount == 0 {
            closingParen = i
            break
        }
    }
    return closingParen
}
