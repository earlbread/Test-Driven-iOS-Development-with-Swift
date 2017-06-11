//
//  LocationTests.swift
//  ToDo
//
//  Created by Seunghun Lee on 2017-06-10.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import XCTest
@testable import ToDo
import CoreLocation

class LocationTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit_ShouldSetNameAndCoordinate() {
        let testCoordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)

        let location = Location.init(name: "", coordinate: testCoordinate)
        XCTAssertEqual(location.coordinate?.latitude, testCoordinate.latitude,
                       "Initializer should set latitude")
        XCTAssertEqual(location.coordinate?.longitude, testCoordinate.longitude,
                       "Initializer should set longitude")
    }

    func testInit_ShouldSetName() {
        let location = Location.init(name: "Test name")

        XCTAssertEqual(location.name, "Test name", "Initializer should set the name")
    }
}
