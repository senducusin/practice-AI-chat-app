//
//  AvatarModel.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/11/25.
//

import Foundation

enum CharacterOption: String, CaseIterable, Hashable {
    case man, woman, alien,
         dog, cat

    static var `default`: Self { .man }
}

enum CharacterAction: String {
    case smiling, sitting, eating,
         drinking, walking, shopping,
         studying, working, relaxing,
         fighting, sleeping

    static var `default`: Self { .relaxing }
}

enum CharacterLocation: String {
    case park, mall, museum,
         city, desert, forest,
         library, beach

    static var `default`: Self { .park }
}

struct AvatarModel: Hashable {
    let avatarId: String
    let name: String?
    let characterOption: CharacterOption?
    let characterAction: CharacterAction?
    let characterLocation: CharacterLocation?
    let profileImageName: String?
    let authorId: String?
    let dateCreated: Date?

    init(
        avatarId: String,
        name: String? = nil,
        characterOption: CharacterOption? = nil,
        characterAction: CharacterAction? = nil,
        characterLocation: CharacterLocation? = nil,
        profileImageName: String? = nil,
        authorId: String? = nil,
        dateCreated: Date? = nil
    ) {
        self.avatarId = avatarId
        self.name = name
        self.characterOption = characterOption
        self.characterAction = characterAction
        self.characterLocation = characterLocation
        self.profileImageName = profileImageName
        self.authorId = authorId
        self.dateCreated = dateCreated
    }
}

extension AvatarModel {
    var characterDescription: String {
        AvatarDescriptionBuilder(avatar: self).characterDescription
    }

    static var mock: AvatarModel {
        mocks[0]
    }

    static var mocks: [AvatarModel] {
        [
            AvatarModel(
                avatarId: UUID().uuidString,
                name: "Alpha",
                characterOption: .alien,
                characterAction: .smiling,
                characterLocation: .park,
                profileImageName: Constants.URL.randomImageUrl,
                authorId: UUID().uuidString,
                dateCreated: .now
            ),
            AvatarModel(
                avatarId: UUID().uuidString,
                name: "Beta",
                characterOption: .dog,
                characterAction: .eating,
                characterLocation: .city,
                profileImageName: Constants.URL.randomImageUrl,
                authorId: UUID().uuidString,
                dateCreated: .now
            ),
            AvatarModel(
                avatarId: UUID().uuidString,
                name: "Gamma",
                characterOption: .cat,
                characterAction: .fighting,
                characterLocation: .forest,
                profileImageName: Constants.URL.randomImageUrl,
                authorId: UUID().uuidString,
                dateCreated: .now
            ),
            AvatarModel(
                avatarId: UUID().uuidString,
                name: "Delta",
                characterOption: .man,
                characterAction: .relaxing,
                characterLocation: .library,
                profileImageName: Constants.URL.randomImageUrl,
                authorId: UUID().uuidString,
                dateCreated: .now
            )
        ]
    }
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
