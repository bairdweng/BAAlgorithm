//
//  BWShell.swift
//  BWAlgorithm
//
//  Created by bairdweng on 2020/10/15.
//

import UIKit

class BWShellSort: AlgorithmHello {
    func hello() {
        var shellNumbers = [22, 10, 33, 44, 55, 70, 21, 34, 85]
        shellSort(&shellNumbers)
        print("我是希尔排序:\(shellNumbers)")
    }
    // 希尔排序 相当于插入排序的高级用法。排序的性能为O(n^2)，如果幸运，则为 O(nlogn)
    /*
        tips
        在Swift众多数据类型中，只有class是指针传递，其余的如Int,Float,Bool,Character,Array,Set,enum,struct全都是值传递.
        让值传递以指针方式传递
    */
    func shellSort(_ list: inout [Int]) {
        var sublistCount = list.count / 2
        while sublistCount > 0 {
            for pos in 0 ..< sublistCount {
                insertSort(&list, start: pos, gap: sublistCount)
            }
            sublistCount = sublistCount / 2
        }
    }
    
    func insertSort(_ list: inout[Int], start: Int, gap: Int) {
        /// 这里看作分割好的数组，然后进行插入排序
        for i in stride(from: (start + gap), to: list.count, by: gap) {
            let currentValue = list[i]
            // 这个是起点
            var pos = i
            while pos >= gap &&  currentValue < list[pos - gap] {
                list[pos] = list[pos - gap]
                pos -= gap
            }
            list[pos] = currentValue
        }
        print("start===\(start) 增量：\(gap)数组:\(list)")
    }
}
