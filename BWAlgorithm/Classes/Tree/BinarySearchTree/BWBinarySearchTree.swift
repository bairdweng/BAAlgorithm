//
//  BWBinarySearchTree.swift
//  BWAlgorithm
//
//  Created by bairdweng on 2020/10/12.
//

import UIKit




/// 树的结点结构
class SNode {
    /// 左子结点
    var left: SNode?
    
    /// 右子结点
    var right: SNode?
    
    /// 结点数据
    var data: Int
    
    init(left: SNode? = nil, right: SNode? = nil, data: Int) {
        self.left = left
        self.right = right
        self.data = data
    }
}


class BWBinarySearchTree: NSObject {
    /// 根结点
    private(set) var root: SNode?
    
    /// 查找结点
    func find(data: Int) -> SNode? {
        var p = root
        while p != nil {
            if data < p!.data {
                p = p?.left
            } else if data > p!.data {
                p = p?.right
            } else {
                return p
            }
            
        }
        return nil
    }
    
    /// 插入结点
    func insert(data: Int) {
        if root == nil {
            root = SNode(data: data)
            return
        }
        
        var p = root
        while p != nil {
            if data > p!.data {
                // 数据大于 p.data 查找右子树
                if p?.right == nil {
                    p?.right = SNode(data: data)
                    return;
                }
                p = p?.right
            } else {
                // 数据小于 p.data 查找左子树
                if p?.left == nil {
                    p?.left = SNode(data: data)
                    return;
                }
                p = p?.left
            }
        }
    }
    
    /// 删除结点
    func delete(data: Int) {
        var p: SNode? = root    // p指向要删除的结点，初始化指向根节点
        var pp: SNode? = nil    // pp记录的是p的父节点
        
        // 搜索找到要删除的结点
        while p != nil && p!.data != data {
            pp = p
            if data > p!.data {
                p = p?.right
            } else {
                p = p?.left
            }
        }
        
        if p == nil {
            // 没有找到要删除的数据结点
            return
        }
        
        // 要删除的结点有两个子结点
        if p?.left != nil && p?.right != nil {
            // 查找右子树中的最小值
            var minPP = p           // minPP是minP的父结点
            var minP = p?.right
            while minP?.left != nil {
                minPP = minP
                minP = minP?.left
            }
            p!.data = minP!.data    // 将minP的数据替换到p中
            p = minP
            pp = minPP              // 下面就编程删除minP了
        }
        
        // 要删除的结点是叶子结点或者仅有一个子节点
        // 获取到要删除结点的子节点
        var child: SNode?
        if p?.left != nil {
            child = p?.left
        } else if p?.right != nil {
            child = p?.right
        } else {
            child = nil
        }
        
        // 定位要删除的是根节点、左子结点或右子结点
        if pp == nil {
            // 要删除的是根节点
            root = child
        } else if pp?.left != nil && pp!.left!.data == p!.data {
            pp?.left = child
        } else {
            pp?.right = child
        }
    }
    /// 递归先序遍历
    fileprivate func preOrder(node: SNode?) {
        if node == nil {
            return
        }
        print("=====================\(node!.data)")
        preOrder(node: node?.left)
        preOrder(node: node?.right)
    }
}
class BWBinarySearchTreeExample: NSObject {
    
    let searchTree = BWBinarySearchTree()
    
    func insert(data:Int) {
        searchTree.insert(data: data)
    }
    
    func find() {
        let node =  searchTree.find(data: 3)
        Swift.print("the node is:\(node?.data ?? 0)")
    }
    
    func delete() {
        searchTree.delete(data: 3)
    }
    
    func print() {
        searchTree.preOrder(node: searchTree.root)
    }
}
