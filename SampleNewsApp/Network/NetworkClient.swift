//
//  NetworkClient.swift
//  SampleNewsApp
//
//  Created by Amit Sharma on 11/01/24.
//

import Foundation

/// Any Network Client can adopt to this protocol to give their own definition of how to start API call
protocol NetworkClient {
    typealias Response = Any?
    func start(_ service: NetWorkService) async throws -> Response
}
