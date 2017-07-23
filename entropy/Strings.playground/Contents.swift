//: Playground - noun: a place where people can play

import UIKit
import entropy

var testString = "1234\u{1f616}"

// Replace string
testString.characters.count
let strIndex = testString.index(testString.endIndex, offsetBy: -2)
testString.replaceSubrange(strIndex...strIndex, with: "\u{1f600}")
testString.characters.count
print(testString)

// Reverse string inplace
testString = "123456"
testString.reverseInPlace()
print(testString)

testString = "1234\u{1f616}"
testString.reverseInPlace()
print(testString)

// Replace subrange for reversed words
testString = "this is a message"
testString.reverseInPlace()
let searchRange = testString.startIndex..<testString.endIndex
testString.startIndex != testString.endIndex
if let spaceRange = testString.range(of: " ", range: searchRange) {
    let wordRange = testString.startIndex..<spaceRange.lowerBound
    var reversedWord = testString[wordRange]
    reversedWord.reverseInPlace()
    testString.replaceSubrange(wordRange, with: reversedWord)
}

// Reverse string words in place
testString = "this is the message received"
testString.reverseWordsInPlace()
