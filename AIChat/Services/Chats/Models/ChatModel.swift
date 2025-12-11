//
//  ChatModel.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/11/25.
//

import Foundation

struct ChatModel: Identifiable {
    let id: String
    let userId: String
    let avatarId: String
    let dateCreated: Date
    let dateModified: Date
}

extension ChatModel {
    static var mock: ChatModel {
        ChatModel.mocks[0]
    }

    static var mocks: [ChatModel] {
        [
            ChatModel(
                id: "chat_001",
                userId: "user_123",
                avatarId: "avatar_01",
                dateCreated: .stringToDate("2025-01-10 09:30"),
                dateModified: .stringToDate("2025-01-10 09:45")
            ),
            ChatModel(
                id: "chat_002",
                userId: "user_456",
                avatarId: "avatar_02",
                dateCreated: .stringToDate("2025-01-11 14:20"),
                dateModified: .stringToDate("2025-01-11 14:22")
            ),
            ChatModel(
                id: "chat_003",
                userId: "user_789",
                avatarId: "avatar_03",
                dateCreated: .stringToDate("2025-01-12 08:00"),
                dateModified: .stringToDate("2025-01-12 08:05")
            ),
            ChatModel(
                id: "chat_004",
                userId: "user_999",
                avatarId: "avatar_04",
                dateCreated: .stringToDate("2025-01-13 18:10"),
                dateModified: .stringToDate("2025-01-13 18:11")
            )
        ]
    }
}
