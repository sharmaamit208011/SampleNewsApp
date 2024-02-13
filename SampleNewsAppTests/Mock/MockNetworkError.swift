//
//  MockNetworkError.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 15/01/24.
//

import Foundation

public enum MockClientError: Error {
    case jsonFileNotFound
    case notParsable(Data?)
    
    var description: String {
        switch self {
        case .jsonFileNotFound:
            return "JSON File not found"
        case .notParsable(let data):
            return "Data is not Parsable\(String(describing: data))"
        }
    }
}
