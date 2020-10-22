//
//  BWMergeSort.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/9/11.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BWMergeSort: AlgorithmHello {
 
    
    
    
    func hello() {
        let array1 = [64, 35, 75]
        let result1 = self.mergeSort(array1)
        print("递归法===========\(result1)")
    }
    func mergeSort(_ arr:[Int])->[Int] {
//        guard arr.count > 1 else { return arr }
        
        if arr.count <= 1 {
            return arr
        }
        let middleIndex = arr.count / 2
        let leftArray = mergeSort(Array(arr[0..<middleIndex]))
        let rightArry = mergeSort(Array(arr[middleIndex..<arr.count]))
        return merge(leftArray, rightArry)
    }
    func merge(_ left:[Int],_ right:[Int])->[Int] {
        var sort = [Int]()
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < left.count,rightIndex < right.count {
            // 左边小
            if left[leftIndex] < right[rightIndex] {
                sort.append(left[leftIndex])
                leftIndex = leftIndex + 1
            }
            // 右边小
            else if left[leftIndex] > right[rightIndex] {
                sort.append(right[rightIndex])
                rightIndex = rightIndex + 1
            }
            // 相等
            else {
                sort.append(left[leftIndex])
                sort.append(right[rightIndex])
                leftIndex = leftIndex + 1
                rightIndex = rightIndex + 1
            }
        }
        // 补全相差只有一个，二者取1
        while leftIndex < left.count {
            sort.append(left[leftIndex])
            leftIndex = leftIndex + 1
        }
        // 补全
        while rightIndex < right.count {
            sort.append(right[rightIndex])
            rightIndex = rightIndex + 1
        }
        return sort
    }
}
