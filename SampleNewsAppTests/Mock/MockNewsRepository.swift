//
//  MockNewsRepository.swift
//  SampleNewsAppTests
//
//  Created by Amit Sharma on 07/02/24.
//

@testable import SampleNewsApp

final class MockNewsRepository: NewsRepositoryProtocol {
    var mockNewsDomainDTO: [NewsDomainDTO] = []
    var mockError: Error?
    
    func fetchNews() async throws -> [NewsDomainDTO] {
        if let error = mockError {
            throw error
        }
        return mockNewsDomainDTO
    }
}

