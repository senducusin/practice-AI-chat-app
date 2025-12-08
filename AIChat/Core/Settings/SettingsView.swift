//
//  SettingsView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/8/25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState

    var body: some View {
        NavigationStack {
            List {
                Button {
                    onSignOut()
                } label: {
                    Text("Sign out")
                }
            }
            .navigationTitle(Text("Settings"))
        }
    }

    func onSignOut() {
        dismiss()

        Task {
            try? await Task.sleep(for: .seconds(1))
            appState.updateViewState(showTabBar: false)
        }
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
