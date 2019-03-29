//
//  Question.swift
//  Rabble Wabble
//
//  Created by Bijan Fazeli on 2/21/19.
//  Copyright © 2019 Fazeli, Bijan. All rights reserved.
//

public class Question: Codable {
    public let answer: String
    public let hint: String?
    public let prompt: String
    
    init(answer: String, hint: String?, prompt: String) {
        self.answer = answer
        self.hint = hint
        self.prompt = prompt
    }
}
