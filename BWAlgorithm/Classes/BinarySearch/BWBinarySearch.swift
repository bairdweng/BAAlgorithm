//
//  BWBinarySearch.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/9/10.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BWBinarySearch: NSObject {
    func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
        if range.lowerBound >= range.upperBound {
            return nil
        } else {
            let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2

            if a[midIndex] > key {
                return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
            } else if a[midIndex] < key {
                return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
            } else {
                return midIndex
            }
        }
    }

    public static func hello() {
        let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
        let result = BWBinarySearch().binarySearch(numbers, key: 67, range: 0 ..< numbers.count)
        print("========\(result ?? 0)")
    }
}
