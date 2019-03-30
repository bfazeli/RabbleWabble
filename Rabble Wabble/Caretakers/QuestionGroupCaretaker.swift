//
//  QuestionGroupCaretaker.swift
//  Rabble Wabble
//
//  Created by Bijan Fazeli on 3/30/19.
//  Copyright © 2019 Fazeli, Bijan. All rights reserved.
//

import Foundation

public final class QuestionGroupCaretaker {
    // MARK: - Properties
    private let fileName: String = "QuestionGroupData"
    public var questionGroups: [QuestionGroup] = []
    public var selectedQuestionGroup: QuestionGroup!
    
    public init () {
        loadQuestionGroups()
    }
    
    private func loadQuestionGroups() {
        // Could fail if doc hasn't been created so retrieve it from Bundle and save questionQroups to it
        if let questionGroups = try? DiskCaretaker.retrieve([QuestionGroup].self, from: fileName) {
            
            self.questionGroups = questionGroups
            
        } else {
            
            let bundle = Bundle.main
            let url = bundle.url(forResource: fileName, withExtension: "json")!
            self.questionGroups = try! DiskCaretaker.retrieve([QuestionGroup].self, from: url)
            try! save()
            
        }
    }
    
    // MARK: - Instance Methods
    public func save() throws {
        try DiskCaretaker.save(questionGroups, to: fileName)
    }
}
