//
//  BWSelectionSort.swift
//  BWAlgorithm
//
//  Created by bairdweng on 2020/10/15.
//

import UIKit

class BWSelectionSort: NSObject,AlgorithmHello {
    
    func hello() {
        print("选择排序来啦：=======",selectionSort([2,3,4,9,19,3,1,3,98,31], <))
    }
    // 选择排序
    func selectionSort<T:Comparable>(_ array: [T],_ isOrderedBefore:(T,T)->Bool)->[T] {
        guard array.count > 1 else {
            return array
        }
        var a = array
        for x in 0 ..< a.count - 1 {
            var lowest = x
            for y in x + 1 ..< a.count {
                // 找最小的数字
                if isOrderedBefore(a[y], a[lowest]) {
                    lowest = y
                }
            }
            // 如果当前的数字不是最小，替换。
            if x != lowest {
                a.swapAt(x, lowest)
            }
        }
        return a
    }
}
