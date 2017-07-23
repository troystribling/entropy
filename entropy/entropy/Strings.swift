//
//  Strings.swift
//  entropy
//
//  Created by Troy Stribling on 7/23/17.
//  Copyright © 2017 Troy Stribling. All rights reserved.
//

import Foundation

extension String {

    public mutating func reverseInPlace() {
        let mid = characters.count/2
        for offset in 0..<mid {
            let lowIndex = index(startIndex, offsetBy: offset)
            var hiIndex = index(endIndex, offsetBy: -offset - 1)
            let lowCharacter = characters[lowIndex]
            let hiCharacter = characters[hiIndex]
            replaceSubrange(lowIndex...lowIndex, with: String(hiCharacter))
            hiIndex = index(endIndex, offsetBy: -offset - 1)
            replaceSubrange(hiIndex...hiIndex, with: String(lowCharacter))
        }
    }

    public mutating func reverseWordsInPlace() {
        reverseInPlace()
        var searchIndex = startIndex
        while true {
            let searchRange = searchIndex..<endIndex
            if let spaceRange = range(of: " ", range: searchRange) {
                let wordRange = searchIndex..<spaceRange.lowerBound
                var reversedWord = self[wordRange]
                reversedWord.reverseInPlace()
                replaceSubrange(wordRange, with: reversedWord)
                searchIndex = spaceRange.upperBound
            } else {
                var reversedWord = self[searchRange]
                reversedWord.reverseInPlace()
                replaceSubrange(searchRange, with: reversedWord)
                break
            }
        }
    }

}
