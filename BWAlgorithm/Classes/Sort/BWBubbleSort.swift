//
//  BWBubuleSort.swift
//  BWAlgorithm
//
//  Created by bairdweng on 2020/10/15.
//

import UIKit

class BWBubbleSort: AlgorithmHello {
    func hello() {
        print("垃圾冒泡来啦：=======",bubbleSort([13,8,14,7]))
    }
    
    // 冒泡排序，最垃圾的排序
    func bubbleSort(_ numbers:[Int])->[Int] {
        var nums = numbers
        for i in 0..<nums.count {
            for j in 0..<nums.count - 1 - i {
                if (nums[j] > nums[j + 1]) {
                    nums.swapAt(j, j + 1)
                }
            }
        }
        return nums
    }
}
