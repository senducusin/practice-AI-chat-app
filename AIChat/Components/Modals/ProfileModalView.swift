//
//  ProfileModalView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/17/25.
//

import SwiftUI

struct ProfileModalView: View {
    var imageName: String? = AvatarModel.mock.profileImageName
    var title: String? = AvatarModel.mock.name
    var subtitle: String? = AvatarModel.mock.characterOption?.displayName
    var headline: String? = AvatarModel.mock.characterDescription
    var onClosePressed: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            if let imageName {
                ImageLoaderView(urlString: imageName,
                                forceTransitionAnimation: true)
                    .aspectRatio(1, contentMode: .fit)
            }

            VStack(alignment: .leading, spacing: 4) {
                if let title {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                }

                if let subtitle {
                    Text(subtitle)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }

                if let headline {
                    Text(headline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(.thinMaterial)
        .cornerRadius(16)
        .overlay(
            Image(systemName: "xmark.circle.fill")
                .font(.title)
                .foregroundStyle(Color.black)
                .padding(4)
                .tappableBackground()
                .customButton {
                    onClosePressed()
                }
                .padding(8)
            , alignment: .topTrailing
        )
    }
}

#Preview("Modal with Image") {
    ZStack {
        Color.gray.ignoresSafeArea()
        ProfileModalView(onClosePressed: {

        })
            .padding(40)
    }
}

#Preview("Modal without Image") {
    ZStack {
        Color.gray.ignoresSafeArea()
        ProfileModalView(imageName: nil, onClosePressed: {

        })
            .padding(40)
    }
}
