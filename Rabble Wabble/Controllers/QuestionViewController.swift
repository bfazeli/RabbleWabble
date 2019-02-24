//
//  QuestionViewController.swift
//  Rabble Wabble
//
//  Created by Bijan Fazeli on 2/21/19.
//  Copyright © 2019 Fazeli, Bijan. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    public var questionGroup = QuestionGroup.basicPhrases()
    public var questionIndex = 5
    public var correctCount = 0
    public var incorrectCount = 0
    public var questionView: QuestionView! {
        guard isViewLoaded else {
            return nil
        }
        
        return (view as! QuestionView)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    
    private func showQuestion() {
        let question = questionGroup.questions[questionIndex]
        
        questionView.answerLabel.text = question.answer
        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        
        questionView.answerLabel.isHidden = true
        questionView.hintLabel.isHidden = true
    }
    
    @IBAction func toggleAnswerLabels(_ sender: Any) {
        questionView.answerLabel.isHidden = !questionView.answerLabel.isHidden
        questionView.hintLabel.isHidden = !questionView.hintLabel.isHidden
    }

}

