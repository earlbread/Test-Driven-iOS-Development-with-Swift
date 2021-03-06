//
//  InputViewControllerTests.swift
//  ToDo
//
//  Created by Seunghun Lee on 2017-06-19.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import XCTest
@testable import ToDo
import CoreLocation

extension InputViewControllerTests {
    class MockGeocoder: CLGeocoder {
        var completionHandler: CLGeocodeCompletionHandler?

        override func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
            self.completionHandler = completionHandler
        }
    }

    class MockPlacemark: CLPlacemark {
        var mockCoordinate: CLLocationCoordinate2D?

        override var location: CLLocation? {
            guard let coordincate = mockCoordinate else {
                return CLLocation()
            }
            return CLLocation(latitude: coordincate.latitude, longitude: coordincate.longitude)
        }
    }
}

class InputViewControllerTests: XCTestCase {

    var sut: InputViewController!
    var placemark: MockPlacemark!
    
    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "InputViewController") as! InputViewController
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_HasTitleTextField() {
        XCTAssertNotNil(sut.titleTextField)
    }

    func test_HasDateTextField() {
        XCTAssertNotNil(sut.dateTextField)
    }

    func test_HasLocationTextField() {
        XCTAssertNotNil(sut.locationTextField)
    }

    func test_HasAddressTextField() {
        XCTAssertNotNil(sut.addressTextField)
    }

    func test_HasDescriptionTextField() {
        XCTAssertNotNil(sut.descriptionTextField)
    }

    func test_HasSaveButton() {
        XCTAssertNotNil(sut.saveButton)
    }

    func test_HasCancelButton() {
        XCTAssertNotNil(sut.cancelButton)
    }
    
    func test_Save_UsesGeocoderToGetCoordinateFromAddress() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        let date = dateFormatter.date(from: "02/22/2016")!
        let timestamp = date.timeIntervalSince1970
        
        sut.titleTextField.text = "Foo"
        sut.dateTextField.text = dateFormatter.string(from: date)
        sut.locationTextField.text = "Bar"
        sut.addressTextField.text = "Infinite Loop 1, Cupertino"
        sut.descriptionTextField.text = "Baz"
        
        let mockGeocoder = MockGeocoder()
        sut.geocoder = mockGeocoder
        
        sut.itemManager = ItemManager()
        
        sut.save()
        
        placemark = MockPlacemark()
        let coordinate = CLLocationCoordinate2DMake(37.3316851,
                                                    -122.0300674)
        placemark.mockCoordinate = coordinate
        mockGeocoder.completionHandler?([placemark], nil)
        
        let item = sut.itemManager?.itemAtIndex(0)
        
        let testItem = ToDoItem(title: "Foo",
                                itemDescription: "Baz",
                                timestamp: timestamp,
                                location: Location(name: "Bar",
                                                   coordinate: coordinate))

        XCTAssertEqual(item, testItem)
    }

    func test_saveButtonHasAction() {
        let saveButton: UIButton = sut.saveButton

        guard let actions = saveButton.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail()
            return
        }

        XCTAssertTrue(actions.contains("save"))
    }
}
