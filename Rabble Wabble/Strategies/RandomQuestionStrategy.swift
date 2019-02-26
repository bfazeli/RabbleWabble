//
//  RandomQuestionStrategy.swift
//  Rabble Wabble
//
//  Created by Bijan Fazeli on 2/26/19.
//  Copyright © 2019 Fazeli, Bijan. All rights reserved.
//

import GameplayKit.GKRandomSource

public class RandomQuestionStrategy: QuestionStrategy {
    // MARK: - Properties
    public var correctCount: Int = 0
    public var incorrectCount: Int = 0
    public let questionGroup: QuestionGroup
    private var questionIndex = 0
    private let questions: [Question]
    
    // MARK: - Object Lifecycle
    init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
        
        let randomSource = GKRandomSource.sharedRandom()
        self.questions = randomSource.arrayByShufflingObjects(in: questionGroup.questions) as! [Question]
    }
    
    // MARK: - QuestionStrategy
    public var title: String {
        return questionGroup.title
    }
    
    public func advanceToNextQuestion() -> Bool {
        guard questionIndex + 1 < questions.count else {
            return false
        }
        
        questionIndex += 1
        return true
    }
    
    public func currentQuestion() -> Question {
        return questions[questionIndex]
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
