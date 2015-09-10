//
//  ArrayEx.swift
//  tst
//
//  Created by Takuya Okamoto on 2015/09/09.
//  Copyright © 2015年 Uniface. All rights reserved.
//

import Foundation

extension Array {
    mutating func removeRandom() -> Element {
        return self.removeAtIndex(Int(arc4random_uniform(UInt32(self.count))))
    }
    mutating func removeRandom(count: Int) -> [Element] {
        var array: [Element] = []
        for _ in 1...count {
            array.append(self.removeRandom())
        }
        return array
    }
}

