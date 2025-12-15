//
//  AnyAppAlert.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/15/25.
//
import SwiftUI

struct AnyAppAlert: Sendable {
    var title: String
    var subtitle: String?
    var buttons: @Sendable () -> AnyView

    init(title: String,
         subtitle: String? = nil,
         buttons: (@Sendable() -> AnyView)? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.buttons = buttons ?? {
            AnyView(
                Button("OK") { }
            )
        }
    }

    init(error: Error) {
        self.init(title: "Error", subtitle: error.localizedDescription)
    }
}

enum AlertType {
    case alert, confirmationDialog
}
