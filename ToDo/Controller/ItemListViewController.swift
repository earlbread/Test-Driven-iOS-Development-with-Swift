//
//  ItemListViewController.swift
//  ToDo
//
//  Created by Seunghun Lee on 2017-06-13.
//  Copyright © 2017 Seunghun Lee. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate)!

    override func viewDidLoad() {
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
    }
}
