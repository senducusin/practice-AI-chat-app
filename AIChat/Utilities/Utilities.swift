//
//  Utilities.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/12/25.
//

import Foundation

@MainActor
struct AppUtilities {
    static var appVersion: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }

    static var buildNumber: String? {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String
    }
}
