//
//  UserDefaults+Extensions.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/8/25.
//
import Foundation

extension UserDefaults {
    private struct Keys {
        static let showTabBarView = "showTabBarView"
    }

    static var showTabBarView: Bool {
        get {
            return standard.bool(forKey: Keys.showTabBarView)
        } set {
            standard.set(newValue, forKey: Keys.showTabBarView)
        }
    }
}
