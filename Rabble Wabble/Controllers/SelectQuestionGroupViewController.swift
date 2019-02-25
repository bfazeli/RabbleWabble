//
//  SelectQuestionGroupViewController.swift
//  Rabble Wabble
//
//  Created by Bijan Fazeli on 2/25/19.
//  Copyright © 2019 Fazeli, Bijan. All rights reserved.
//

import UIKit

public class SelectQuestionGroupViewController: UIViewController {
    @IBOutlet internal var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    internal let questionGroups = QuestionGroup.allGroups()
    private var selectedQuestionGroup : QuestionGroup!
}

extension SelectQuestionGroupViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionGroups.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionGroupCell") as! QuestionGroupCell
        
        let questionGroup = questionGroups[indexPath.row]
        cell.titleLabel.text = questionGroup.title
        
        return cell
    }
    
    
}
