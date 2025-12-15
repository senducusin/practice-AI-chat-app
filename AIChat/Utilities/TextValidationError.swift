//
//  TextValidationError.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/15/25.
//
import Foundation

enum TextValidationError: LocalizedError {
    case notEnoughCharacters(min: Int)
    case hasBadWords

    var errorDescription: String? {
        switch self {
        case let .notEnoughCharacters(min):
            return "You need to write at least \(min) characters."
        case .hasBadWords:
            return "Your message contains bad words."
        }
    }
}

struct TextValidationHelper {
    static func checkIfTextIsValid(text: String) throws {
        let minimumCharacterCount = 3

        guard text.count >= minimumCharacterCount else {
            throw TextValidationError.notEnoughCharacters(min: minimumCharacterCount)
        }

        let badWords: [String] = [
            "shit", "bitch", "ass"
        ]

        if badWords.contains(text.lowercased()) {
            throw TextValidationError.hasBadWords
        }
    }
}
