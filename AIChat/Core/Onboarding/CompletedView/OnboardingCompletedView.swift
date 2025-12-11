//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/8/25.
//

import SwiftUI

struct OnboardingCompletedView: View {

    @Environment(AppState.self) private var root

    @State private var isCompletingProfileSetup: Bool = false

    var selectedColor: Color = .blue

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Setup Complete!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)

            Text("We've set up your profile and you're ready to start chatting.")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom, content: {
            ctaSection
        })
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }

    private var ctaSection: some View {
        ZStack {
            if isCompletingProfileSetup {
                ProgressView()
                    .tint(.white)
            } else {
                Text("Finish")
            }
        }
        .callToActionButton()
        .customButton(.press) {
            onFinishButtonPressed()
        }
        .disabled(isCompletingProfileSetup)
    }

    func onFinishButtonPressed() {
        isCompletingProfileSetup = true

        Task {
//            try await saveUserProfile(color: selectedColor)

            try await Task.sleep(for: .seconds(3))
            isCompletingProfileSetup = false
            root.updateViewState(showTabBar: true)
        }
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
