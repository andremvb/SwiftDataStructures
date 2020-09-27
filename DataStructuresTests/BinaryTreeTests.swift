//
//  DataStructuresTests.swift
//  DataStructuresTests
//
//  Created by Andre Valdivia on 9/20/20.
//  Copyright © 2020 Andre Valdivia. All rights reserved.
//

import XCTest
@testable import DataStructures

class BinaryTreeTests: XCTestCase {
    func test_insert1Node(){
        let tree = BinaryTree<Int>(4)
        XCTAssertEqual(4, tree.root?.data)
    }
    
    func test_insert3Node(){
        let tree = BinaryTree<Int>(4, 7, 2)
        XCTAssertEqual(tree.root?.data, 4)
        XCTAssertEqual(tree.root?.rightChild?.data, 7)
        XCTAssertEqual(tree.root?.leftChild?.data, 2)
    }
    
    func test_find3Node(){
        let tree = BinaryTree<Int>(4, 7, 2)
        XCTAssertTrue(tree.find(4))
        XCTAssertTrue(tree.find(7))
        XCTAssertTrue(tree.find(2))
    }
    
    func test_shouldntFind3Node(){
        let tree = BinaryTree<Int>(4, 7, 2)
        XCTAssertFalse(tree.find(3))
    }
    
    func test_remove1Node(){
        let tree = BinaryTree<Int>(4)
        tree.remove(4)
        XCTAssertNil(tree.root)
    }
    
    func test_dontRemove1Node(){
        let tree = BinaryTree<Int>(4)
        tree.remove(3)
        XCTAssertEqual(tree.root?.data, 4)
    }
    
    func test_description(){
        let tree = BinaryTree<Int>(4, 7, 2, 1, 3, 0)
        print(tree.description)
        let printed = """
           0
          1
         2
          3
        4
         7

        """
        XCTAssertEqual(tree.description, printed)
    }

}
