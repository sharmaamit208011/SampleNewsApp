//
//  MockNewsAPIWorker.swift
//  SampleNewsAppTests
//
//  Created by Amit Sharma on 07/02/24.
//

import Foundation

@testable import SampleNewsApp

final class MockNewsAPIWorker: NewsAPIWorkerProtocol {
    var mockNewsDataDTO: [NewsDataDTO] = []
    var mockError: Error?
    
    func fetchNews() async throws -> [NewsDataDTO] {
        if let error = mockError {
            throw error
        }
        return mockNewsDataDTO
    }
}
