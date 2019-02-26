//
//  QuestionStrategy.swift
//  Rabble Wabble
//
//  Created by Bijan Fazeli on 2/26/19.
//  Copyright © 2019 Fazeli, Bijan. All rights reserved.
//

public protocol QuestionStrategy: class {
    // Title for which set of questions is selected, i.e. 'Basic phrases'
    var title: String { get }
    
    // Returns the current number of correct and incorrect questions, respectively
    var correctCount: Int { get }
    var incorrectCount: Int { get }
    
    // Used to move onto the next question
    func advanceToNextQuestion() -> Bool
    
    // Always returns the current question
    func currentQuestion() -> Question
    
    // Marks the current question as correct or incorrect, resp
    func markQuestionCorrect(_ question: Question)
    func markQuestionIncorrect(_ question: Question)
    
    // Returns the index title as "current / total"
    func questionIndexTitle() -> String
    
}
