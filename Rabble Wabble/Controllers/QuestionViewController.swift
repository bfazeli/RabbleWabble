//
//  QuestionViewController.swift
//  Rabble Wabble
//
//  Created by Bijan Fazeli on 2/21/19.
//  Copyright © 2019 Fazeli, Bijan. All rights reserved.
//

import UIKit

// Questionviewcontroller delegats protocol for dismissing
public protocol QuestionViewControllerDelegate: class {
    func questionViewController(_ viewController: QuestionViewController, didCancel questionGroup: QuestionStrategy)
    
    func questionViewController(_ viewController: QuestionViewController, didComplete questionGroup: QuestionStrategy)
    
}

public class QuestionViewController: UIViewController {
    public var questionView: QuestionView! {
        guard isViewLoaded else {
            return nil
        }
        
        return (view as! QuestionView)
    }
    
    private lazy var questionIndexItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        return item
    }()
    
    // QuestionViewController owns QuestionViewControllerDelegate
    //  Use weak due to protocol subclass specifying class to prevent memory retain cycle.
    //  Wouldn't need weak if :class wasn't used
    public weak var selectedGroupDelegate: QuestionViewControllerDelegate?
    
    // questionStrategy is set by SelectQuestionGroupViewCon which conforms to the QuestionViewControllerDelegate
    public var questionStrategy: QuestionStrategy! {
        didSet {
            navigationItem.title = questionStrategy.title
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupCancelButton()
        showQuestion()
    }
    
    // Method for displaying top left bar button
    private func setupCancelButton() {
        let action = #selector(handleCancelPressed(sender:))
        let image = UIImage(named: "ic_menu")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: action)
    }
    
    // Method makes a call to the selectedGroupDelegate's didCancel
    @objc private func handleCancelPressed(sender: UIBarButtonItem) {
        selectedGroupDelegate?.questionViewController(self, didComplete: questionStrategy)
    }
    
    private func showQuestion() {
        let question = questionStrategy.currentQuestion()
        
        questionView.answerLabel.text = question.answer
        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        
        questionView.answerLabel.isHidden = true
        questionView.hintLabel.isHidden = true
        
        questionIndexItem.title = questionStrategy.questionIndexTitle()
    }
    
    @IBAction func toggleAnswerLabels(_ sender: Any) {
        questionView.answerLabel.isHidden = !questionView.answerLabel.isHidden
        questionView.hintLabel.isHidden = !questionView.hintLabel.isHidden
    }
    
    @IBAction func handleCorrect(_ sender: Any) {
        let question = questionStrategy.currentQuestion()
        questionStrategy.markQuestionCorrect(question)
        questionView.correctCountLabel.text = String(questionStrategy.correctCount)
        showNextQuestion()
    }
    
    @IBAction func handleIncorrect(_ sender: Any) {
        let question = questionStrategy.currentQuestion()
        questionStrategy.markQuestionIncorrect(question)
        questionView.incorrectCountLabel.text = "\(questionStrategy.incorrectCount)"
        showNextQuestion()
    }
    
    private func showNextQuestion() {
        guard questionStrategy.advanceToNextQuestion() else {
            selectedGroupDelegate?.questionViewController(self, didComplete: questionStrategy)
            return
        }
        
        showQuestion()
    }
    
}

