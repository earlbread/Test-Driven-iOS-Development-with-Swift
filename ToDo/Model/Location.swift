//
//  Location.swift
//  ToDo
//
//  Created by Seunghun Lee on 2017-06-10.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?

    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}
