//
//  NewsRepositoryTests.swift
//  SampleNewsAppTests
//
//  Created by Amit Sharma on 08/02/24.
//

import XCTest
@testable import SampleNewsApp

final class NewsRepositoryTests: XCTestCase {
    var mockNewsAPIWorker: MockNewsAPIWorker?
    var mockNewsRepository: NewsRepository?
    
    override func setUp() {
        super.setUp()
        mockNewsAPIWorker = MockNewsAPIWorker()
        mockNewsRepository = NewsRepository(newsAPIWorker: mockNewsAPIWorker ?? MockNewsAPIWorker())
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchNews() async throws {
        mockNewsAPIWorker?.mockNewsDataDTO = MockData.newsDataDTO
        let result = try await mockNewsRepository?.fetchNews()
        XCTAssertNotNil(result)
    }

    func testFetchNewsWithError() async throws {
        mockNewsAPIWorker?.mockError = NetworkClientError.invalidURL
        
        do {
            let _ = try await mockNewsRepository?.fetchNews()
            XCTFail("Success not expected")
        }
        catch {
            XCTAssertEqual(error.localizedDescription, NetworkClientError.invalidURL.localizedDescription)
        }
    }

}
