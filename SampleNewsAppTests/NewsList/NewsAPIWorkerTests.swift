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
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchNewsSuccess() async throws {
        mockNetworkClient?.mockListDataModel = MockData.newsListDataModel

        let newsListDataModel = try await newsAPIWorker?.fetchNews()
        XCTAssertNotNil(newsListDataModel)
    }
}
