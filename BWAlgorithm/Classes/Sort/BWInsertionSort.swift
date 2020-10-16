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
        print("插入排序:\(insertionSort(list: numbers))")

    }
    
    // 插入排序的时间复杂度是O(n^2)，但会比冒泡好一点。数据量小会相当快
    func insertionSort(list: [Int]) -> [Int] {
        var sort = list
        // Extract the second number to start comparison
        for i in 1 ..< list.count {
            // 临时存储当前的变量
            let temp = list[i]
            // 从第二个数开始处理
            var j = i
            // 如果当前的树小于前面的数组，那么往左边移动
            while j > 0, temp < sort[j - 1] {
                sort[j] = sort[j - 1]
                // 往左边移，递减
                j -= 1
            }
            // 此时temp 应该填充到原本属于它的位置
            sort[j] = temp
        }
        return sort
    }
    
   
}
