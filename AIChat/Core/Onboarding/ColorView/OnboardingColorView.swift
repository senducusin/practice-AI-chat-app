//
//  OnboardingColorView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/9/25.
//

import SwiftUI

struct OnboardingColorView: View {
    @State private var selectedColor: Color?
    let profileColors: [Color] = [
        .red, .green, .orange,
        .blue, .mint, .purple,
        .cyan, .teal, .indigo
    ]

    var body: some View {
        ScrollView {
            colorGridSection
                .padding(.horizontal, 24)
        }
        .safeAreaInset(edge: .bottom,
                       alignment: .center,
                       spacing: 16,
                       content: {
            ZStack {
                if selectedColor != nil {
                    ctaSection
                        .transition(AnyTransition.move(edge: .bottom))
                }
            }
            .padding(24)
            .background(Color(uiColor: .systemBackground))
        })
        .animation(.bouncy, value: selectedColor)
    }

    private var colorGridSection: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3),
            alignment: .center,
            spacing: 16,
            pinnedViews: [.sectionHeaders],
            content: {
                Section(content: {
                    ForEach(profileColors, id: \.self) { color in
                        Circle()
                            .fill(.black)
                            .overlay(content: {
                                color
                                    .clipShape(Circle())
                                    .padding(selectedColor == color ? 3 : 0)
                            })
                            .onTapGesture {
                                selectedColor = color
                            }
                    }
                }, header: {
                    Text("Select a profile color")
                        .font(.headline)
                })
            })
    }

    private var ctaSection: some View {
        NavigationLink {
            OnboardingCompletedView()
        } label: {
            Text("Continue")
                .callToActionButton()
        }
    }
}

#Preview {
    OnboardingColorView()
}
