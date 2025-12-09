//
//  WelcomeView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/8/25.
//

import SwiftUI

struct WelcomeView: View {

    @State private var imageName: String = Constants.URL.randomImageUrl

    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()

                titleSection
                    .padding(.top, 24)

                ctaSection
                    .padding(16)

                linkSection
            }
        }
    }

    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("AI Chat 😎")
                .font(.largeTitle)
                .fontWeight(.semibold)

            Text("Practice @ SenDucusin")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    private var ctaSection: some View {
        VStack(spacing: 8) {
            NavigationLink {
                OnboardingIntroView()
            } label: {
                Text("Get Started")
                    .callToActionButton()
            }

            Text("Already have an account? Sign in")
                .underline()
                .font(.body)
                .padding(8)
                .tappableBackground()
                .onTapGesture {

                }
        }
    }

    private var linkSection: some View {
        HStack(spacing: 8) {
            Link(destination: URL(string: Constants.URL.randomImageUrl)!) {
                Text("Terms of Service")
            }

            Circle()
                .fill(.accent)
                .frame(width: 4, height: 4)

            Link(destination: URL(string: Constants.URL.randomImageUrl)!) {
                Text("Privacy Policy")
            }
        }
    }
}

#Preview {
    WelcomeView()
}
