//
//  AppHelper.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 31/01/24.
//

import Foundation

struct DateFormatterHelper {
    static func getFormattedDate(date: Date?) -> String {
        guard let date = date else { return "" }
        let format = DateFormatter()
        format.dateStyle = .medium
        return format.string(from: date)
    }
}
