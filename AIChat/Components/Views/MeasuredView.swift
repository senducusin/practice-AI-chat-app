//
//  MeasuredView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/12/25.
//

import SwiftUI

struct MeasuredView<Content: View>: View {
    @Binding var height: CGFloat
    let content: () -> Content

    var body: some View {
        content()
            .background(
                GeometryReader { geo in
                    Color.clear
                        .onAppear { height = geo.size.height }
                        .onChange(of: geo.size.height) { height = $0 }
                }
            )
    }
}
