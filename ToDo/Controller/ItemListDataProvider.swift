//
//  ItemListDataProvider.swift
//  ToDo
//
//  Created by Seunghun Lee on 2017-06-14.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit

enum Section: Int{
    case ToDo
    case Done
}

class ItemListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {

    // MARK: Properties

    var itemManager: ItemManager?

    // MARK: Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let itemManager = itemManager else {
            return 0
        }

        guard let itemSection = Section(rawValue: section) else {
            fatalError()
        }

        let numberOfRows: Int

        switch itemSection {
        case .ToDo:
            numberOfRows = itemManager.toDoCount
        case .Done:
            numberOfRows = itemManager.doneCount
        }
        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell

        guard let itemManager = itemManager else {
            fatalError()
        }

        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }

        let item: ToDoItem
        switch section {
        case .ToDo:
            item = itemManager.itemAtIndex(indexPath.row)
        case .Done:
            item = itemManager.doneItemAtIndex(indexPath.row)
        }
        
        cell.configCellWithItem(item: item)

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {

        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }

        let buttonTitle: String
        switch section {
        case .ToDo:
            buttonTitle = "Check"
        case .Done:
            buttonTitle = "Uncheck"
        }
        return buttonTitle
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {

        guard let itemManager = itemManager else {
            fatalError()
        }

        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }

        switch section {
        case .ToDo:
            itemManager.checkItemAtIndex(indexPath.row)
        case .Done:
            itemManager.uncheckItemAtIndex(indexPath.row)
        }
        tableView.reloadData()
    }
}
