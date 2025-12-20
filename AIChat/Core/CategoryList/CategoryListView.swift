//
//  CategoryListView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/17/25.
//

import SwiftUI

struct CategoryListView: View {
    @Binding var path: [NavigationPathOption]

    var category: CharacterOption = .default
    var imageName: String = Constants.URL.randomImageUrl

    @State private var avatars: [AvatarModel] = AvatarModel.mocks

    var body: some View {
        List {
            CategoryCellView(
                title: category.plural.capitalized,
                imageName: imageName,
                font: .largeTitle,
                cornerRadius: 0
            )
            .removeListRowFormatting()

            ForEach(avatars, id: \.self) { avatar in
                CustomListCellView(
                    imageName: avatar.profileImageName,
                    title: avatar.name,
                    subtitle: avatar.characterDescription
                )
                .customButton(.highlight) {
                    onAvatarPressed(avatar: avatar)
                }
                .removeListRowFormatting()
            }
        }
        .ignoresSafeArea()
        .listStyle(PlainListStyle())
    }

    private func onAvatarPressed(avatar: AvatarModel) {
        let model = NavigationPathOption.chat(avatarId: avatar.avatarId)
        path.append(model)
    }
}

#Preview {
    CategoryListView(path: .constant([]))
}
