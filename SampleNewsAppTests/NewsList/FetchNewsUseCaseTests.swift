//
//  FetchNewsUseCaseTests.swift
//  SampleNewsAppTests
//
//  Created by Amit Sharma on 07/02/24.
//

import XCTest
@testable import SampleNewsApp

final class FetchNewsUseCaseTests: XCTestCase {
    var mockNewsRepository: MockNewsRepository?
    var newsUseCase: FetchNewsUseCase?
    
    override func setUp() {
        super.setUp()
        mockNewsRepository = MockNewsRepository()
        newsUseCase = FetchNewsUseCase(newsRepository: mockNewsRepository ?? MockNewsRepository())
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
