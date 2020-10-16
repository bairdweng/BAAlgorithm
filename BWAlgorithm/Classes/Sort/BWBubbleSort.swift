//
//  BWBubuleSort.swift
//  BWAlgorithm
//
//  Created by bairdweng on 2020/10/15.
//

import UIKit

class BWBubbleSort: AlgorithmHello {
    func hello() {
        print("垃圾冒泡来啦：=======",bubbleSort([2,3,4,9,19,3,1,3,98,31]))
    }
    
    // 冒泡排序，最垃圾的排序
    func bubbleSort(_ numbers:[Int])->[Int] {
        var nums = numbers
        let n = numbers.count
        for i in 0..<n {
            for j in 0..<(n - 1 - i) {
                // 把大的往右边移动
                if nums[j] > nums[j + 1] {
                    nums.swapAt(j, j + 1)
                }
            }
        }
        return nums
    }
}
