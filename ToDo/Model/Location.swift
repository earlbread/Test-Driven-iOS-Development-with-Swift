//
//  Location.swift
//  ToDo
//
//  Created by Seunghun Lee on 2017-06-10.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import Foundation
import CoreLocation

struct Location: Equatable {
    let name: String
    let coordinate: CLLocationCoordinate2D?

    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }

    static func ==(lhs: Location, rhs: Location) -> Bool {
        if lhs.name != rhs.name {
            return false
        }
        
        if lhs.coordinate?.latitude != rhs.coordinate?.latitude {
            return false
        }

        if lhs.coordinate?.longitude != rhs.coordinate?.longitude {
            return false
        }
        return true
    }
}
