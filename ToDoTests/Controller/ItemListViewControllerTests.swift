//
//  ItemListViewControllerTests.swift
//  ToDo
//
//  Created by Seunghun Lee on 2017-06-13.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemListViewControllerTests: XCTestCase {

    // MARK: Properties

    var sut: ItemListViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController

        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_TableViewIsNotNilAfterViewDidLoad() {
        XCTAssertNotNil(sut.tableView)
    }

    func testViewDidLoad_ShouldSetTableViewDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertTrue(sut.tableView.dataSource is ItemListDataProvider)
    }

    func testViewDidLoad_ShouldSetTableViewDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertTrue(sut.tableView.delegate is ItemListDataProvider)
    }

    func testViewDidLoad_ShouldSetDelegateAndDataSourceToTheSameObject() {
        XCTAssertEqual(sut.tableView.dataSource as? ItemListDataProvider, sut.tableView.delegate as? ItemListDataProvider)
    }
    
}
