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

public func closureValidator(string: String) -> Bool {
    var openClosures = [Character]()

    let testClosure: (String) -> Bool = { closure in
        let lastOpen = openClosures.removeLast()
        return String(lastOpen) != closure
    }

    for char in string.characters {
        switch char {
        case "(", "{", "[":
            openClosures.append(char)
        case ")":
            if testClosure("(") {
                return false
            }
        case "]":
            if testClosure("[") {
                return false
            }
        case "}":
            if testClosure("{") {
                return false
            }
        default:
            break
        }
    }
    return true
}

public func swap(string: inout String, i: Int, j: Int) {
    guard let iIndex = string.index(string.startIndex, offsetBy: i, limitedBy: string.endIndex),
          let jIndex = string.index(string.startIndex, offsetBy: j, limitedBy: string.endIndex),
          i != j
    else {
        return
    }

    let iChar = string.characters[iIndex]
    let jChar = string.characters[jIndex]

    string.replaceSubrange(iIndex...iIndex, with: [jChar])
    string.replaceSubrange(jIndex...jIndex, with: [iChar])
}

public func permute(string: String, permuted: String="", results: [String] = []) -> Set<String> {
    guard string.characters.count > 0 else {
        return Set(results + [permuted])
    }
    var response = Set(results)
    for i in 0..<string.characters.count {
        let index = string.index(string.startIndex, offsetBy: i)
        let permutedUpdate = permuted + String(string.characters[index])
        var remainingString = String(string.characters[string.startIndex..<index])
        if let remaingIndex = string.index(string.startIndex, offsetBy: i+1, limitedBy: string.endIndex) {
            remainingString += String(string.characters[remaingIndex..<string.endIndex])
        }
        response = permute(string: remainingString, permuted: permutedUpdate, results: Array(response))
    }
    return Set(response)
}

public func isAnagram(string: String) -> Bool {
    var oddLetters = Set<Character>()
    for char in string.characters {
        if oddLetters.contains(char) {
            oddLetters.remove(char)
        } else {
            oddLetters.insert(char)
        }
    }
    return oddLetters.count <= 1
}

