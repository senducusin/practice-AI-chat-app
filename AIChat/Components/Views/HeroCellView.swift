//
//  HeroCellView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/9/25.
//

import SwiftUI

struct HeroCellView: View {
    var title: String? = "Some Title"
    var subtitle: String? = "Some Subtitle or description"
    var imageUrl: String? = Constants.URL.randomImageUrl

    var body: some View {
        ZStack {
            if let imageUrl {
                ImageLoaderView(urlString: imageUrl)
            } else {
                Rectangle()
                    .fill(.accent)
            }
        }
        .overlay(alignment: .bottomLeading, content: {
            VStack(alignment: .leading, spacing: 4) {
                if let title {
                    Text(title)
                        .font(.headline)
                }

                if let subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                }
            }
            .foregroundStyle(.white)
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .addGradientBackgroundForText()
        })
        .cornerRadius(16)
    }
}

#Preview {
    ScrollView {
        VStack {
            HeroCellView()
                .frame(width: 300, height: 200)

            HeroCellView()
                .frame(width: 300, height: 400)

            HeroCellView()
                .frame(width: 200, height: 400)

            HeroCellView(imageUrl: nil)
                .frame(width: 300, height: 200)

            HeroCellView(title: nil)
                .frame(width: 300, height: 200)

            HeroCellView(subtitle: nil)
                .frame(width: 300, height: 200)
        }
        .frame(maxWidth: .infinity)
    }
}
