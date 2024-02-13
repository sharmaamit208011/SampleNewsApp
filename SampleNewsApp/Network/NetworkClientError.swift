//
//  NetworkClientError.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 15/01/24.
//

import Foundation

/// Network Client Error
public enum NetworkClientError: Error {
    case noResponse
    case invalidURL
    case notParsable(Data)
    case unknownErrorCode(Data?, URLResponse?)

    var description: String {
        switch self {
        case .noResponse:
            return "No Response"
        case .invalidURL:
            return "Invalid URL"
        case .notParsable(let data):
            return "Data is not Parsable\(data)"
        case .unknownErrorCode(let data, let urlResponse):
            return "Unknown error code: Data:\(String(describing: data))\n URL Response:\(String(describing: urlResponse)))"
        }
    }
}
