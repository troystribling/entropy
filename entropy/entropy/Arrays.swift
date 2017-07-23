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

}
