//
//  InsertionSort.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/26.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BWInsertionSort: NSObject {
    public static func hello() {
        BWInsertionSort().hello()
    }

    func hello() {
        let numbers = [10, -1, 3, 9, 2]
        print("my_att:\(insertionSort(list: numbers))")
    }

    // Because two loops are nested,the time complexity is O(2n)
    func insertionSort(list: [Int]) -> [Int] {
        var sort = list
        // Extract the second number to start comparison
        for i in 1 ..< list.count {
            var j = i
            let current = list[i]
            // Move j to the left
            while j > 0, current > sort[j - 1] {
                sort[j] = sort[j - 1]
                j -= 1
            }
            sort[j] = current
        }
        return sort
    }
}
