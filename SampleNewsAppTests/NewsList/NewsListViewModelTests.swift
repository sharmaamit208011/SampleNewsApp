//
//  NewsListViewModelTests.swift
//  SampleNewsAppTests
//
//  Created by Amit Sharma on 07/02/24.
//

import XCTest
@testable import SampleNewsApp

final class NewsListViewModelTests: XCTestCase {
    var mockFetchNewsUseCase: MockFetchNewsUseCase?
    var viewModel : NewsViewModel?
    
    override func setUp() {
        super.setUp()
        mockFetchNewsUseCase = MockFetchNewsUseCase()
        viewModel = NewsViewModel(fetchNewsUseCase: mockFetchNewsUseCase ?? MockFetchNewsUseCase())
        
    }
    
    override func tearDown() {
        super.tearDown()
        mockFetchNewsUseCase = nil
        viewModel = nil
    }
    
    func testFetchNews() async throws {
        mockFetchNewsUseCase?.mockNews = MockData.newsList
        await viewModel?.fetchNews()
        XCTAssertNotNil(viewModel?.newsList)
    }
    
    func testFetchNewsWithError() async throws {
        mockFetchNewsUseCase?.mockError = NetworkClientError.invalidURL

        await viewModel?.fetchNews()
        XCTAssertEqual(viewModel?.errorMessage, NetworkClientError.invalidURL.localizedDescription, "Error message should be set")
    }
}
