//
//  NewsAPIWorkerTests.swift
//  SampleNewsAppTests
//
//  Created by Amit Sharma on 08/02/24.
//

import XCTest
@testable import SampleNewsApp

final class NewsAPIWorkerTests: XCTestCase {
    var mockNetworkClient: MockNetworkClient?
    var newsAPIWorker: NewsAPIWorker?
    
    override func setUp() {
        super.setUp()
        
        mockNetworkClient = MockNetworkClient()
        newsAPIWorker = NewsAPIWorker(networkClient: mockNetworkClient ?? MockNetworkClient())
    }
    
    override func tearDown() {
        super.tearDown()
        mockNetworkClient = nil
        newsAPIWorker = nil
    }

    func testFetchNewsSuccess() async throws {
        mockNetworkClient?.mockListDataModel = MockData.newsListDataModel

        let newsListDataModel = try await newsAPIWorker?.fetchNews()
        XCTAssertNotNil(newsListDataModel)
    }
}
