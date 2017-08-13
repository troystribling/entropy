//: Playground - noun: a place where people can play

import UIKit

func swap(string: inout String, i: Int, j: Int) {
}

func reverseInPlace(string: inout String) {
}

func reverseInPlace(string: inout String, lo: Int, hi: Int) {
}

func reverseWordsInPlace(string: inout String) {

}

func paraentheticals(string: String, first: Int) -> Int {
    return 0
}

func closureValidator(string: String) -> Bool {
    return false
}

func isAnagram(string: inout String) -> Bool {
    return false
}

func permutations(string: String, permuted: String="", results: [String] = []) -> Set<String> {
    return ["a"]
}

extension String {

    func isSubsequence(subSequence: String) -> Bool {
        return false
    }

    func isSubstring(substring: String) -> Bool {
        return false
    }
}

var testString = "1234\u{1f616}"

// Replace string
testString.characters.count

// Reverse string inplace
testString = "123456"

testString = "\u{1f616}\u{1f600} test"

// Replace subrange for reversed words
testString = "this is a message"

// Reverse string words in place
testString = "this is the message received"

testString = "this"

testString = "\u{1f616}\u{1f600} is message coded"

testString = " this"

// Parenthesis closing
testString = "What (a mess (this is (Hu))) cool"

// Clouser validation
testString = "{1+[(3-1)+(4+2)]}"

testString = "{1+[(3-1+(4+2)]}"

testString = "{[]()}"

testString = "{[()]()[]}"

testString = "{[[)]}"

testString = "{[}"

testString = "1"

// Swap two characters in string
testString = "abcde"

// String permutations
testString = "abc"

// Anagrams
testString = "civic"

testString = "viicc"

testString = "lost"

testString = "lool"

// has substring
"This is a test string".isSubsequence(subSequence: "isstring")
"This is a test string".isSubsequence(subSequence: "zip")

"zip".isSubsequence(subSequence: "zip")

"This is a test string".isSubstring(substring: "isstring")
"This is a test string".isSubstring(substring: "is")
