//
//  AppSettingsViewController.swift
//  Rabble Wabble
//
//  Created by Bijan Fazeli on 3/8/19.
//  Copyright © 2019 Fazeli, Bijan. All rights reserved.
//

import UIKit

class AppSettingsViewController: UITableViewController {
    // MARK: - Properties
    public let appSettings = AppSettings.shared
    private let cellIdentefier = "basicCell"
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentefier)
    }
}
