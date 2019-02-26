//
//  SequentialQuestionStrategy.swift
//  Rabble Wabble
//
//  Created by Bijan Fazeli on 2/26/19.
//  Copyright © 2019 Fazeli, Bijan. All rights reserved.
//

public class SequentialQuestionStrategy: QuestionStrategy {
    // MARK: - Properties
    public var correctCount: Int = 0
    public var incorrectCount: Int = 0
    public let questionGroup: QuestionGroup
    private var questionIndex = 0
    
    // MARK: - Object Lifecycle
    public init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
    }
    
    // MARK: - QuestionStrategy implementations
    public var title: String {
        return questionGroup.title
    }
    
    public func advanceToNextQuestion() -> Bool {
        guard questionIndex + 1 < questionGroup.questions.count else {
            return false
        }
        
        questionIndex += 1
        return true
    }
    
    
    public func currentQuestion() -> Question {
        return questionGroup.questions[questionIndex]
    }
    
    public func markQuestionCorrect(_ question: Question) {
        correctCount += 1
    }
    
    public func markQuestionIncorrect(_ question: Question) {
        incorrectCount -= 1
    }
    
    public func questionIndexTitle() -> String {
        return "\(questionIndex + 1)/\(questionGroup.questions.count)"
    }
}
