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
        let numbers = [13,8,14,7]
        print("插入排序:\(insertionSort(list: numbers))")
        
    }
    
    // 插入排序的时间复杂度是O(n^2)，但会比冒泡好一点。数据量小会相当快
    func insertionSort(list: [Int]) -> [Int] {
        var sort = list
        // 从第二个开始
        for i in 1..<sort.count {
            let temple = sort[i]
            var j = i
            while j > 0, temple < sort[j - 1 ] {
                sort[j] = sort[j - 1]
                j = j - 1
            }
            sort[j] = temple
        }
        return sort
    }
    
    
}
