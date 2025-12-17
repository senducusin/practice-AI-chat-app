//
//  ImageLoaderView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/9/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    var urlString: String = Constants.URL.randomImageUrl
    var resizingMode: ContentMode = .fill
    var forceTransitionAnimation: Bool = false

    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay(
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            )
            .clipped()
            .ifSatisfiesCondition(forceTransitionAnimation) {
                $0.drawingGroup()
            }
    }
}

#Preview {
    ImageLoaderView()
        .frame(width: 100, height: 200)
}
