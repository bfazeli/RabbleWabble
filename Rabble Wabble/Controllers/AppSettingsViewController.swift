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


extension AppSettingsViewController {
    // MARK: UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionStrategyType.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentefier, for: indexPath)
        let questionStrategyType = QuestionStrategyType.allCases[indexPath.row]
        
        cell.textLabel?.text = questionStrategyType.title()
        cell.accessoryType = appSettings.questionStrategyType == questionStrategyType ? .checkmark : .none
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionStrategyType = QuestionStrategyType.allCases[indexPath.row]
        appSettings.questionStrategyType = questionStrategyType
        
        tableView.reloadData()
    }
}
