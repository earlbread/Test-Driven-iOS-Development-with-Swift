//
//  ItemCellTests.swift
//  ToDo
//
//  Created by Seunghun Lee on 2017-06-17.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

extension ItemCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}

import XCTest
@testable import ToDo

class ItemCellTests: XCTestCase {

    var tableView: UITableView!
    var dataSource = FakeDataSource()
    var cell: ItemCell!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard
            .instantiateViewController(
                withIdentifier: "ItemListViewController")
            as! ItemListViewController
        
        _ = controller.view
        
        tableView = controller.tableView
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(
            withIdentifier: "ItemCell",
            for: IndexPath(row: 0, section: 0)) as! ItemCell
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testSUT_HasNameLabel() {
        XCTAssertNotNil(cell.titleLabel)
    }

    func testSUT_HasLocationLabel() {
        XCTAssertNotNil(cell.locationLabel)
    }

    func testSUT_HasDateLabel() {
        XCTAssertNotNil(cell.dateLabel)
    }

    func testConfigWithItem_SetsLabelTexts() {
        cell.configCellWithItem(item: ToDoItem(title: "First", itemDescription: "First description", timestamp: 1456150025, location: Location(name: "Home")))

        XCTAssertEqual(cell.titleLabel.text, "First")
        XCTAssertEqual(cell.locationLabel.text, "Home")
        XCTAssertEqual(cell.dateLabel.text, "02/22/2016")
    }

    func testTitle_ForCheckedTasks_IsStrokeThrough() {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: IndexPath(row: 0, section: 0)) as! ItemCell

        let toDoItem = ToDoItem(title: "First", itemDescription: nil, timestamp: 1456150025, location: Location(name: "Home"))

        cell.configCellWithItem(item: toDoItem, checked: true)

        let attributedString = NSAttributedString(string: "First", attributes: [NSStrikethroughStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue])

        XCTAssertEqual(cell.titleLabel.attributedText, attributedString)
        XCTAssertNil(cell.locationLabel.text)
        XCTAssertNil(cell.dateLabel.text)
    }
}
