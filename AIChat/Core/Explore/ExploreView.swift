//
//  ExploreView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/8/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var featuredAvatars: [AvatarModel] = AvatarModel.mocks
    @State private var categories: [CharacterOption] = CharacterOption.allCases
    @State private var popularAvatars: [AvatarModel] = AvatarModel.mocks

    @State private var path: [NavigationPathOption] = []

    var body: some View {
        NavigationStack(path: $path) {
            List {
                featuredSection
                categorySection
                popularSection
            }
            .navigationTitle("Explore")
            .navigationDestinationForCoreModule(path: $path)
        }
    }

    private var featuredSection: some View {
        Section {
            ZStack {
                CarouselView(items: featuredAvatars) { avatar in
                    HeroCellView(
                        title: avatar.name,
                        subtitle: avatar.characterDescription,
                        imageUrl: avatar.profileImageName
                    )
                    .customButton {
                        onAvatarPressed(model: avatar)
                    }
                }
            }
            .removeListRowFormatting()
        } header: {
            Text("Featured")
        }
    }

    private var categorySection: some View {
        Section {
            ZStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            if let imageName = popularAvatars.first(where: {
                                $0.characterOption == category
                            })?.profileImageName {
                                CategoryCellView(
                                    title: category.plural.capitalized,
                                    imageName: imageName
                                )
                                .customButton {
                                    onCategoryPressed(category: category, imageName: imageName)
                                }
                            }
                        }
                    }
                }
                .frame(height: 140)
                .scrollIndicators(.hidden)
                .scrollTargetLayout()
                .scrollTargetBehavior(.viewAligned)
            }
            .removeListRowFormatting()
        } header: {
            Text("Categories")
        }
    }

    private var popularSection: some View {
        Section {
            ForEach(popularAvatars, id: \.self) { avatar in
                CustomListCellView(
                    imageName: avatar.profileImageName,
                    title: avatar.name,
                    subtitle: avatar.characterDescription
                )
                .customButton(.highlight) {
                    onAvatarPressed(model: avatar)
                }
                .removeListRowFormatting()
            }
        } header: {
            Text("Popular")
        }
    }

    private func onAvatarPressed(model: AvatarModel) {
        let pathModel = NavigationPathOption.chat(avatarId: model.avatarId)
        path.append(pathModel)
    }

    private func onCategoryPressed(category: CharacterOption, imageName: String) {
        let pathModel = NavigationPathOption.category(category: category,
                                                      imageName: imageName)
        path.append(pathModel)
    }
}

#Preview {
    ExploreView()
}
