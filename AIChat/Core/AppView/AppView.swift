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
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
//        .onTapGesture {
//            showTabBar.toggle()
//        }
    }
}

#Preview {
    AppView()
}
