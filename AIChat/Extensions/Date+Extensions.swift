//
//  Date+Extensions.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/11/25.
//
import Foundation

extension Date {
    static func stringToDate(_ string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.timeZone = .current
        return dateFormatter.date(from: string)!
    }
}
