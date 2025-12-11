//
//  ChatMessageModel.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/11/25.
//

import Foundation

struct ChatMessageModel {
    let id: String
    let chatId: String
    let authorId: String?
    let content: String?
    let seenByIds: [String]?
    let dateCreated: Date?

    init(
        id: String,
        chatId: String,
        authorId: String? = nil,
        content: String? = nil,
        seenByIds: [String]? = nil,
        dateCreated: Date? = nil
    ) {
        self.id = id
        self.chatId = chatId
        self.authorId = authorId
        self.content = content
        self.seenByIds = seenByIds
        self.dateCreated = dateCreated
    }

    func hasBeenSeenByCurrentUser(_ userId: String) -> Bool {
        guard let seenByIds else { return false }

        return seenByIds.contains(userId)
    }
}

extension ChatMessageModel {
    static var mock: ChatMessageModel {
        mocks[0]
    }

    static var mocks: [ChatMessageModel] {
        [
            ChatMessageModel(
                id: "msg_001",
                chatId: "chat_001",
                authorId: "user_123",
                content: "Hey, are you available right now?",
                seenByIds: ["user_456", "user_789"],
                dateCreated: .stringToDate("2025-01-10 09:31")
            ),
            ChatMessageModel(
                id: "msg_002",
                chatId: "chat_001",
                authorId: "user_456",
                content: "Yep, what’s up?",
                seenByIds: ["user_123"],
                dateCreated: .stringToDate("2025-01-10 09:32")
            ),
            ChatMessageModel(
                id: "msg_003",
                chatId: "chat_002",
                authorId: "user_789",
                content: "Meeting is moved to 3pm.",
                seenByIds: ["user_999", "user_456"],
                dateCreated: .stringToDate("2025-01-11 14:21")
            ),
            ChatMessageModel(
                id: "msg_004",
                chatId: "chat_003",
                authorId: "user_999",
                content: "I'll send the files later today.",
                seenByIds: ["user_789"],
                dateCreated: .stringToDate("2025-01-12 08:02")
            )
        ]
    }
}
