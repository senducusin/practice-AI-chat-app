//
//  UserModel.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/12/25.
//

import SwiftUI

struct UserModel {
    let userId: String
    let dateCreated: Date?
    let didCompleteOnboarding: Bool?
    let profileColorHex: String?

    init(
        userId: String,
        dateCreated: Date? = nil,
        didCompleteOnboarding: Bool? = nil,
        profileColorHex: String? = nil
    ) {
        self.userId = userId
        self.dateCreated = dateCreated
        self.didCompleteOnboarding = didCompleteOnboarding
        self.profileColorHex = profileColorHex
    }

    var profileColor: Color {
        guard let profileColorHex,
              let color = Color(hex: profileColorHex)
        else { return .accent }

        return color
    }
}

extension UserModel {
    static var mock: Self {
        UserModel.mocks[0]
    }

    static var mocks: [Self] {
        [
            UserModel(
                userId: "user_123",
                dateCreated: .stringToDate("2025-01-05 10:00"),
                didCompleteOnboarding: true,
                profileColorHex: "#FF6B6B"
            ),
            UserModel(
                userId: "user_456",
                dateCreated: .stringToDate("2025-01-06 15:45"),
                didCompleteOnboarding: false,
                profileColorHex: "#4ECDC4"
            ),
            UserModel(
                userId: "user_789",
                dateCreated: .stringToDate("2025-01-07 08:20"),
                didCompleteOnboarding: true,
                profileColorHex: "#5567FF"
            ),
            UserModel(
                userId: "user_999",
                dateCreated: .stringToDate("2025-01-08 19:10"),
                didCompleteOnboarding: nil,
                profileColorHex: "#FFA500"
            )
        ]
    }
}
