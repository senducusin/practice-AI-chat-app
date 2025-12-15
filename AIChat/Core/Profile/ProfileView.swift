//
//  ProfileView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/8/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var showSettings = false
    @State private var showCreateAvatarView = false
    @State private var currentUser: UserModel? = .mock
    @State private var myAvatars: [AvatarModel] = []
    @State private var isLoading: Bool = false

    var body: some View {
        NavigationStack {
            List {
                myInfoSection
                myAvatarsSection
            }
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    settingsButton
                }
            }
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
        .fullScreenCover(isPresented: $showCreateAvatarView) {
            CreateAvatarView()
        }
        .task {
            await loadData()
        }
    }

    private var settingsButton: some View {
        Image(systemName: "gear")
            .font(.headline)
            .foregroundStyle(.accent)
            .customButton {
                onSettingsButtonPressed()
            }
    }

    private var myInfoSection: some View {
        Section {
            ZStack {
                Circle()
                    .fill(currentUser?.profileColor ?? .accent)
            }
            .frame(width: 100, height: 100)
            .frame(maxWidth: .infinity)
            .removeListRowFormatting()
        }
    }

    private var myAvatarsSection: some View {
        Section {
            if myAvatars.isEmpty {
                Group {
                    if isLoading {
                        ProgressView()
                    } else {
                        Text("Click '+' to create a new avatar!")
                    }
                }
                .padding(50)
                .frame(maxWidth: .infinity)
                .font(.body)
                .foregroundStyle(.secondary)
                .removeListRowFormatting()
            } else {
                ForEach(myAvatars, id: \.self) { avatar in
                    CustomListCellView(
                        imageName: avatar.profileImageName,
                        title: avatar.name,
                        subtitle: nil
                    )
                    .customButton(.highlight) {

                    }
                    .removeListRowFormatting()
                }
                .onDelete { indexSet in
                    onDeleteAvatar(indexSet: indexSet)
                }
            }
        } header: {
            HStack(spacing: 0) {
                Text("My Avatars")
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                    .foregroundStyle(.accent)
                    .customButton {
                        onNewAvatarButtonPressed()
                    }
            }
        }
    }

    private func onSettingsButtonPressed() {
        showSettings = true
    }

    private func onNewAvatarButtonPressed() {
        showCreateAvatarView = true
    }

    private func onDeleteAvatar(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }

        myAvatars.remove(at: index)
    }

    private func loadData() async {
        isLoading = true
        try? await Task.sleep(for: .seconds(5))

        isLoading = false
        myAvatars = AvatarModel.mocks
    }
}

#Preview {
    ProfileView()
        .environment(AppState())
}
