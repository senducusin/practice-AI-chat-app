//
//  ChatBubbleView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/15/25.
//

import SwiftUI

struct ChatBubbleView: View {
    var text: String = ChatMessageModel.mock.content ?? ""
    var textColor: Color = .primary
    var backgroundColor: Color = Color(uiColor: .systemGray5)
    var showImage: Bool = true
    var imageName: String?

    let offSet: CGFloat = 13

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            if showImage {
                ZStack {
                    if let imageName {
                        ImageLoaderView(urlString: imageName)
                    } else {
                        Rectangle()
                            .fill(.secondary)
                    }
                }
                .frame(width: 44, height: 44)
                .clipShape(Circle())
                .offset(y: offSet)
            }

            Text(text)
                .font(.body)
                .foregroundStyle(textColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(backgroundColor)
                .cornerRadius(6)
        }
        .padding(.bottom, showImage ? offSet : 0)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 16) {
            ChatBubbleView(
                textColor: .white,
                backgroundColor: .accent,
                showImage: false,
                imageName: nil
            )
            ChatBubbleView(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
            ChatBubbleView(
                textColor: .white,
                backgroundColor: .accent,
                imageName: nil
            )
            ChatBubbleView(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                           textColor: .white,
                           backgroundColor: .accent,
                           imageName: nil)
            ChatBubbleView()
        }
        .padding(8)
    }
}
