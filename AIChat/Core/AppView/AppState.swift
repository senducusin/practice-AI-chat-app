//
//  AppState.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/8/25.
//
import SwiftUI

@Observable
class AppState {
    private(set) var showTabBar: Bool {
        didSet {
            UserDefaults.showTabBarView = showTabBar
        }
    }

    init(showTabBar: Bool = UserDefaults.showTabBarView) {
        self.showTabBar = showTabBar
    }

    func updateViewState(showTabBar: Bool) {
        self.showTabBar = showTabBar
    }
}
