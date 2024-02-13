//
//  ResponseParser.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 12/01/24.
//

import Foundation

/// Any Parser can adopt to this protocol and write their own parser
protocol ResponseParser {
    func parse(data: Any) throws -> Any?
}
