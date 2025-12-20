//
//  ChatsView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/8/25.
//

import SwiftUI

struct ChatsView: View {
    @State private var chats: [ChatModel] = ChatModel.mocks

    @State private var path: [NavigationPathOption] = []

    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(chats) { chat in
                    ChatRowCellViewBuilder(
                        currentUserId: nil,
                        chat: chat) {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        } getLastChatMessage: {
                            try? await Task.sleep(for: .seconds(1))
                            return .mock
                        }
                        .customButton(.highlight) {
                            onChatPressed(chat: chat)
                        }
                        .removeListRowFormatting()

                }
            }
            .navigationTitle("Chats")
            .navigationDestinationForCoreModule(path: $path)
        }
    }

    private func onChatPressed(chat: ChatModel) {
        let pathModel = NavigationPathOption.chat(avatarId: chat.avatarId)
        path.append(pathModel)
    }
}

#Preview {
    ChatsView()
}
