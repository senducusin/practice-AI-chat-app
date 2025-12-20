//
//  NavigationPathOption.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/20/25.
//
import Foundation

enum NavigationPathOption: Hashable {
    case chat(avatarId: String)
    case category(category: CharacterOption, imageName: String)
}
