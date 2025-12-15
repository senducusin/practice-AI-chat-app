//
//  AvatarAttributes.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/15/25.
//
import Foundation

enum CharacterOption: String, CaseIterable, Hashable {
    case man, woman, alien,
         dog, cat

    static var `default`: Self { .man }
}

enum CharacterAction: String, CaseIterable, Hashable {
    case smiling, sitting, eating,
         drinking, walking, shopping,
         studying, working, relaxing,
         fighting, sleeping

    static var `default`: Self { .relaxing }
}

enum CharacterLocation: String, CaseIterable, Hashable {
    case park, mall, museum,
         city, desert, forest,
         library, beach

    static var `default`: Self { .park }
}

struct AvatarDescriptionBuilder {
    let characterOption: CharacterOption
    let characterAction: CharacterAction
    let characterLocation: CharacterLocation

    init(characterOption: CharacterOption, characterAction: CharacterAction, characterLocation: CharacterLocation) {
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
    }

    init(avatar: AvatarModel) {
        self.characterOption = avatar.characterOption ?? .default
        self.characterAction = avatar.characterAction ?? .default
        self.characterLocation = avatar.characterLocation ?? .default
    }

    var characterDescription: String {
        let indefinitArticle = characterOption.rawValue.startsWithVowel ? "An" : "A"

        return [
            indefinitArticle,
            characterOption.rawValue,
            "that is",
            characterAction.rawValue,
            "in the",
            characterLocation.rawValue
        ]
            .joined(separator: " ")
    }
}
