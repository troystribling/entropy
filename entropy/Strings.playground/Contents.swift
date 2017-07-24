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
reverseInPlace(string: &testString)
print(testString)

//testString = "1234\u{1f616}"
reverseInPlace(string: &testString)
print(testString)

testString = "\u{1f616}\u{1f600} test"
reverseInPlace(string: &testString)


// Replace subrange for reversed words
testString = "this is a message"
reverseInPlace(string: &testString)
let searchRange = testString.startIndex..<testString.endIndex
testString.startIndex != testString.endIndex
if let spaceRange = testString.range(of: " ", range: searchRange) {
    let wordRange = testString.startIndex..<spaceRange.lowerBound
    var reversedWord = testString[wordRange]
    reverseInPlace(string: &reversedWord)
    testString.replaceSubrange(wordRange, with: reversedWord)
}

// Reverse string words in place
testString = "this is the message received"
reverseWordsInPlace(string: &testString)

testString = "this"
reverseWordsInPlace(string: &testString)

testString = "\u{1f616}\u{1f600} is message coded"
reverseWordsInPlace(string: &testString)

testString = " this"
reverseWordsInPlace(string: &testString)

// Parenthesis closing
testString = "What (a mess (this is (Hu))) cool"
if let firstParenRange = testString.range(of: "(") {
    parentheticals(string: testString, first:
        testString.distance(from: testString.startIndex, to: firstParenRange.lowerBound))
    testString.distance(from: testString.startIndex, to: testString.range(of: ")", options: .backwards)!.lowerBound)
}

// Clouse validation
testString = "{1+[(3-1)+(4+2)]}"
closureValidator(string: testString)

testString = "{1+[(3-1+(4+2)]}"
closureValidator(string: testString)

testString = "{[]()}"
closureValidator(string: testString)

testString = "{[()]()[]}"
closureValidator(string: testString)

testString = "{[[)]}"
closureValidator(string: testString)

testString = "{[}"
closureValidator(string: testString)

testString = "1"
closureValidator(string: testString)


