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

    @State private var isPremium: Bool = false
    @State private var isAnonymousUser: Bool = false
    @State private var showCreateAccountView: Bool = false
    @State private var sheetHeight: CGFloat = 200

    var body: some View {
        NavigationStack {
            List {
                accountSection
                purchasesSection
                applicationSection
            }
            .navigationTitle(Text("Settings"))
            .sheet(isPresented: $showCreateAccountView) {
                MeasuredView(height: $sheetHeight) {
                    CreateAccountView()
                }
                .presentationDetents([.height(sheetHeight)])
                .presentationDragIndicator(.visible)
            }
        }
    }

    private var accountSection: some View {
        Section {

            if isAnonymousUser {
                Text("Save & Back-up Account")
                    .rowFormatting()
                    .customButton(.highlight) {
                        onCreateAccountPressed()
                    }
                    .removeListRowFormatting()
            } else {
                Text("Sign Out")
                    .rowFormatting()
                    .customButton(.highlight) {
                        onSignOut()
                    }
                    .removeListRowFormatting()
            }

            Text("Delete Account")
                .foregroundStyle(.red)
                .rowFormatting()
                .customButton(.highlight) {
                    //
                }
                .removeListRowFormatting()
        } header: {
            Text("Account")
        }
    }

    private var purchasesSection: some View {
        Section {
            HStack(spacing: 8) {
                Text("Account Status: \(isPremium ? "PREMIUM" : "BASIC")")

                Spacer(minLength: 0)

                if isPremium {
                    Text("MANAGE")
                        .badgeButton()
                }
            }
            .rowFormatting()
            .customButton(.highlight) {
                //
            }
            .disabled(!isPremium)
            .removeListRowFormatting()
        } header: {
            Text("Purchases")
        }
    }

    private var applicationSection: some View {
        Section {
            HStack(spacing: 8) {
                Text("Version")
                Spacer(minLength: 0)
                Text(AppUtilities.appVersion ?? "")
                    .foregroundStyle(.secondary)

            }
            .rowFormatting()
            .removeListRowFormatting()

            HStack(spacing: 8) {
                Text("Build Number")
                Spacer(minLength: 0)
                Text(AppUtilities.buildNumber ?? "")
                    .foregroundStyle(.secondary)

            }
            .rowFormatting()
            .removeListRowFormatting()

            Text("Contact Us")
                .foregroundStyle(.blue)
                .rowFormatting()
                .customButton(.highlight) {
                    //
                }
                .removeListRowFormatting()

        } header: {
            Text("Application")
        } footer: {
            Text("Created by Jansen Ducusin.\nLearn more at https://senducusin.github.io/portfolio/")
                .baselineOffset(6)
        }
    }

    func onSignOut() {
        dismiss()

        Task {
            try? await Task.sleep(for: .seconds(1))
            appState.updateViewState(showTabBar: false)
        }
    }

    func onCreateAccountPressed() {
        showCreateAccountView = true
    }
}

#Preview {
    SettingsView()
        .environment(AppState())
}
