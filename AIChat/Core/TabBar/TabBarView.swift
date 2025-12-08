//
//  TabBarView.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/8/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ForEach(TabBarViewItem.allCases, id: \.self) { item in
                item.view
                    .tabItem {
                        Label(item.title, systemImage: item.systemImageName)
                    }
            }
        }
    }
}

#Preview {
    TabBarView()
}
