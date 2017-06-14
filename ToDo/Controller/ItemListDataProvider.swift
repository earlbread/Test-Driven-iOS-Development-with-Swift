//
//  ItemListDataProvider.swift
//  ToDo
//
//  Created by Seunghun Lee on 2017-06-14.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit

class ItemListDataProvider: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
