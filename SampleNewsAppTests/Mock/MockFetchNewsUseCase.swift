//
//  MockFetchNewsUseCase.swift
//  SampleNewsAppTests
//
//  Created by Amit Sharma on 07/02/24.
//

@testable import SampleNewsApp

final class MockFetchNewsUseCase: FetchNewsUseCaseProtocol {
    var mockNews: [News] = []
    var mockError: Error?
    
    func execute() async throws -> [News] {
        if let error = mockError {
            throw error
        }
        return mockNews
    }
}
