//
//  BWSingleLinked.swift
//  BWAlgorithm
//
//  Created by bairdweng on 2020/10/13.
//

import UIKit

// 节点 T是泛型
class SingleLinkNode<T> {
    var next:SingleLinkNode?
    var value:T
    init(value:T) {
        self.value = value
    }
}

class BWSingleLinked<T> {
    public typealias Node = SingleLinkNode<T>
    
    // 链表的节点
    var head:Node?
    
    func reverse() {
        head = reverse(head: head)
    }
    // 单链表的反转
    private func reverse(head:Node?) -> Node? {
        // 下个节点为null，表面是自己
        if  head == nil || head?.next == nil  {
            return head
        }
        // 保存下一个节点
        let nextNode = head?.next
        // 获取最后一个节点
        let newHead = reverse(head: head?.next)
        // 下一个节点的下一个等于当前这个，相当于反转
        nextNode?.next = head 
        return newHead
    }
    /// 遍历获得最后一个节点
    var last: Node? {
        guard var node = head  else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node
    }
    // 添加节点
    func append(value:T) {
        let newNode = SingleLinkNode(value: value)
        // 头部节点为空，添加到头部嘛
        if head == nil {
            head = newNode
        }else if let lastNode = last {
            lastNode.next = newNode
        }
    }
   
}
extension BWSingleLinked: CustomStringConvertible {
    /// 可读的输出,这个牛逼
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
class BWSingleLinkedExample:AlgorithmHello {
    func hello() {
        let singleLink = BWSingleLinked<Int>()
        for i in 1..<10 {
            singleLink.append(value: i)
        }
        
        print("反转前：=====\(singleLink)")
        singleLink.reverse()
        print("反转前：=====\(singleLink)")

        
    }
    
    
}
