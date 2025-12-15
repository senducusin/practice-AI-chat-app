//
//  ChatBubbleViewBuilder.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/15/25.
//

import SwiftUI

struct ChatBubbleViewBuilder: View {
    var message: ChatMessageModel = .mock
    var isCurrentUser: Bool = false
    var imageName: String?

    var body: some View {
        ZStack {
            ChatBubbleView(
                text: message.content ?? "",
                textColor: isCurrentUser ? .white : .primary,
                backgroundColor: isCurrentUser ? .accent : Color(uiColor: .systemGray5),
                showImage: !isCurrentUser,
                imageName: imageName
            )
            .frame(maxWidth: .infinity, alignment: isCurrentUser ? .trailing : .leading)
            .padding(.leading, isCurrentUser ? 75 : 0)
            .padding(.trailing, isCurrentUser ? 0 : 35)
        }
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 24) {
            ChatBubbleViewBuilder()

            ChatBubbleViewBuilder(isCurrentUser: true)

            ChatBubbleViewBuilder()

            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authorId: UUID().uuidString,
                    content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    seenByIds: nil,
                    dateCreated: .now
                )
            )

            ChatBubbleViewBuilder(
                message: ChatMessageModel(
                    id: UUID().uuidString,
                    chatId: UUID().uuidString,
                    authorId: UUID().uuidString,
                    content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    seenByIds: nil,
                    dateCreated: .now
                ),
                isCurrentUser: true
            )
        }
        .padding(12)
    }
}
