//
//  ToDoItem.swift
//  ToDo
//
//  Created by Seunghun Lee on 2017-06-09.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import Foundation

struct ToDoItem {
    let title: String
    let itemDescription: String?

    init(title: String, itemDescription: String? = nil) {
        self.title = title
        self.itemDescription = itemDescription
    }
}
