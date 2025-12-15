//
//  ChatView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/15/25.
//

import SwiftUI

struct ChatView: View {
    @State private var chatMessages: [ChatMessageModel] = ChatMessageModel.mocks
    @State private var avatar: AvatarModel? = .mock
    @State private var currentUser: UserModel? = .mock
    @State private var inputText: String = ""
    @State private var showChatSettings: Bool = false
    @State private var scrollPosition: String?

    var body: some View {
        VStack(spacing: 0) {
            scrollViewSection
            textFieldSection
        }
        .navigationTitle(avatar?.name ?? "Chat")
        .toolbarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "ellipsis")
                    .padding(8)
                    .customButton {
                        onChatSettingsPressed()
                    }
            }
        }
        .confirmationDialog(
            "",
            isPresented: $showChatSettings) {
                Button("Report User/Chat", role: .destructive) {
                    //
                }
                Button("Delete Chat", role: .destructive) {
                    //
                }
            } message: {
                Text("What would you like to do?")
            }
    }

    private var scrollViewSection: some View {
        ScrollView {
            LazyVStack(spacing: 18) {
                ForEach(chatMessages) { message in
                    let isCurrentUser = message.authorId == currentUser?.userId

                    ChatBubbleViewBuilder(
                        message: message,
                        isCurrentUser: isCurrentUser,
                        imageName: isCurrentUser ? nil : avatar?.profileImageName
                    )
                    .id(message.id)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(8)
            .rotationEffect(.degrees(180))
        }
        .rotationEffect(.degrees(180))
        .scrollPosition(id: $scrollPosition, anchor: .center)
        .animation(.default, value: chatMessages.count)
        .animation(.default, value: scrollPosition)
    }

    private var textFieldSection: some View {
        TextField("Say something...", text: $inputText)
            .keyboardType(.alphabet)
            .autocorrectionDisabled()
            .padding(12)
            .padding(.trailing, 40)
            .overlay(
                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 32))
                    .padding(.trailing, 4)
                    .foregroundStyle(.accent)
                    .customButton {
                        onSendMessagePressed()
                    }
                , alignment: .trailing
            )
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color(uiColor: .systemBackground))

                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                }
            )
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color(uiColor: .secondarySystemBackground))
    }

    private func onSendMessagePressed() {
        guard let currentUser,
              !inputText.isEmpty else { return }

        let messageModel = ChatMessageModel(
            id: UUID().uuidString,
            chatId: UUID().uuidString,
            authorId: currentUser.userId,
            content: inputText,
            seenByIds: nil,
            dateCreated: .now
        )

        chatMessages.append(messageModel)
        scrollPosition = messageModel.id
        inputText = ""
    }

    private func onChatSettingsPressed() {
        showChatSettings = true
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
