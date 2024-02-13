//
//  NetworkService.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 12/01/24.
//

import Foundation

/// API can adopt to this protocol to give network service
protocol NetWorkService {
    var apiEnvironment: Environment { get }
    var apiUrl: URL? { get }
    var httpMethod: HTTPMethod { get }
    var httpBody: Encodable? { get }
    var apiIdentifier: APIIdentifier? { get }
    var responseParser: ResponseParser { get }
    var additionalHeaders: [String: String]? { get }
}
