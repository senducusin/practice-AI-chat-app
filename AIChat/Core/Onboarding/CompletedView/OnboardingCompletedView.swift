//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/8/25.
//

import SwiftUI

struct OnboardingCompletedView: View {

    @Environment(AppState.self) private var root

    var body: some View {
        VStack {
            Text("Onboarding Completed")
                .frame(maxHeight: .infinity)

            Button {
                onFinishButtonPressed()
            } label: {
                Text("Finish")
                    .callToActionButton()
            }
        }
        .padding(16)
    }

    func onFinishButtonPressed() {
        root.updateViewState(showTabBar: true)
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
