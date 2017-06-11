//
//  ItemManagerTests.swift
//  ToDo
//
//  Created by Seunghun Lee on 2017-06-11.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemManagerTests: XCTestCase {

    var itemManager: ItemManager!
    
    override func setUp() {
        super.setUp()

        itemManager = ItemManager()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testToDoCount_Initially_ShouldBeZero() {
        XCTAssertEqual(itemManager.toDoCount, 0, "Initially toDo count should be 0")
    }

    func testDoneCount_Initially_ShouldBeZero() {
        XCTAssertEqual(itemManager.doneCount, 0, "Initially done count should be 0")
    }

    func testToDoCount_AfterAddingOneItem_IsOne() {
        itemManager.addItem(ToDoItem(title: "Test title"))

        XCTAssertEqual(itemManager.toDoCount, 1, "toDoCount should be one")
    }

    func testItemAtIndex_ShouldBeReturnPreviouslyAddedItem() {
        let item = ToDoItem(title: "Item")
        itemManager.addItem(item)

        let returnedItem = itemManager.itemAtIndex(0)

        XCTAssertEqual(item, returnedItem, "Should be the same item")
    }

    func testCheckingItem_ChangesCountOfToDoAndOfDoneItems() {
        itemManager.addItem(ToDoItem(title: "First Item"))
        itemManager.checkItemAtIndex(0)

        XCTAssertEqual(itemManager.toDoCount, 0, "toDoCount should be 0")
        XCTAssertEqual(itemManager.doneCount, 1, "doneCount should be 1")
    }

    func testCheckingItem_RemovesItFromTheToDoItemList() {
        let firstItem = ToDoItem(title: "First Item")
        let secondItem = ToDoItem(title: "Second Item")

        itemManager.addItem(firstItem)
        itemManager.addItem(secondItem)

        itemManager.checkItemAtIndex(0)

        XCTAssertEqual(itemManager.itemAtIndex(0), secondItem)
    }

    func testDoneItemAtIndex_ShouldReturnPreviouslyCheckedItem() {
        let item = ToDoItem(title: "Item")

        itemManager.addItem(item)
        itemManager.checkItemAtIndex(0)

        let returnedItem = itemManager.doneItemAtIndex(0)

        XCTAssertEqual(returnedItem, item, "Should be the same item")
    }
    
}
