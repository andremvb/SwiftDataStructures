//
//  SingleLinkedList.swift
//  DataStructures
//
//  Created by Andre Valdivia on 9/27/20.
//  Copyright © 2020 Andre Valdivia. All rights reserved.
//

import Foundation

class SingleLinkedList<T: Equatable>{
    
    class Node{
        var data: T
        var next: Node?
        
        init(_ data: T){
            self.data = data
        }
    }
    
    var head: Node?
    
    init(_ items: [T]){
        items.forEach(insert)
    }
    
    convenience init(_ items: T...){
        self.init(items)
    }
    
    func insert(_ item: T){
        insert_helper(node: &head, data: item)
    }
    
    func delete(_ item: T){
        if head?.data == item{
            head = head?.next
        }else{
            guard head != nil else {return}
            delete_helper(node: &head!, data: item)
        }
    }
    
    private func insert_helper(node: inout Node?, data: T){
        if node == nil{
            node = Node(data)
        }else{
            insert_helper(node: &node!.next, data: data)
        }
    }
    
    private func delete_helper(node: inout Node, data: T){
        if node.next?.data == data{
            node.next = node.next?.next
        }else{
            guard node.next != nil else {return}
            delete_helper(node: &node.next!, data: data)
        }
    }
}
