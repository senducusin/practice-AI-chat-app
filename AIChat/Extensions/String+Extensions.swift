//
//  String+Extensions.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/11/25.
//

import Foundation

extension String {
    var startsWithVowel: Bool {
        guard let first = self.first?.lowercased() else {
            return false
        }

        return "aeiou".contains(first)
    }
}
