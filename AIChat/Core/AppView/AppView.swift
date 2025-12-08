//
//  AppView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/8/25.
//

import SwiftUI

struct AppView: View {

    @AppStorage("showTabBarView") private var showTabBar: Bool = false

    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabBarView: {
                ZStack {
                    Color.green.ignoresSafeArea()
                    Text("Tab Bar")
                }
            },
            onboardingView: {
                ZStack {
                    Color.gray.ignoresSafeArea()
                    Text("Onboarding")
                }
            }
        )
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview {
    AppView()
}
