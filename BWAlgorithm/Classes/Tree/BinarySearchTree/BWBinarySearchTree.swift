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
    // 根节点
    var root:SNode?
    
    // 插入
    func insert(data:Int) {
        let newNode = SNode(data: data)
        if root == nil {
            root = newNode
            return
        }
        // 需要一直查找下去
        var p = root
        while p != nil {
            // 小于根节点 放在左边
            if data < p!.data {
                // 找到叶节点
                if p!.left == nil {
                    p!.left = newNode
                    return
                }
                p = p?.left
            }
            // 放在右边
            else {
                if p!.right == nil {
                    p!.right = newNode
                    return
                }
                p = p?.right
            }
        }
    }
    
    // 打印树的高度
    func getMaxHeight()->Int {
        return getMaxLevel(node: root)
    }
    
    // 获取最大高度
    func getMaxLevel(node:SNode?)->Int {
        if node == nil {
            return 0
        }
        // 递归的思想，存在左边就+1
        let leftHeight = getMaxLevel(node: node!.left)
        // 递归的思想，存在右边就+1
        let rightHeight = getMaxLevel(node: node!.right)
        if leftHeight > rightHeight {
            return leftHeight + 1
        }
        else {
            return rightHeight + 1
        }
    }
    
    // 删除所有节点
    func clean() {
        root = nil
    }
    
    // 模拟一个假的二叉搜索树
    func resetFakeBST() {
        /*
         这不是一个完全的二叉搜索树。
         10
         /  \
         5   15
         /\
         11 20
         */
        clean()
        root = SNode(data: 10)
        root?.left = SNode(data: 5)
        root?.right = SNode(data: 15)
        root?.right?.left = SNode(data: 6)
        root?.right?.right = SNode(data: 20)
        print("重置一个非完全二叉搜索树")
    }
    func isInBST(target:Int) -> Bool {
        return isInBST(node: root, data: target)
    }
    // 判定一个数是否存在
    func isInBST(node:SNode?,data:Int)->Bool {
        if node == nil {
            return false
        }
        if node!.data == data {
            return true
        }
        return isInBST(node: node!.right,data: data) || isInBST(node: node!.left,data: data)
    }
    // 优化版
    func isInBSTGood(node:SNode?,data:Int)->Bool {
        if node == nil {
            return false
        }
        if node?.data == data {
            return true
        }
        if node!.data < data {
            return isInBSTGood(node: node?.right, data: data)
        }
        if node!.data > data {
            return isInBSTGood(node: node?.left, data: data)
        }
        return false
    }
    //  插入值
    func insertValue(node:SNode?,data:Int)->SNode? {
        if node == nil {
            return SNode(data: data)
        }
        if node!.data < data {
            node?.right = insertValue(node: node, data: data)
        }
        if node!.data > data {
            node?.left = insertValue(node: node, data: data)
        }
        return node
    }
    
    // 查找节点
    func find(data:Int)-> SNode? {
        var p = root
        while p != nil {
            // 往左边找
            if data < p!.data {
                p = p?.left
            }
            // 往右边找
            else if data > p!.data {
                p = p?.right
            }else {
                return p
            }
        }
        return nil
    }
    
    
    // 判断是否是二叉搜索树 resetFakeBST 执行后会被判定为二叉树，原因是右子树没有跟根子树比较
    func isValidBSTFake(root:SNode?)->Bool {
        // 根节点是null
        if root == nil {
            return true
        }
        // 左节点不能大于根节点
        if root!.left != nil && root!.data <= root!.left!.data {
            return false
        }
        // 跟节点比右节点小
        if root!.right != nil && root!.data >= root!.right!.data {
            return false
        }
        return isValidBSTFake(root: root!.left) && isValidBSTFake(root: root!.right)
    }
    
    // 判断是否是完整的二叉搜索树,min 定义 当前节点比父节点小，max大 根节点10会跟随函数一直传递下去
    /*
     /*
     这不是一个完全的二叉搜索树。结合思维导图理解
     10
     /  \
     5   15
     /\
     6 20
     */
     递归思想，给一个节点，最小值，最大值，返回是否是完整的二叉搜索树
     */
    func isValidBST(node:SNode?,min:SNode?,max:SNode?)->Bool {
//        print("data:\(node?.data ?? 0) min:\(min?.data ?? 0) max:\(max?.data ?? 0)")
        // 根节点或者当前节点为空，返回ture
        if node == nil {
            return true
        }
        if min != nil && node!.data <= min!.data {
            return false
        }
        if max != nil && node!.data >= max!.data {
            return false
        }
        // 如果左边有值，那么最小就是之前的最小值，最大值就是根节点
        let leftCompare = isValidBST(node: node?.left, min: min, max: node)
        // 如果右边有值，那么最小值是根节点，最大值则是之前的最大值
        let rightCompare = isValidBST(node: node?.right, min: node, max: max)
        return leftCompare && rightCompare
    }
    
    // 删除节点
    func delete(data: Int) {
        // 指向要删除的节点
        var p:SNode? = root
        // 记录需要删除的节点的父节点
        var pp:SNode? = nil
        // 查找节点
        while p != nil && p!.data != data {
            pp = p
            // 大于根节点 右边找
            if data > p!.data {
                p = p?.right
                // 左边找
            } else {
                p = p?.left
            }
        }
        // 未找到节点，return
        if p == nil {
            print("未找到节点\(data)")
            return
        }
        // 1. 删除的节点有两个子节点
        if p?.left != nil && p?.right != nil {
            // 查找右子树的最小值
            // 保存父节点
            var minPP = p
            var minP = p?.right
            while minP?.left != nil  {
                minPP = minP
                minP = minP?.left
            }
            // 替换为最小
            p!.data = minP!.data
            p = minP
            pp = minPP
        }
        // 2. 删除的节点是叶节点或者只有一个节点
        var child:SNode?
        // 子节点是左
        if p?.left != nil {
            child = p?.left
        }else if p?.right != nil {
            child = p?.right
        }else {
            child = nil
        }
        // 要删除的根节点
        if pp == nil {
            root = child
        }
        /* 这一段的意思是，如果被删除的节点父节点的左边是当前节点。
         说明父节点的左需要被替换。
         反之右边需要被替换
         */
        else if pp?.left != nil && pp!.left!.data == p!.data {
            pp!.left = child
        } else {
            pp!.right = child
        }
        print("删除节点值为:\(data)")
    }
    
    func printPre() {
        preOrder(node: root)
    }
    func printIn() {
        inOrder(node: root)
    }
    func printLast() {
        lastOrder(node: root)
    }
    func preOrder(node:SNode?) {
        if node == nil {
            return
        }
        print("前序遍历：\(node?.data ?? 0)")
        if node?.left != nil {
            preOrder(node: node?.left)
        }
        if node?.right != nil {
            preOrder(node: node?.right)
        }
    }
    
    func inOrder(node:SNode?) {
        if node == nil {
            return
        }
        inOrder(node: node?.left)
        print("中序遍历：\(node?.data ?? 0)")
        inOrder(node: node?.right)
    }
    
    func lastOrder(node:SNode?) {
        if node == nil {
            return
        }
        lastOrder(node: node?.left)
        lastOrder(node: node?.right)
        print("后序遍历：\(node?.data ?? 0)")
    }
}

class BWBinarySearchTreeExample: NSObject {
    
    let searchTree = BWBinarySearchTree()
    
    func insert(data:Int) {
        searchTree.insert(data: data)
    }
    
    func find() {
        let node =  searchTree.find(data: 3)
        Swift.print("当前节点的值是：\(node?.data ?? 0)")
    }
    
    func delete() {
        searchTree.delete(data: 4)
    }
    
    func resetFakeBST() {
        searchTree.resetFakeBST()
    }
    func isValidFake() {
        Swift.print("当前是完整的二叉搜索树吗(错误的写法)？",searchTree.isValidBSTFake(root: searchTree.root))
    }
    func isValid(){
        let isValid = searchTree.isValidBST(node: searchTree.root,min:nil,max: nil)
        print("是完全的二叉树吗？\(isValid)")
    }
    func clean() {
        searchTree.clean()
    }
    func printPre() {
        searchTree.printPre()
    }
    func printIn() {
        searchTree.printIn()
    }
    func printLast() {
        searchTree.printLast()
    }
    func isInBST() {
        print("数字20是否存在：\(searchTree.isInBST(target: 20))")
    }
    func printTreeHeight() {
        print("打印树的高度：\(searchTree.getMaxHeight())")
    }
}
