//
//  BWQueue.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/25.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class BWQueue: NSObject {
    static func hello() {
        var queue = Queue<String>()
        queue.enqueue("Ada")
        queue.enqueue("Steve")
        queue.enqueue("Tim")
        /// 出列
        _ = queue.dequeue()
        print(queue)
    }
}

public struct Queue<T> {
    fileprivate var array = [T?]()
    fileprivate var head = 0

    public var isEmpty: Bool {
        return array.isEmpty
    }

    public var count: Int {
        return array.count - head
    }

    public mutating func enqueue(_ element: T) {
        array.append(element)
    }

    /// 这里优化了什么？优化之后出列O(n)到O(1)
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }

        array[head] = nil
        head += 1

        let percentage = Double(head) / Double(array.count)
        if array.count > 50, percentage > 0.25 {
            // 删除到下标之前的。
            array.removeFirst(head)
            head = 0
        }

        return element
    }

    public var front: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}
