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

    var body: some View {
        NavigationStack {
            List {
                featuredSection
                categorySection
            }
            .navigationTitle("Explore")
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
                }
            }
            .removeListRowFormatting()
        } header: {
            Text("Featured Avatars")
        }
    }

    private var categorySection: some View {
        Section {
            ZStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 12) {
                        ForEach(categories, id: \.self) { category in
                            CategoryCellView(
                                title: category.rawValue.capitalized,
                                imageName: Constants.URL.randomImageUrl
                            )
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
            Text("Categories Avatars")
        }
    }
}

#Preview {
    ExploreView()
}
