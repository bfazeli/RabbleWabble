//
//  AppSettings.swift
//  Rabble Wabble
//
//  Created by Bijan Fazeli on 3/1/19.
//  Copyright © 2019 Fazeli, Bijan. All rights reserved.
//

import Foundation

public class AppSettings {
    // MARK: - Keys
    private struct Keys {
        static let questionStrategy = "questionStrategy"
    }
    
    // MARK: - Instance Properties
    public var questionStrategyType: QuestionStrategyType {
        get {
            let rawValue = userDefaults.integer(forKey: Keys.questionStrategy)
            return QuestionStrategyType.init(rawValue: rawValue)!
        }
        set {
            userDefaults.set(newValue.rawValue, forKey: Keys.questionStrategy)
        }
    }
    private let userDefaults = UserDefaults.standard
    
    // MARK: - Instance Methods
    public func questionStrategy(for questionGroup: QuestionGroup) -> QuestionStrategy {
        return questionStrategyType.questionStrategy(for: questionGroup)
    }
    
    // MARK: - Class type
    public static let shared = AppSettings()
    
    // MARK: - Object Lifecycle
    private init(){}
}

// MARK: - QuestionStrategyType
public enum QuestionStrategyType: Int, CaseIterable {
    case random
    case sequential
    
    // MARK: - Instance Methods
    public func title() -> String {
        switch self {
        case .random:
            return "Random"
        case .sequential:
            return "Sequential"
        }
    }
    
    public func questionStrategy(for questionGroup: QuestionGroup) -> QuestionStrategy {
        switch self {
        case .random:
            return RandomQuestionStrategy(questionGroup: questionGroup)
        case .sequential:
            return SequentialQuestionStrategy(questionGroup: questionGroup)
        }
    }
}
