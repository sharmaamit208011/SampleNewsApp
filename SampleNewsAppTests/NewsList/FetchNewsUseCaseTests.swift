//
//  FetchNewsUseCaseTests.swift
//  SampleNewsAppTests
//
//  Created by Amit Sharma on 07/02/24.
//

import XCTest
@testable import SampleNewsApp

// Set Objects as nil
final class FetchNewsUseCaseTests: XCTestCase {
    var mockNewsRepository: MockNewsRepository?
    var newsUseCase: FetchNewsUseCase?
    
    override func setUp() {
        super.setUp()
        mockNewsRepository = MockNewsRepository()
        newsUseCase = FetchNewsUseCase(newsRepository: mockNewsRepository ?? MockNewsRepository())
    }
    
    override func tearDown() {
        super.tearDown()
        mockNewsRepository = nil
        newsUseCase = nil
    }

    func testFetchNewsSuccess() async throws {
        mockNewsRepository?.mockNewsDomainDTO = MockData.newsDomainDTO
        let news = try await newsUseCase?.execute()
        XCTAssertNotNil(news)
    }
    
    func testFetchNewsWithError() async throws {
        mockNewsRepository?.mockError = NetworkClientError.invalidURL

        do {
            _ = try await newsUseCase?.execute()
            XCTFail("Success not expected")
        } catch {
            XCTAssertEqual(error.localizedDescription, NetworkClientError.invalidURL.localizedDescription)
        }
    }

}
