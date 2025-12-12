//
//  ChatRowCellView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/11/25.
//

import SwiftUI

struct ChatRowCellView: View {
    var imageName: String? = Constants.URL.randomImageUrl
    var headline: String? = ChatMessageModel.mock.chatId
    var subHeadline: String? = ChatMessageModel.mock.content
    var hasNewChat: Bool = true

    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                if let imageName {
                    ImageLoaderView(urlString: imageName)
                } else {
                    Rectangle()
                        .fill(.secondary.opacity(0.5))
                }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                if let headline {
                    Text(headline)
                        .font(.headline)
                }

                if let subHeadline {
                    Text(subHeadline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            if hasNewChat {
                Text("NEW")
                    .badgeButton()
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea(edges: .all)

        List {
            ChatRowCellView()
                .removeListRowFormatting()

            ChatRowCellView(hasNewChat: false)
                .removeListRowFormatting()

            ChatRowCellView(imageName: nil)
                .removeListRowFormatting()

            ChatRowCellView(headline: nil)
                .removeListRowFormatting()

            ChatRowCellView(subHeadline: nil)
                .removeListRowFormatting()
        }
    }
}
