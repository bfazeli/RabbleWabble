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

extension SelectQuestionGroupViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedQuestionGroup = questionGroups[indexPath.row]
        return indexPath
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let questionViewController = segue.destination as? QuestionViewController else {
            return
        }
        
        questionViewController.questionGroup = selectedQuestionGroup
        
        // Tells the owner that I want to be the one that conforms to your protocols
        questionViewController.selectedGroupDelegate = self
    }
}

extension SelectQuestionGroupViewController: QuestionViewControllerDelegate {
    
    // When either method is called by the owner, handle what to do
    public func questionViewController(_ viewController: QuestionViewController, didCancel questionGroup: QuestionGroup, at questionIndex: Int) {
        navigationController?.popToViewController(self, animated: true)
    }
    public func questionViewController(_ viewController: QuestionViewController, didComplete questionGroup: QuestionGroup) {
        navigationController?.popToViewController(self, animated: true)
    }
    
    
}
