//
//  CategoryCellView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/11/25.
//

import SwiftUI

struct CategoryCellView: View {
    var title: String = "Aliens"
    var imageName: String = Constants.URL.randomImageUrl
    var font: Font = .title2
    var cornerRadius: CGFloat = 16

    var body: some View {
        ImageLoaderView(urlString: imageName)
            .aspectRatio(1, contentMode: .fit)
            .overlay(alignment: .bottomLeading) {
                Text(title)
                    .font(font)
                    .padding(16)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .addGradientBackgroundForText()
            }
            .cornerRadius(cornerRadius)
    }
}

#Preview {
    VStack {
        CategoryCellView()
            .frame(width: 150)

        CategoryCellView()
            .frame(width: 300)
    }
}
