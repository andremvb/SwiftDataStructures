//
//  SingleLinkedListTests.swift
//  DataStructuresTests
//
//  Created by Andre Valdivia on 9/27/20.
//  Copyright © 2020 Andre Valdivia. All rights reserved.
//

import XCTest
@testable import DataStructures

class SingleLinkedListTests: XCTestCase{
    
    typealias List = SingleLinkedList
    
    func test_initalizer(){
        _ = List(2, 4, 6)
    }
    
    func test_insert(){
        let list = List<Int>()
        list.insert(4)
        list.insert(5)
        XCTAssertEqual(list.head?.data, 4)
        XCTAssertEqual(list.head?.next?.data, 5)
    }
    
    func test_deleteAfterInsert(){
        let sut = List(4,5,6)
        sut.delete(5)
        XCTAssertEqual(sut.head?.data, 4)
        XCTAssertEqual(sut.head?.next?.data, 6)
    }
    
    func test_deleteWithOneElement(){ 
        let sut = List<Int>()
        sut.delete(4)
        XCTAssertNil(sut.head)
    }
    
    func test_deleteFirst(){
        let sut = List(4,5,6)
        sut.delete(4)
        XCTAssertEqual(sut.head?.data, 5)
        XCTAssertEqual(sut.head?.next?.data, 6)
    }
    
    func test_deleteLast(){
        let sut = List(4,5,6)
        sut.delete(6)
        XCTAssertEqual(sut.head?.data, 4)
        XCTAssertEqual(sut.head?.next?.data, 5)
        XCTAssertNil(sut.head?.next?.next?.data)
        
    }
}
