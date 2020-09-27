//
//  BinaryTree.swift
//  DataStructures
//
//  Created by Andre Valdivia on 9/20/20.
//  Copyright © 2020 Andre Valdivia. All rights reserved.
//

import Foundation

class BinaryTree<T: Comparable>: CustomStringConvertible{
    
    var description: String{
        return descriptionHelper(root)
    }
    
    var root: Node? = nil
    
    init(_ data: [T]? = nil){
        guard let data = data else {return}
        data.forEach{insert($0)}
    }
    
    convenience init(_ data: T...){
        self.init(data)
    }
    
    class Node: CustomStringConvertible{
        var data: T
        var rightChild: Node? = nil
        var leftChild: Node? = nil
        
        init(_ data: T){
            self.data = data
        }
        
        var description: String{"\(data)"}
    }
    
    
    func insert(_ data: T){
        insertHelper(&root, data: data)
    }
    
    func find(_ data: T) -> Bool{
        return findHelper(&root, data: data)
    }
    
    func remove(_ data: T){
        removeHelper(&root, data: data)
    }
    
    // MARK: Helper private functions
    
    private func insertHelper(_ node: inout Node?, data: T){
        
        guard let nodeData = node?.data else {
            node = Node(data)
            return
        }
        
        if data > nodeData{
            insertHelper(&node!.rightChild, data: data)
        }else{
            insertHelper(&node!.leftChild, data: data)
        }
    }
    
    private func findHelper(_ node: inout Node?, data: T) -> Bool{
        guard let nodeData = node?.data else{
            return false
        }
        
        if data == nodeData{
            return true
        }
        
        if data > nodeData{
            return findHelper(&node!.rightChild, data: data)
        }else{
            return findHelper(&node!.leftChild, data: data)
        }
    }
    
    private func removeHelper(_ node: inout Node?, data: T){
        guard let nodeData = node?.data else{
            return
        }
        
        if data == nodeData{
            node = nil
            return
        }
        
        if data > nodeData{
            removeHelper(&node!.rightChild, data: data)
        }else{
            removeHelper(&node!.leftChild, data: data)
        }
    }
    
    private func descriptionHelper(_ node: Node?, _ step: String = "") -> String{
        guard let node = node else {return ""}
        
        var leftDescription = ""
        var rightDescription = ""
        let thisDescription = (step + node.description + "\n")
        
        if let leftNode = node.leftChild{
            leftDescription = descriptionHelper(leftNode, " " + step)
        }
        
        if let rightNode = node.rightChild{
            rightDescription = descriptionHelper(rightNode, " " + step)
        }

        return leftDescription + thisDescription + rightDescription
    }
}
