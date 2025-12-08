//
//  TabBarViewItem.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/8/25.
//

import SwiftUI

enum TabBarViewItem: String, CaseIterable {
    case explore
    case chats
    case profile
}

extension TabBarViewItem {
    var id: Self { self }

    var title: String {
        switch self {
        case .explore:
            return "Explore"
        case .chats:
            return "Chats"
        case .profile:
            return "Profile"
        }
    }

    var systemImageName: String {
        switch self {
        case .explore:
            return "house.fill"
        case .chats:
            return "bubble.left.and.bubble.right.fill"
        case .profile:
            return "person.fill"
        }
    }

    @ViewBuilder
    var view: some View {
        switch self {
        case .explore:
            ExploreView()
        case .chats:
            ChatsView()
        case .profile:
            ProfileView()
        }
    }
}
