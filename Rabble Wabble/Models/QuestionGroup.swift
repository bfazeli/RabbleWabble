//
//  QuestionGroup.swift
//  Rabble Wabble
//
//  Created by Bijan Fazeli on 2/21/19.
//  Copyright © 2019 Fazeli, Bijan. All rights reserved.
//


// MARK: - Originator
// Modified struct to be a class for pass by reference
public class QuestionGroup: Codable {
    
    public class Score: Codable {
        public var correctCount: Int = 0
        public var incorrectCount: Int = 0
        
        public init() {}
    }
    
    public let questions: [Question]
    public var score: Score
    public let title: String
    
    
    // For some odd reason score is not being default initi to a blank score
    // made this initi to initi QuestionGroup w/o having to pass in a Score
    public init(questions: [Question], title: String) {
        self.questions = questions
        self.score = Score()
        self.title = title
    }
    
    public init(questions: [Question], score: Score, title: String) {
        self.questions = questions
        self.score = score
        self.title = title
    }
}
