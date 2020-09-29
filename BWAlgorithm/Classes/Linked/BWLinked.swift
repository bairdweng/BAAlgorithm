//
//  BWLinked.swift
//  BWNote
//
//  Created by bairdweng on 2020/9/27.
//  Copyright © 2020 sssshuayaohuayao. All rights reserved.
//

import UIKit


/// the node
public class LinedListNode<T> {
    var value: T
    var next: LinedListNode?
    weak var previous: LinedListNode?
    
    public init(value: T) {
        self.value = value
    }
}

/// 链表
public class LinkedList<T> {
    public typealias Node = LinedListNode<T>
    
    private var head: Node?
    
    private var tail: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    /// 遍历获得最后一个节点
    public var last: Node? {
        guard var node = head  else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    /// 在链表的末尾添加新的节点
    public func append(_ value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    /// 遍历计算链表中节点数
    public var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    /// 获取特定索引的节点
    public func node(at index: Int) -> Node {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node!
        }
    }
    /// 获取特定索引的节点的下标方法
    public subscript(index: Int) -> T {
        let node = self.node(at: index)
        return node.value
    }
    /// 在任何索引处插入节点
    public func insert(_ node: Node, at index: Int) {
        let newNode = node
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = self.node(at: index-1)
            let next = prev.next
            
            newNode.previous = prev
            newNode.next = prev.next
            prev.next = newNode
            next?.previous = newNode
        }
    }
    /// 删除所有节点
    public func removeAll() {
        head = nil
    }
    /// 删除指定节点
    public func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        return node.value
    }
    /// 删除最有一个节点
    public func removeLast() -> T {
        assert(!isEmpty)
        return remove(node: last!)
    }
    /// 删除指定索引节点
    public func remove(at index: Int) -> T {
        let node = self.node(at: index)
        //        assert(node != nil)
        return remove(node: node)
    }
}
extension LinkedList: CustomStringConvertible {
    /// 可读的输出
    public var description: String {
        var s = "["
        var node = self.head
        while node != nil {
            s += "\(node!.value)"
            node = node!.next
            if node != nil { s += ", "}
        }
        return s + "]"
    }
}

extension LinkedList {
    /// 翻转链表
    public func reverse() {
        var node = head
        tail = head
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.next, &currentNode.previous)
            head = currentNode
        }
    }
    
    public func map<U>(transform: (T) -> U) -> LinkedList<U> {
        let result = LinkedList<U>()
        var node = head
        while node != nil {
            result.append(transform(node!.value))
            node = node!.next
        }
        return result
    }
    
    public func filter(predicate: (T) -> Bool) -> LinkedList<T> {
        let result = LinkedList<T>()
        var node = head
        while node != nil {
            if predicate(node!.value) {
                result.append(node!.value)
            }
            node = node!.next
        }
        return result
    }
}


class BWLinked: NSObject {
    func hello() {
        _ = LinkedList<String>()
        
    }
}
