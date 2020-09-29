//
//  BoyerMoore.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/9/15.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
// http://www.ruanyifeng.com/blog/2013/05/boyer-moore_string_search_algorithm.html
class BWBoyerMoore: NSObject, AlgorithmHello {
    func hello() {
        //        let str = "Hello, World"
        //        let index1 = str.index(of: "World")?.utf16Offset(in: str)  // 7
        //        print("Hello World 'world' index：\(index1 ?? 0)")
        //        let animals = "🐶🐔🐷🐮🐱"
        //        let index2 =   animals.index(of: "🐮")?.utf16Offset(in: animals)  // 6
        //        print("animals '🐮' index：\(index2 ?? 0)")
        let lorem = "Lorem ipsum dolor sit amet"
        let index3 = lorem.index(of: "sit", usingHorspoolImprovement: true)?.utf16Offset(in: lorem) // 18
        print("Lorem ipsum dolor sit amet 'Lorem' index：\(index3 ?? 0)")
    }
}

extension String {
    func index(of pattern: String, usingHorspoolImprovement: Bool = false) -> Index? {
        let patternLength = pattern.count
        guard patternLength > 0, patternLength <= count else {
            return nil
        }
        // 跳过的列表
        var skipTable = [Character: Int]()
        // 倒序存入字典中，为什么？
        for (i, c) in pattern.enumerated() {
            skipTable[c] = patternLength - i - 1
        }
        // 获取最后一个字符串串
        let p = pattern.index(before: pattern.endIndex)
        let lastChar = pattern[p]
        // 获取字符串开始到最后一个的下标
        var i = index(startIndex, offsetBy: patternLength - 1)
        // 暴力搜索
        func backwards() -> Index? {
            var q = p
            var j = i
            // 如果q大于第一个字符串
            while q > pattern.startIndex {
                // 返回之前的索引
                j = index(before: j)
                // 返回之前的索引
                q = index(before: q)
                // 如果字符串的索引没有跟搜索的匹配，返回空。return可以跳出while
                if self[j] != pattern[q] { return nil }
            }
            return j
        }
        // 如果搜索的最后一个索引小于当前字符串的最后索引
        while i < endIndex {
            let c = self[i]
            if c == lastChar {
                if let k = backwards() { return k }
                if !usingHorspoolImprovement {
                    i = index(after: i)
                } else {
                    let jumpOffset = max(skipTable[c] ?? patternLength, 1)
                    i = index(i, offsetBy: jumpOffset, limitedBy: endIndex) ?? endIndex
                }
            } else {
                i = index(i, offsetBy: skipTable[c] ?? patternLength, limitedBy: endIndex) ?? endIndex
            }
        }
        return nil
    }
}
